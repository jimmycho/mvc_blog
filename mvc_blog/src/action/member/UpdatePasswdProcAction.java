package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import action.Action;

public class UpdatePasswdProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.model 사용
		String id = request.getParameter("id"); 
		String passwd = request.getParameter("passwd"); 
		
		MemberDAO dao=new MemberDAO();		 
		int cnt= dao.updatePasswd(id, passwd)  ; 
		//2.request 저장
		
		request.setAttribute("cnt", cnt);
		//3.view 리턴
		return "/view/member/updatePasswdProc.jsp";
	}

}
