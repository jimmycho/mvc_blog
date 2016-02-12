package action.img;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utility.Utility;
import model.img.ImgDAO;
import model.img.ImgDTO;
import action.Action;

public class DeleteProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		// 1.model사용
		ImgDTO dto = new ImgDTO();
		int imgno = Integer.parseInt(request.getParameter("imgno"));
		String passwd = request.getParameter("passwd");
		String oldfile = request.getParameter("oldfile");
		String upDir=request.getRealPath("/view/img/storage");
		
		ImgDAO dao = new ImgDAO();
		int cnt = dao.passwdCheck(imgno, passwd);
		
		if(cnt==1){
			dao.delete(imgno);
		    request.getSession().invalidate();
		    if(oldfile!=null && !oldfile.equals("member.jpg")){
		        Utility.deleteFile(upDir, oldfile);
		    }
		}	

		// 2.request저장
		request.setAttribute("cnt", cnt);
		
		//3. return page
		return "/view/img/deleteProc.jsp";
	}

}
