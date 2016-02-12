package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import action.Action;

public class EmailProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		MemberDAO dao=new MemberDAO();
		int cnt=dao.duplicateEmail(email);
		request.setAttribute("cnt", cnt);
		return "/view/popup/email_proc.jsp";
	}

}
