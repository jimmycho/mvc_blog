package action.img;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.img.ImgDAO;
import model.img.ImgDTO;
import action.Action;

public class UpdateAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.model
		int imgno = Integer.parseInt(request.getParameter("imgno"));

		ImgDAO dao=new ImgDAO();
		ImgDTO dto = dao.read(imgno);

		//2.request setatt
		request.setAttribute("dto", dto);
		
		//3.return page
		return "/view/img/updateForm.jsp";
	}

}
