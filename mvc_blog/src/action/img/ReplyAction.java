package action.img;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.img.ImgDAO;
import model.img.ImgDTO;
import action.Action;

public class ReplyAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		// 1.model

		int imgno = Integer.parseInt(request.getParameter("imgno"));

		ImgDAO dao = new ImgDAO();
		ImgDTO dto = dao.readReply(imgno);
		// 2.request setattri
		request.setAttribute("dto", dto);
		// 3. return page
		return "/view/img/replyForm.jsp";
	}

}
