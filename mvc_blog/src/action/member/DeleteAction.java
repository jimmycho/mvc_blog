package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import action.Action;

public class DeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.model사용
		MemberDAO dao=new MemberDAO();
		String id=request.getParameter("id");
		if(id==null){
		   id = (String)request.getSession().getAttribute("id");
		}
		String oldfile = request.getParameter("oldfile");
		if(oldfile==null){
		   oldfile = dao.getFname(id) ; //디비에서 가져옴
		}
		
		//2.request저장
		request.setAttribute("id", id);
		request.setAttribute("oldfile", oldfile);
		//3.view페이지 리턴
		return "/view/member/deleteForm.jsp";
	}

}
