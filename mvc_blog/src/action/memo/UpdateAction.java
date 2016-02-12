package action.memo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.memo.MemoDAO;
import model.memo.MemoVO;
import action.Action;

public class UpdateAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		int memono = Integer.parseInt(request.getParameter("memono"));
		 
		MemoDAO dao = new MemoDAO();
		MemoVO dto = dao.read(memono);	   
		
		request.setAttribute("dto",dto);
		return "/view/memo/updateForm.jsp";
	}

}
