package action.memo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.memo.MemoDAO;
import action.Action;

public class DeleteProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int memono = Integer.parseInt(request.getParameter("memono"));
		MemoDAO dao = new MemoDAO();
		 
		int cnt = dao.delete(memono); 
		request.setAttribute("cnt", cnt);
		return "/view/memo/deleteProc.jsp";
	}

}
