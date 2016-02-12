package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.MemberDAO;
import model.member.MemberDTO;
import action.Action;

public class ReadAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
	    //관리자 회원목록에서 이름을 클릭하고 올때
		String id = request.getParameter("id");
		HttpSession session=request.getSession();
		 
		    //일반사용자가 로그인후 나의정보를 클릭하고 올때
		    if(id==null){
		        id = (String)session.getAttribute("id");
		    }
		    MemberDAO dao=new MemberDAO();
		    MemberDTO dto = dao.read(id);
		    request.setAttribute("dto", dto);
		    
		return "/view/member/read.jsp";
	}

}
