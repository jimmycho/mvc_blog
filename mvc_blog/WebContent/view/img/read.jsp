<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*,model.img.*" %>
<%
String root=request.getContextPath();
ImgDAO dao=new ImgDAO();
ImgDTO dto=(ImgDTO)request.getAttribute("dto");

String col = request.getParameter("col");
String word = request.getParameter("word");
String nowPage = request.getParameter("nowPage");

%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
.curImg{
margin-right:0;
border-style:solid;
border-width:3px;
border-color:red;
}
.td_padding{
padding:5px 5px
}
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function readGo(imgno){
var url ="./read.do";
url = url + "?col=<%=col%>";
url = url + "&word=<%=word%>";
url = url + "&nowPage=<%=nowPage%>"; 
url = url + "&imgno="+imgno;

location.href=url;

}
function updateB(){
	var url="update.do?imgno=<%=dto.getImgno()%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href=url;
}
 function listB(){
 var url ="list.do?col=<%=col%>";
url = url + "&word=<%=word%>";
url = url + "&nowPage=<%=nowPage%>";

 location.href=url;
 }
 
 function deleteB(){
		var url="delete.do?imgno=<%=dto.getImgno()%>";
		  url += "&oldfile=<%=dto.getFilename()%>";
<%-- 		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		 --%>
		location.href=url;	
	}
 
 function replyB(){
		var url="reply.do?imgno=<%=dto.getImgno()%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		
		location.href=url;	
	}


</script> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** --> 
<DIV style='font-size: 24px; text-align: center; text-decoration: underline; margin-top: 10px; margin-bottom: 20px;'>
  조회
</DIV>
 
<TABLE align='center' border='1px' width="50%" cellpadding='10px' cellspacing='0px'>
  
  <TR>
    <TD align="center" colspan="2">
       <img style="max-width: 50%; height: auto;"src="<%=root%>/view/img/storage/<%=dto.getFilename()%>" width="100%">
    </TD>
  </TR>
  <TR>
    <TH width="30%">제목</TH>
    <TD width="70%"><%=dto.getTitle() %></TD>
  </TR>
  <TR>
    <TH>내용</TH>
    <TD><%=dto.getContent() %></TD>
  </TR>
  <TR>
    <TH>성명</TH>
    <TD><%=dto.getWname() %></TD>
  </TR>
  
  <TR>
    <TH>조회수</TH>
    <TD><%=dto.getViewcnt() %></TD>
  </TR>
</TABLE>

<TABLE align="center" width="50%" style="margin: 10px auto">
<tr>
<%
List v = dao.getImgList(dto.getImgno());
String[] s = (String[])v.get(0);
int[] numArr = (int[]) v.get(1);
for(int i=0;i<5;i++){
if(s[i]==null){
%>
<td><img src="./storage/default.jpg" style="max-width: 10%" width="50%" border="0"></td>
<%	
}else{
if((numArr[i]==dto.getImgno())){
%>
<td class="td_padding"><a href="javascript:readGo('<%=numArr[i]%>')"><img class="curImg" src="<%=root%>/view/img/storage/<%=s[i]%>" width="50%" border='0'></a></td>	
																						

<%	
}else{
%>
<td class="td_padding"><a href="javascript:readGo('<%=numArr[i]%>')"><img src="<%=root%>/view/img/storage/<%=s[i]%>" width="50%" border='0'></a></td>
<%	
}
}
}
%>
<td></td>
</tr>
</TABLE>

 
<DIV style='text-align: center; margin-top: 20px'>
  <input type='button' value='등록' onclick="location.href='./create.do'">
  <input type='button' value='목록' onclick="listB()">
  <input type='button' value='수정' onclick="updateB('<%=dto.getImgno() %>')">
  <input type='button' value='삭제' onclick="deleteB('<%=dto.getImgno() %>')">
  <input type='button' value='답글' onclick="replyB('<%=dto.getImgno() %>')">
  <input type='button' value='다운로드'onclick="location.href='<%=request.getContextPath() %>/download?dir=/img/storage&filename=<%=dto.getFilename()%>'">

</DIV>
 
</body>
</html>