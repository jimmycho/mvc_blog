package action; 

// JSP상에서의 request 내부 객체 
// String id = request.getParameter("id"); 
import javax.servlet.http.HttpServletRequest; 

// JSP상에서의 response 내부 객체 
// out.println(id); 
// response.sendRedirect("./test.jsp"); 
import javax.servlet.http.HttpServletResponse; 

/** 
 * 표준 인터페이스 
 * @author stu 
 */ 
public interface Action { 
    /** 
     * 로직 처리 메소드 
     * @param request 내부 객체 
     * @param response 내부 객체 
     * @return 처리 결과 문자열 
     * @throws Throwable 
     */ 
    public String execute( 
        HttpServletRequest request, HttpServletResponse response) 
    throws Throwable; 
}  