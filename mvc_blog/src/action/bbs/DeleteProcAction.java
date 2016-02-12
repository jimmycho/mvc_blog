package action.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bbs.BbsDAO;
import model.bbs.BbsDTO;
import action.Action;

public class DeleteProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.model사용
		BbsDTO dto = new BbsDTO();
		int bbsno=Integer.parseInt(request.getParameter("bbsno"));
		String passwd=request.getParameter("passwd");
		BbsDAO dao=new BbsDAO();
		int cnt=dao.checkPasswd(bbsno, passwd);
		
		if(cnt==1) dao.delete(bbsno);
		//2.request저장
		request.setAttribute("cnt", cnt);
		//3.view 리턴
		return "/view/bbs/deleteProc.jsp";
	}

}
