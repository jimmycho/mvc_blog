package action.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bbs.BbsDAO;
import model.bbs.BbsDTO;
import action.Action;

public class UpdateProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8"); 
		BbsDTO dto=new BbsDTO();
		dto.setBbsno(Integer.parseInt(request.getParameter("bbsno")));
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setWname(request.getParameter("wname"));
		dto.setPasswd(request.getParameter("passwd"));
		BbsDAO dao=new BbsDAO();
		int cnt = dao.checkPasswd(dto.getBbsno(), dto.getPasswd()); 
		
		  if (cnt == 1){
			    dao.update(dto);}
		  request.setAttribute("cnt", cnt);
		
		return "/view/bbs/updateProc.jsp";
	}

}
