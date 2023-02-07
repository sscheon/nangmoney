<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="join">
	<div>
		<h3>회원가입</h3>
	</div>
	
<form method="POST" name=joinForm id="joinForm">
	<input type="hidden" value="0" name="userGroup">
	<table id="jointalbe">
		<caption>(*)표시는 <strong>필수입력</strong>사항입니다.</caption>
		<tr>
			<th><span>*</span>이메일</th>
			<td>
			<div class="Email"> 
				<input type="text" id="userEmail" name="userEmail" placeholder="ID" autocomplete="off" required >
					<span class="dupResult"></span>
			</div>
			</td>
		</tr>
		
		<tr>
			<th><span>*</span>비밀번호</th>
			<td>
			<div class="pw">
				<input type="password" name="userPw" id="userPw" placeholder="PW" onblur="chkPW()" required>
				<span id = "confirmPw"></span>
			</div>
			</td>
		</tr>
		
		<tr>
			<th><span>*</span>비밀번호 재입력</th>
			<td>
			<div class="pw">
				<input 	type="password" name="pwConfirm" id="pwConfirm" 
						placeholder="비밀번호 입력"> 
						<span id ="confirmMsg"></span>
			</div>
			</td>
		</tr>
		
		<tr>
			<th><span>*</span>이름</th>
			<td>
			<div class="name">
				<input type="text" name="userName" placeholder="NAME" required>
			</div>
			</td>
		</tr>
		
		<tr>
			<th><span>*</span>닉네임</th>
			<td>
			<div class="userNickName">
				<input type="text" name="nickName" placeholder="nickName" required>
				<span class="nicknameDupResult"></span>
			</div>
			</td>
		</tr>
		
		<tr>
			<th><span>*</span>나이</th>
			<td>
			<div class="age">
				  <select name="age">
				    <option value="10 ~ 19">10대</option>
				    <option value="20 ~ 29">20대</option>
				    <option value="30 ~ 39">30대</option>
				    <option value="40 ~ 49">40대</option>
				    <option value="50 ~ 59">50대</option>
				  </select>
			</div>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
			<div>
				&emsp;홈페이지에 가입하시겠습니까?
				<span class="btn">
					<input type="submit" value="가입하기">&nbsp;
				</span>
			</div>
		</tr>
	</table>
	
</form>


</div>

  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
	const passConfirm = document.querySelector('input[name=pwConfirm]')
	const password = document.getElementById('userPw');				//비밀번호 
	const passwordConfirm = document.getElementById('pwConfirm');	//비밀번호 확인 값
	const confrimMsg = document.getElementById('confirmMsg');		//확인 메세지
	const correctColor = "blue";	//맞았을 때 출력되는 색깔.
	const wrongColor ="red";		//틀렸을 때 출력되는 색깔

	passConfirm.onblur = function(event){
		if(password.value == pwConfirm.value){		//password 변수의 값과 pwConfirm 변수의 값과 동일하다.
			confirmMsg.style.color = correctColor;	/* span 태그의 ID(confirmMsg) 사용  */
			confirmMsg.innerHTML ="비밀번호 일치";		/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
		}else if(!pwConfirm.value) {
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML ="비밀번호를 입력하세요";
		}
		else{
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML ="비밀번호 불일치";
		}
	}
</script>

<script>
	// 스프링의 특정 주소로 요청하하여 결과를 받고, 결과에 따라서 다른 메시지를 만들어내는 코드
	const dupCheck = document.querySelector('input[name="userEmail"]')
	const dupResult = document.querySelector('span.dupResult')
	
	dupCheck.onblur = function(event) {
		const inputId = dupCheck.value
		if(!inputId){
			dupResult.innerText = '이메일을 입력하세요'
			dupResult.style.color = 'red'
		    return false;
		}
		const url = '${cpath}/dupCheck/' + inputId
		
		console.log(url)
		
		fetch(url)						
		.then(resp => resp.text())		
		.then(text => {					
			const code = text.split(':')[0]		// 1 : 사용중, 0 : 중복없음	
			const result = text.split(':')[1]
			dupResult.innerText = result
			dupResult.style.color = code == 1 ? 'red' : 'blue'
			console.log(text)
		})
	}
</script>

<script>
	// 스프링의 특정 주소로 요청하하여 결과를 받고, 결과에 따라서 다른 메시지를 만들어내는 코드
	const nicknameCheck = document.querySelector('input[name="nickName"]')
	const nicknameDupResult = document.querySelector('span.nicknameDupResult')
	nicknameCheck.onblur = function(event) {
		const inputNickName = document.querySelector('input[name="nickName"]').value
		if(!inputNickName){
			dupResult.innerText = '닉네임을 입력하세요'
			dupResult.style.color = 'red'
		    return false;
		}
		const url = '${cpath}/nicknameDupResult/' + inputNickName
		
		console.log(url)
		
		fetch(url)						
		.then(resp => resp.text())		
		.then(text => {					
			const code = text.split(':')[0]		// 1 : 사용중, 0 : 중복없음	
			const result = text.split(':')[1]
			nicknameDupResult.innerText = result
			nicknameDupResult.style.color = code == 1 ? 'red' : 'blue'
			console.log(text)
		})
	}
</script>


<script>
const chkPw = document.querySelector('input[name="userPw"]')

chkPw.onblur = function(event) {

	 const pw = $("#userPw").val()
	 const num = pw.search(/[0-9]/g)
	 const eng = pw.search(/[a-z]/ig)
	 const spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi)

	 if(pw.length < 8 || pw.length > 20){
		confirmPw.style.color = "red"
		confirmPw.innerHTML = "8자리 ~ 20자리 이내로 입력해주세요."
	  return false
	 }else if(pw.search(/\s/) != -1){
  		confirmPw.style.color = "red"
		confirmPw.innerHTML = "비밀번호는 공백 없이 입력해주세요."
	  return false
	 }else if(num < 0 || eng < 0 || spe < 0 ){
 		confirmPw.style.color = "red"
		confirmPw.innerHTML = "영문,숫자, 특수문자를 혼합하여 입력해주세요."
	  return false
	 }else {
		console.log("통과")
		confirmPw.style.color = "blue"
		confirmPw.innerHTML = "사용가능합니다"
	    return true
	 }
}
</script>

</body>
</html>