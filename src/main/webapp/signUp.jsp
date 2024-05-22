<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="network.shop.common.ShopVO" %>
<%@ page import="network.shop.common.ShopDAO" %>
    
<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8">
<title>회원가입</title>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="./css/Signup.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script type="text/javascript">

// 유효성 검사 메서드
function Validation() {
    // 변수에 저장
    var id = document.getElementById("id")
    var pw = document.getElementById("pw")
    var cpw = document.getElementById("cpw")
    var phone = document.getElementById("phone")
    var email = document.getElementById("email")
    var zipcode = document.getElementById("zipcode")
    var adress1 = document.getElementById("adress1")
    var adress2 = document.getElementById("adress2")
   

    //아이디 확인
    if(id.value.length <4){
        alert("아이디를 4글자 이상 입력하세요.")
        id.focus();
        return false;
    }
    //아이디 영어 대소문자 확인
    else if(!checkEngphoneber(id.value)){
        alert("영문 대소문자, 숫자만 입력하세요.")
        id.focus();
        return false;
    }

    //비밀번호 확인
    if(pw.value.length <4){
    	return false;
        alert("비밀번호를 4글자 이상 입력하세요.")
        pw.focus();
        
    }
    //비밀번호 영어 대소문자 확인
    else if(!checkEngphoneber(pw.value)){
        alert("영문 대소문자, 숫자만 입력하세요.")
        pw.focus();
        return false;
    }
    //비밀번호와 아이디 비교
    else if(pw.value == id.value){
        alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.")
        pw.focus();
        return false;
    }
    
    //비밀번호 확인
    if(cpw.value !== pw.value){
        alert("비밀번호와 동일하지 않습니다.")
        cpw.focus();
        return false;
    }

    //메일주소 확인
    if(email.value.length == 0){
        alert("메일주소를 입력하세요.")
        email.focus();
        return false;
    }

    else if(email.value.indexOf("@") == -1 || email.value.indexOf(".") == -1 || email.value.length <=5){
        alert("잘못된 이메일 형식입니다.")
        email.focus();
        return false;
    }
    
   //전화번호 확인
    if(phone.value == ""){
        alert("전화번호를 입력하세요.")
        phone.focus();
        return false;
    }


    //주소 확인
    if(zipcode.value == ""){
        alert("주소를 입력하세요.")
        zipcode.focus();
        return false;
    }

}

// 문자열이 영어, 숫자인지 확인하는 메서드 
function checkEngphoneber(value){
    var count = 0;

    for(var i=0; i<value.length; i++){
        if((value.charCodeAt(i)>=65 && value.charCodeAt(i)<=90) || (value.charCodeAt(i)>=97 && value.charCodeAt(i)<=122) || (value.charCodeAt(i)>=48 && value.charCodeAt(i)<=57)){
            count += 1;
        }
    }

    //카운트 수와 문자의 길이가 같다면 true
    if(count === (value.length)){
        return true;
    } else{
        return false;
    }
}

//영어, 한글인지(가~힣) 확인
function checkKorEng(value){
    var count = 0;

    for(var i=0; i<value.length; i++){
        console.log(value.charCodeAt(i));
        if((value.charCodeAt(i)>=65 && value.charCodeAt(i)<=90) || (value.charCodeAt(i)>=97 && value.charCodeAt(i)<=122) || (value.charCodeAt(i)>=44032 && value.charCodeAt(i)<=55203)){
            count += 1;
        }
    }

    if(count === (value.length)){
        return true;
    } else{
        return false;
    }
}

function execDaumPostcode() {
	  new daum.Postcode({
	        oncomplete: function(data) {
	            var fullAddr = '';
	            var extraAddr = '';
	            
	            if (data.userSelectedType === 'R') fullAddr = data.roadAddress;
	            else fullAddr = data.jibunAddress;

	            if(data.userSelectedType === 'R') {
	                if(data.bname !== '') extraAddr += data.bname;
	                if(data.buildingName !== '') extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }

             document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	           //옛날구번호 document.getElementById("jusocode").value = data.postcode;
	           document.getElementById("adress1").value = fullAddr;
             //document.getElementById("zipcode").value = data.postcode;
	        }
	  }).open();
 }//execDaumPostcode end   

 function myInfo() {
	 
	 var dcode = document.getElementById("id").value;
  	 if(dcode==null || dcode==""){
	    alert("중복체크 아이디를 입력해야 합니다");
		return true; 
     }else{
    	 window.open("ShopID.jsp?idx="+dcode,"title","left=500,top=300,width=500,height=200"); 
     }
  	  
  }//myInfo() end
 
 
</script>

<body>
<br>
<div align="center">

</div>
<br><br>
<form id="userinfoForm" action="signUpSave.jsp" method="get" onsubmit="return Validation();">
    <table text-align="center" align="center" border="1" width="800" height="600" cellspacing="0">
    	<tr>
            <td bgcolor="#c8d6e5" align="center" colspan="2" height="50"> <h1 class="mb-3">Sign  Up</h1> </td>
        </tr>
        <tr>
            <td bgcolor="#c8d6e5" align="center" width="150" class=mytitle>User ID:</td>
            <td bgcolor="#ecf0f3"> <input type="text" size="20" name="id" id="id" minlength="4" maxlength="12" class=myinput> &nbsp;<button onclick="myInfo();" class="btn btn-warning btn-sm">중복확인</button> </td> 
        	
        </tr>
        <tr>
            <td bgcolor="#c8d6e5" align="center" class=mytitle>Password:</td>
            <td bgcolor="#ecf0f3"> <input type="password" size="30" name="pw" id="pw" minlength="4" maxlength="12" class=myinput > 4~12자의 영문 대소문자의 숫자로만 입력</td>
        </tr>
        <tr>
            <td bgcolor="#c8d6e5" align="center" class=mytitle>Repeat Password:</td>
            <td bgcolor="#ecf0f3"><input type="password" size="30" name="cpw" id="cpw" class=myinput></td>
        </tr>
        <tr>
            <td bgcolor="#c8d6e5" align="center" class=mytitle>Email:</td>
            <td bgcolor="#ecf0f3"><input type="email" size="30" name="email" id="email" class=myinput placeholder= "  name@example.com"> </td>
        </tr>
        
        <tr>
            <td bgcolor="#c8d6e5" align="center" class=mytitle>Phone Number:</td>
            <td bgcolor="#ecf0f3"><input maxlength="13" type="text" size="30" name="phone" class=myinput placeholder= "  010-0000-0000"> </td>
        </tr>
        <tr>
            <td bgcolor="#c8d6e5" align="center" class=mytitle>Adress:</td>
            <td bgcolor="#ecf0f3" class=mytitle>
	           
	            우편번호: <input type=text  name="zipcode" id="zipcode" size="8" class=myinput > &nbsp;
	   			 <input type=button  onclick="execDaumPostcode();" value="우편번호" class="btn btn-success btn-sm">
	   		 <br> 
	    		기본주소: <input type=text  name="adress1"  id="adress1" size=30 class=myinput> <br>
	    		상세주소: <input type=text  name="adress2"  id="adress2" size=30 class=myinput> <br>
	            <span id="zipcode_ch"></span>
            </td>
        </tr>
        
    </table>
    <br>
    <div align="center">
        <input type="submit" width="30" id="btn" value="제출" class="btn btn-primary btn-lg"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" onclick="alert('초기화 했습니다.')" value="다시 입력" class="btn btn-primary btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" width="30" id="btn" value="Login" onclick="location.href='login.jsp'" class="btn btn-primary btn-lg">
        </div>
    </form>
</body>
</html>