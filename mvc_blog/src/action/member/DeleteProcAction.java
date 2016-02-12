package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utility.Utility;
import model.member.MemberDAO;
import action.Action;

public class DeleteProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.model사용
		String upDir=request.getRealPath("/view/member/storage");
		request.setCharacterEncoding("utf-8"); //form에서 submit으로 넘어옴
		String id = request.getParameter("id");
		String oldfile = request.getParameter("oldfile");
		MemberDAO dao=new MemberDAO();
		int cnt=dao.delete(id);
		
		if(cnt==1){
		    request.getSession().invalidate();
		    if(oldfile!=null && !oldfile.equals("member.jpg")){
		        Utility.deleteFile(upDir, oldfile);
		    }
		}		
		//2.request저장
		request.setAttribute("cnt", cnt);
		//3.view 리턴
		
		return "/view/member/deleteProc.jsp";
	}

}
