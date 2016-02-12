<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*,model.member.*" %>
<%
List<ZipcodeDTO> list=(List<ZipcodeDTO>)request.getAttribute("list");
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
.zip{ 
  background-color: #AAFFAA; 
  width:90%; 
  text-align:left ; 
  margin: 0 auto;
  margin-left:  10px; 
  padding-left: 40px; 
} 
</style> 
<script type="text/javascript">
//window.open()메소드를 호출한 document객체 
function sendAddress(zipcode, sido, gugun, dongli, etc){ 
  // 주소 조합 
  var address =sido+" "+gugun+" "+dongli+" "+etc; 
     
  // opener: window.open()함수를 호출한 브러우저 문서 객체 
  // 회원 가입 폼의 zipcode 
  opener.document.frm.zipcode.value=zipcode;   // 주소 
  // 회원 가입 폼의 address 
  opener.document.frm.address1.value=address;  // 세부 주소 
  // 상세 주소 입력 준비 
  opener.document.frm.address2.focus(); 
        
  self.close(); 
} 
</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body leftmargin="0" topmargin="0">
 
<DIV class="title">우편번호 검색</DIV>
 
<DIV class="content">
<% 
//현재 동이름을 입력한 후 검색상태라면 
 
if (list.size() == 0){ 
%> 
   
   <br>검색된 결과가 없습니다. 
   <a href='javascript:history.back()'>다시 입력</a> 
  
<% 
}else{ 
%> 
  <br> 
    ※ 아래 우편번호를 클릭하면 자동으로 입력됩니다.<br><br> 
 
  
  <DIV class="zip"> 
<% 
  for(int i=0; i < list.size(); i++){ 
    ZipcodeDTO dto = (ZipcodeDTO)list.get(i); 
        
    String zipcode = dto.getZipcode(); 
    String sido = dto.getSido().trim();      // 공백 제거 
    String gugun = dto.getGugun().trim();    // 공백 제거 
    String _dongli = dto.getDongli().trim(); // 공백제거 
    String etc = dto.getEtc().trim();        // 공백 제거 
%> 
    <a href="javascript:sendAddress('<%=zipcode%>','<%=sido%>','<%=gugun%>','<%=_dongli%>','<%=etc%>')"> 
      <%=zipcode%> <%=sido%> <%=gugun%> <%=_dongli%> <%=etc%> 
    </a> 
    <br> 
 
<%         
  } //for end
}//if end 
%> 
</DIV>
</DIV>
  
<DIV class='bottom'>
  <input type='submit' value='다른우편번호 검색' onclick="history.back()">
  <input type='button' value='닫기' onclick="window.close()">
</DIV>
 
</body>
</html> 