function check_signup(){

	if(document.form.u_name.value == ""){
		alert("이름을 입력 해주세요 !");
		form.u_name.focus();
		return;
	}
	
	 /* 한글 id 안댐 정규식 sql에 썻던거 처럼 js 에서도 사용가능 jsp에서 쓰면 인코딩 문제 생김  test()<메소드 이름입니다 */
	 
	check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	if(check.test(document.form.u_id.value)){
		alert("id는 한글을 포함 할수 없습니다 !");
		form.u_id.focus();
		return;
	}
	
	if(document.form.u_id.value == ""){
		alert("id를 입력 해주세요 !");
		form.u_id.focus();
		return;
	}
	if (document.form.u_id.value.length < 4) {
		alert("ID는 5자리 이상 입력하세요!!");
		form.u_id.focus();
		return;
	}
	if(document.form.u_pw.value == ""){
		alert("비밀번호를 입력 해주세요 !");
		form.u_pw.focus();
		return;
	}
	if (document.form.u_jumin.value.length == "") {
		alert("주민번호를 입력해주세요 !");
		form.u_jumin.focus();
		return;
	}
	if(document.form.u_pw.value != document.form.u_pw2.value){
		alert("비밀번호가 일치 하지 않습니다 !");
		form.u_pw.focus();
		return;
	}
	
	
	if (document.form.phone2.value.length == "") {
		alert("전화번호를  입력해주세요 !");
		form.phone2.focus();
		return;
	}
	if (document.form.phone2.value.length != 4) {
		alert("전화번호를 정확히 입력해주세요 !");
		form.phone2.focus();
		return;
	}
	if (document.form.phone3.value.length == "") {
		alert("전화번호를  입력해주세요 !");
		form.phone3.focus();
		return;
	}
	if (document.form.phone3.value.length != 4) {
		alert("전화번호를 정확히 입력해주세요 !");
		form.phone3.focus();
		return;
	}

	if (document.form.u_jumin.value.length != 13) {
		alert("주민번호를 확인해주세요 !");
		form.u_jumin.focus();
		return;
	}
	
	
	form.submit();
}