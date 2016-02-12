package action.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bbs.BbsDAO;
import model.bbs.BbsDTO;
import action.Action;

public class CreateProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		//1.모델사용
		BbsDTO dto=new BbsDTO();
		request.setCharacterEncoding("UTF-8");
		dto.setWname(request.getParameter("wname"));
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setPasswd(request.getParameter("passwd"));
		
		BbsDAO dao=new BbsDAO();
		int cnt=dao.create(dto);		
		
		//2.리퀘스트 저장
		request.setAttribute("cnt", cnt);
		//3.뷰페이지 리턴
		return "/view/bbs/createProc.jsp";
	}

}
