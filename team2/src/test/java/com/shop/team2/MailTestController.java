package com.shop.team2;

import java.io.File;

import javax.mail.internet.MimeMessage;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MailTestController {

	@Autowired
	JavaMailSenderImpl mailSender;

	@Test
	public void mailSendTest2() throws Exception {
		String subject = "test 메일";
		String content = 
				"    <img src=\"http://localhost:8183/team2/resources/images/pinterest_profile_image.jpg\\\" alt=\"\">\r\n"
				+ "        <h1 style=\"color: cornflowerblue;\">Mood On 임시 비밀번호 안내 </h1>\r\n"
				+ "            <p> &nbsp;&nbsp;&nbsp;&nbsp;회원님의 임시 비밀번호는 \r\n"
				+ "                <strong style=\"font-size: large;\"> 123 </strong> 입니다</p>";
		String from = "whdrnr4873@naver.com";
		String to = "whdrnr4873@naver.com";

		try {
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {

				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper mailHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

					mailHelper.setFrom(from);
					mailHelper.setTo(to);
					mailHelper.setSubject(subject);
					mailHelper.setText(content, true);
					// 파일 보낼시
					FileSystemResource file = new FileSystemResource(new File("D:\\test.txt"));
					mailHelper.addAttachment("test.txt", file);
				}

			};
			mailSender.send(preparator);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
