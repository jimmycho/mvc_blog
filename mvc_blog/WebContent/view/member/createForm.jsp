<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 16px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript"> 
  // 입력 값 검사후 서버로 전송 
  function inputCheck(){ 
    var f = document.frm; // <FORM>태그 객체 
     
    if(f.id.value == ""){ 
      alert("아이디를 입력해 주세요."); 
      f.id.focus(); // 폼이름.input 태그명.커서 셋팅    
 
      return;       // 프로그램 종료, 값을 돌려줌 
    } 
    if(f.passwd.value == ""){ 
      alert("비밀번호를 입력해 주세요."); 
      f.passwd.focus(); 
      return; 
    } 
    if(f.repasswd.value == ""){ 
      alert("비밀번호를 확인해 주세요"); 
      f.repasswd.focus(); 
      return; 
    } 
     
    //비밀번호가 일치하는지 검사 
    if(f.passwd.value != f.repasswd.value){ 
      alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요."); 
      f.passwd.focus(); 
      return; 
    } 
     
    if(f.mname.value == ""){ 
      alert("이름을 입력해 주세요."); 
      f.mname.focus(); 
      return; 
    } 
 
    if(f.email.value == ""){ 
      alert("이메일을 입력해 주세요."); 
      f.email.focus(); 
      return; 
    } 
 
    if(f.job.value == "0"){ 
      alert("직업을 선택해 주세요."); 
      f.job.focus(); 
      return; 
    } 
    // Form onsubmit 이벤트일경우 
    // return false; 
     
    f.submit(); 
  } 
 
  // 중복 아이디를 검사합니다. 
  function idCheck(id){ 
    if(id == ""){ 
      window.alert("아이디를 입력해 주세요."); 
      f.id.focus(); // 커서 이동 
    }else{ 
      url="./id_proc.do?id=" + id;  // GET 
      wr = window.open(url,"아이디검색","width=500,height=400"); 
      wr.moveTo((window.screen.width-500)/2, (window.screen.height-400)/2);// x, y 
    } 
  } 
 
  //중복 이메일을 검사합니다. 
  function emailCheck(email){ 
    if(email == ""){ 
      window.alert("이메일을 입력해 주세요."); 
      f.email.focus(); 
    }else{ 
      url="./email_proc.do?email=" + email;  // GET 
      wr = window.open(url,"이메일검색","width=500,height=400"); 
      wr.moveTo((window.screen.width-500)/2, (window.screen.height - 400)/2);// x, y 
    } 
  } 
 
  // 우편번호 검색 
  function zipCheck(){ 
    url="./zip_form.do"; 
    wr = window.open(url,"우편번호 검색","width=550 ,height=450"); 
    wr.moveTo((window.screen.width-550)/2, (window.screen.height - 450)/2);// x, y 
  } 
 
</script> 
 
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
<DIV class="title">회원 가입 (* 필수 입력)</DIV>
 
<FORM name='frm' 
      method='POST' 
      action='./createProc.do'
      enctype='multipart/form-data'   
      onsubmit="return inputCheck()">
     
     <!-- <!-- 이 경우에 request.getParameter 사용불가함 --> 
      
  <TABLE class='table' width="80%">
    <tr> 
       <th width="20%"> 사진</th> 
       <td width="53%"><input type='file' name='fname' value=''></td> 
       <td width="27%">사진은 jpg, png로 올려주세요.</td> 
     </tr> 
     <tr>  
       <th>*아이디</th> 
       <td> 
           <input type="text" name="id" size="15" value='user1'> 
           <input type="button" value="ID중복확인"  
                  onclick="idCheck(document.frm.id.value)"> 
                  <!-- 
                  document.frm.id.value = this.form.id.value와 동일 
                    
                  this: Button 태그 
                  form: Button 태그가 있는 폼 
                  id: id란 이름을 가지고 있는 태그 
                  value: id태그의 태그의 값  
                  --> 
       </td> 
       <td>아이디를 적어 주세요.</td> 
     </tr> 
    <tr>  
       <th>*패스워드</th> 
       <td> <input type="password" name="passwd" size="15" value='1234'> </td> 
       <td>패스워드를 적어주세요.</td> 
     </tr> 
     <tr>  
       <th>*패스워드 확인</th> 
       <td> <input type="password" name="repasswd" size="15" value='1234'> </td> 
       <td>패스워드를 확인합니다.</td> 
     </tr> 
     <tr>  
       <th>*이름</th> 
       <td> <input type="text" name="mname" size="15" value='왕눈이'> </td> 
       <td>고객실명을 적어주세요.</td> 
     </tr> 
     <tr>  
       <th>전화번호</th> 
       <td><input type="text" name="tel" value="123-1234"></td> 
       <td> </td> 
     </tr>           
     <tr>  
       <th>이메일</th> 
       <td> 
           <input type="text" name="email" size="27"  value='email@mail.com'> 
           <input type="button" value="Email 중복확인"  
                   onclick="javascript:emailCheck(document.frm.email.value)"> 
        
       </td> 
       <td>이메일을 적어주세요.</td> 
     </tr> 
     <tr>   
       <th>우편번호</th> 
       <td> <input type="text" name="zipcode" size="10" value='111-111'> 
            <input type="button" name="btnPost" value="우편번호찾기"  
                  onclick="zipCheck()"></td> 
       <td>우편번호를 검색 하세요.</td> 
     </tr> 
     <tr>   
       <th>주소</th> 
       <td> 
       <input type="text" name="address1" size="45" value='인천시 남동구 간석4동'><br/> 
       <input type="text" name="address2" size="45" value=''> 
       </td> 
       <td>주소를 적어 주세요.</td> 
     </tr> 
     <tr>   
       <th>직업</th> 
       <td> 
           <select name='job'> 
               <option value="0">선택하세요.</option> 
               <option value="A01">회사원</option> 
               <option value="A03" selected>전산관련직</option> 
               <option value="A05">연구전문직</option> 
               <option value="A07">각종학교학생</option> 
               <option value="A09">일반자영업</option> 
               <option value="A11">공무원</option> 
               <option value="A13">의료인</option> 
               <option value="A15">법조인</option> 
               <option value="A17">종교.언론/예술인</option> 
               <option value="A19">농업</option> 
               <option value="A23">축산업</option> 
               <option value="A25">수산업</option> 
               <option value="A27">광업</option> 
               <option value="A30">주부</option> 
               <option value="A32">무직</option> 
               <option value="A99">기타</option> 
             </select> 
         </td> 
       <td>직업을 선택 하세요.</td> 
     </tr>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='회원가입'>
    <input type='reset' value='취소'>
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 