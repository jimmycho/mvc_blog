package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import action.Action;

public class IdProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		MemberDAO dao=new MemberDAO();
		int cnt=dao.duplicateId(id);
		request.setAttribute("cnt", cnt);
		return "/view/popup/id_proc.jsp";
	}

}
