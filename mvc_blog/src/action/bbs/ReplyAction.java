package action.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bbs.BbsDAO;
import model.bbs.BbsDTO;
import action.Action;

public class ReplyAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int bbsno = Integer.parseInt(request.getParameter("bbsno"));
		BbsDAO dao = new BbsDAO();
		BbsDTO dto = dao.readReply(bbsno);

		request.setAttribute("dto", dto);

		return "/view/bbs/replyForm.jsp";

	}

}
