package action.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bbs.BbsDAO;
import model.bbs.BbsDTO;
import action.Action;

public class UpdateAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.model
		int bbsno = Integer.parseInt(request.getParameter("bbsno"));
		BbsDAO dao=new BbsDAO();
		BbsDTO dto = dao.read(bbsno);
		//2.request
		request.setAttribute("dto", dto);	
		//3.view
		return "/view/bbs/updateForm.jsp";
	}

}
