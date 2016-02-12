package action.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bbs.BbsDAO;
import model.bbs.BbsDTO;
import action.Action;

public class ReadAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		//1.model
		int bbsno = Integer.parseInt(request.getParameter("bbsno"));
		BbsDAO dao=new BbsDAO();
		dao.increaseViewcnt(bbsno);
		BbsDTO dto=new BbsDTO();
		dto = dao.read(bbsno);
		String content = dto.getContent();
		dto.setContent(content.replaceAll("\r\n", "<br>"));
		
		//2.request
		request.setAttribute("dto", dto);
		//3.view
		return "/view/bbs/read.jsp";
	}

}
