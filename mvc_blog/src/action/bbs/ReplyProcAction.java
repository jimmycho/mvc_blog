package action.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bbs.BbsDAO;
import model.bbs.BbsDTO;
import action.Action;

public class ReplyProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.model
		request.setCharacterEncoding("utf-8"); 
		BbsDTO dto=new BbsDTO();
		dto.setBbsno(Integer.parseInt(request.getParameter("bbsno")));
		dto.setGrpno(Integer.parseInt(request.getParameter("grpno"))); 
		dto.setIndent(Integer.parseInt(request.getParameter("indent"))); 
		dto.setAnsnum(Integer.parseInt(request.getParameter("ansnum"))); 
	  
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setWname(request.getParameter("wname"));
		dto.setPasswd(request.getParameter("passwd"));
		
		BbsDAO dao=new BbsDAO();
		
		dao.addAnsnum(dto.getGrpno(), dto.getAnsnum());
		int cnt=dao.reply(dto);
		
		//2.request
		request.setAttribute("cnt", cnt);
		
		//3.return view page
		return "/view/bbs/replyProc.jsp";
	}
}
