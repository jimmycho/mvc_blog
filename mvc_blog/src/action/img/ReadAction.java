package action.img;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.img.ImgDAO;
import model.img.ImgDTO;
import action.Action;

public class ReadAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.model
		request.setCharacterEncoding("utf-8"); 
		int imgno = Integer.parseInt(request.getParameter("imgno"));
		String col = request.getParameter("col");
		String word = request.getParameter("word");
		String nowPage = request.getParameter("nowPage");
		
		ImgDAO dao=new ImgDAO();
		dao.addViewcnt(imgno);
		ImgDTO dto=dao.read(imgno);
		String content = dto.getContent();
		 
		content = content.replaceAll("<", "<");
		content = content.replaceAll(">", ">");
		content = content.replaceAll("\r\n", "<BR>"); 	
		
		//2.request
		request.setAttribute("dto", dto);
		//3.return page
		return "/view/img/read.jsp";
	}

}
