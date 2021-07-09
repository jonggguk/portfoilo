package com.shop.team2.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.team2.dto.UserDto;
import com.shop.team2.service.UserService;

import myUtil.HanConv;

@Controller

public class UserController {
	@Autowired
	private JavaMailSender mailSender;

	@Inject
	private UserService service;
	/* ================== jsp 연결만 해주는 부분 ================= */
	private String pw = "";

	@RequestMapping("/main")
	public String main(Model model) throws Exception {
		return "main";
	}

	@RequestMapping("/login")
	public String login(Model model) throws Exception {
		return "login";
	}

	@RequestMapping("/go_to_signup")
	public String go_to_signup() {
		return "signup";
	}

	@RequestMapping("/deleteUser")
	public String deleteUser() throws Exception {
		return "deleteUser";
	}

	@RequestMapping("/updateuser")
	public String updateuser() throws Exception {
		return "updateuser";
	}

	@RequestMapping("/change_pw")
	public String change_pw() throws Exception {
		return "change_pw";
	}

	@RequestMapping("/findPw")
	public String findPw() throws Exception {
		return "findPw";
	}

	/* ================== 기능 구현 부분 ================= */

	/* 로그인 성공 후 메세지와 실패후 메세지 출력 */
	@RequestMapping(value = "/loginOk", method = RequestMethod.POST)
	public String loginOk(UserDto user, HttpServletRequest request, Model model, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession();

		String loginChk = request.getParameter("loginChk");
		UserDto loginOk = service.loginOk(user);

		if (loginOk == null) {
			session.setAttribute("id", null);
			session.setAttribute("pw", null);
			session.setAttribute("userInfo", null);
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("url", "/main");
		} else {
			/* 로그인 유지 버튼을 체크한 경우 쿠키생성 */
			if (loginChk != null) {
				Cookie c = new Cookie("id", URLEncoder.encode(loginOk.getU_id(), "UTF-8"));
				c.setMaxAge(24 * 60 * 60); // 쿠키 유지 시간 하루
				c.setPath("/");
				response.addCookie(c);
				session.setAttribute("userInfo", loginOk);
			}

			session.setAttribute("userInfo", loginOk);
			session.setAttribute("pw", loginOk.getU_pw());
			session.setAttribute("id", loginOk.getU_id());
			model.addAttribute("msg", "로그인 성공");
			model.addAttribute("url", "/main");
		}

		return "alert";
	}

	/* 로그아웃시 > 쿠키삭제+세션초기화 */
	@RequestMapping("/logout_ok")
	public String logout_ok(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.invalidate();
		Cookie[] c = request.getCookies();
		if (c != null) {
			for (Cookie cf : c) {
				if (cf.getName().equals("id")) {
					cf.setMaxAge(0);
					cf.setPath("/");
					response.addCookie(cf);
					request.getSession().invalidate();
				}
			}
		}
		return "redirect:main";
	}

	/* 마이페이지 > 로그인 안되있으면 들어오지 못한다 + 로그인 유지 한경우 유지값 받아오기 */
	@RequestMapping("/mypage")
	public String mypage(Model model, HttpServletRequest request, HttpSession session) throws Exception {
		Cookie[] c = request.getCookies();
		if (c != null) {
			for (Cookie cf : c) {
				if (cf.getName().equals("id")) {
					String ids = URLDecoder.decode(cf.getValue(), "UTF-8");
					session.setAttribute("id", ids);
				}
			}
		}
		/* session = request.getSession(); */
		String u_id = (String) session.getAttribute("id");

		List<UserDto> user = service.showUser(u_id);
		model.addAttribute("user", user);

		return "mypage";
	}

	/* 회원가입 */
	@RequestMapping(value = "/signup_ok", method = RequestMethod.POST)
	public String signup_ok(HttpServletRequest request, UserDto userDto, Model model) throws Exception {
		String u_name = HanConv.toKor(request.getParameter("u_name"));
		userDto.setU_name(u_name);

		// 번호 3개를 입력받아 하나로 합쳐준다
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		userDto.setU_phone(phone1 + phone2 + phone3);
		// 주소도 전부 다 받아와서 합쳐준다
		String address = request.getParameter("postcode") + request.getParameter("roadAddress")
				+ request.getParameter("jibunAddress") + request.getParameter("extraAddress");
		address = HanConv.toKor(address);
		userDto.setU_address(address);

		service.signup(userDto);
		model.addAttribute("msg", "가입성공 회원으로 로그인 해주세요!");
		model.addAttribute("url", "/login");
		return "signupAlert";
	}

	/* 회원 탈퇴 */
	@RequestMapping(value = "/deleteOk", method = RequestMethod.POST)
	public String deleteOk(HttpSession session, UserDto userDto, RedirectAttributes rttr, Model model)
			throws Exception {
		/* 세션에 저장된 id,pw == 로그인한 유저 정보 */
		String oldId = (String) session.getAttribute("id");
		String oldPw = (String) session.getAttribute("pw");

		/* dto에 저장된 id,pw == 입력받을 유저 정보 */
		String newId = userDto.getU_id();
		String newPw = userDto.getU_pw();

		/* 아이디와 비밀번호가 서로 다르면 msg 는 fasle */
		if (!(oldPw.equals(newPw)) || !(oldId.equals(newId))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/deleteUser";
		} else {
			service.deleteUser(userDto);
			session.invalidate();
		}
		return "main";
	}

	/* 회원 정보 수정 */
	@RequestMapping("/updateOk")
	public String updateOk(UserDto userDto, HttpServletRequest request, HttpSession session) throws Exception {

		UserDto sessionDto = (UserDto) session.getAttribute("userInfo");

		// 번호 3개를 입력받아 하나로 합쳐준다
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String u_phone = (phone1 + phone2 + phone3);
		// 주소도 전부 다 받아와서 합쳐준다
		String address = request.getParameter("postcode") + request.getParameter("roadAddress")
				+ request.getParameter("jibunAddress") + request.getParameter("extraAddress");
		address = HanConv.toKor(address);

		// 수정시 전화번호를 입력하지 않았다면 > 010밖에 값이 오지않음
		if (u_phone.equals("010")) {
			// 입력받은 번호가 010 밖에 없으면 sessionDto < 세션에 저장된 유저의 정보를 가진 DTO의 값을 가져와서 저장
			userDto.setU_phone(sessionDto.getU_phone());
		} else {
			userDto.setU_phone(phone1 + phone2 + phone3);
		}
		if (request.getParameter("u_email").equals("")) {
			userDto.setU_email(sessionDto.getU_email());
		}
		if (address.equals("")) {
			userDto.setU_address(sessionDto.getU_address());
		} else {
			userDto.setU_address(address);
		}

		service.updateUser(userDto);

		return "redirect:main";
	}

	@RequestMapping("/changepwOk")
	public String changepwOk(UserDto userDto, HttpServletRequest request, RedirectAttributes rttr, HttpSession session)
			throws Exception {
		String nowPw = request.getParameter("nowPw");
		System.out.println(nowPw);

		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		if (!userInfo.getU_pw().equals(nowPw)) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/change_pw";
		}
		service.changeOk(userDto);
		return "redirect:/mypage";
	}

	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest request) throws Exception {
		String u_id = HanConv.toKor(request.getParameter("u_id"));
		UserDto userDto = service.idCheck(u_id);
		int re = 0;
		if (userDto != null) {
			re = 1;
		}
		return re;
	}

	@ResponseBody
	@RequestMapping(value = "/emailCk", method = RequestMethod.POST)
	public int emailCk(HttpServletRequest request) throws Exception {
		String u_id = HanConv.toKor(request.getParameter("u_id"));
		String email = request.getParameter("u_email");
		UserDto userDto = (UserDto) service.readUser(u_id);
		// re = 0 id가 같은 회원없음 1 = 아이디 같은 회원있음 re = -1 이메일이 다름
		int re = 0;
		if (userDto != null) {
			re = 1;
			if (!userDto.getU_email().equals(email)) {
				re = -1;
			} else {
				re = 1;
			}
		}

		if (re == 1) {

			for (int i = 0; i < 5; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			userDto.setU_pw(pw);
			service.updatePw(userDto);
			
		}
 
		
		return re;
	}

	// 메일보내기 네이버에 가입되어있는 아이디 
	@RequestMapping(value = "/sendMail", method = RequestMethod.POST)
	public String sendMail(HttpServletRequest request, UserDto userDto) throws Exception {
		String u_id = request.getParameter("u_id");
		UserDto user = service.readUser(u_id);
		String UserName =user.getU_name();
		String Useremail = user.getU_email();
		
		/* 메일제목 */
		String subject = "Mood On 임시비밀번호 안내";
		/* 메일내용 이미지쪽 에러 = 해당이미지가 없어서 그러니 img 태그를 지워주시면 됩니다 기능과는 상관없음 */
		String content = "    <img src=\"//whdrnr4873.ivyro.net/logo.jpg\" alt=\"\">\r\n"
				+ "        <h1 style=\"color: cornflowerblue;\"> Mood On 임시 비밀번호 안내 입니다</h1>\r\n"
				+ "            <p> &nbsp;&nbsp;&nbsp;&nbsp;<strong style=\"font-size: large;\">"+ UserName +"</strong>회원님의 임시 비밀번호는 \r\n"
				+ "                <strong style=\"font-size: large;\">" + pw + "</strong> 입니다</p>";
		/* 받는사람 */
		String from = Useremail;
		/* 보내는사람 */
		String to = "whdrnr4873@naver.com";

		try {
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {

				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper mailHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

					mailHelper.setFrom(from);
					mailHelper.setTo(to);
					mailHelper.setSubject(subject);
					mailHelper.setText(content, true); 
					// 파일 보낼시 압축 파일도 가능함 
					//FileSystemResource file = new FileSystemResource(new File("D:\\Weekly Best Item.zip"));
					//mailHelper.addAttachment("Weekly Best Item.zip", file);
					
					
					FileSystemResource file = new FileSystemResource(new File("D:\\MoodOn.txt"));
					mailHelper.addAttachment("MoodOn.txt", file);
				}

			};
			mailSender.send(preparator);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수신자 설정 해주세요 !");
		}
		 pw="";
		return "redirect:login";

	}

}
