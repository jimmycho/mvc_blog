package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;

public class UpdateFileAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		String id=request.getParameter("id");
		String oldfile=request.getParameter("oldfile");
		
		request.setAttribute("id", id);
		request.setAttribute("oldfile", oldfile);
		
		return "/view/member/updateFileForm.jsp";
	}

}
