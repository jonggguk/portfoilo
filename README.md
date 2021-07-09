# portfoilo
기능 구현 설명 
spring mvc 

1.회원가입(signup)
  1.ajax를 이용한 비동기식 방식으로 DB로 부터 id를 읽어와 id중복검사를 할수있다 
  2.id중복검사를 하지않고는 가입하기 버튼을 누를수 없고 중복검사를 했더라도 id입력값을 바꾸면 다시 중복검사를 해야 한다
  3.주소  api를 사용하여 주소를 선택하고 DB에 저장할수있다

2.로그인(login)
  1.mysql을 이용하여 user테이블의 값을 가져와 id와 pw를 비교한다 
  2.로그인 유지 쿠키를사용하여 로그인유지시 하루를 기준 쿠키가 유지된다 (다시 로그인 하지않고도 세션과 쿠키에 정보가 저장된다)

3.비밀번호찾기(findpw)
  1.비밀번호를 찾을 id와 email을 입력한다
    1.ajax를통해 DB에 저장된 id의 email 이 같은지 확인하고 같지않다면 인증을 할수없게 막아둔다 
    2.임시비밀번호 = id와email인증이 되었다면 임시비밀번호로 update해준다 
  2.이메일을 통한 비밀번호 재설정 
    1.인증이 되었다면 (naver)이메일로 비밀번호가 보내지고 보내진 비밀번호로 로그인 할수있다
    ★(email설정 naver 이메일 을 기준으로 하여 SMTP 사용을 하여야 기능 사용가능 !!!!)★
4.mypage
  1.세션에 유저 정보가 있지 않다면 (로그인 하지 않았다면) mypage로 들어갈수 없고 로그인하라는 메세지가 출력된다
  2.회원가입시 입력 하였던 정보들을 볼수있다 
  3.로그아웃을 하여 세션과 쿠키를 초기화 한다 

5.회원정보변경
  1.비밀번호 변경 현재의 비밀번호와 새로운 비밀번호를 입력받아 비밀번호를 변경한다 (현재 비밀번호가 다른경우 비밀번호 변경은 되지않는다)
  2.정보수정하기 전화번호와 email,address 를 입력받고 변경한다 (입력하지 않았다면 DB에 저장되어있는값 = 회원가입시 입력한값 으로 저장)
  
    
