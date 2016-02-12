package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;

public class LogoutAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		session.invalidate();
		return "/view/member/logout.jsp";
	}

}
