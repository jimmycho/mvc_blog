package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;

public class UpdatePasswdAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		return "/view/member/updatePasswdForm.jsp";
	}

}
