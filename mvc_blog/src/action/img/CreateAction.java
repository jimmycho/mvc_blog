package action.img;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;

public class CreateAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.model
		//2.request setatt.
		//3.return page
		return "/view/img/createForm.jsp";
	}

}
