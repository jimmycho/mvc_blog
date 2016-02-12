package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.MemberDAO;
import model.member.MemberDTO;
import action.Action;

public class UpdateAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		// 1.model사용
		
		// 나의정보의 정보수정을 클릭했을때
		String id = request.getParameter("id");
		 //HttpSession session=request.getSession();
		// 메뉴에서 바로 정보수정을 클릭했을때
		if (id == null) {
			id = (String) request.getSession().getAttribute("id");
		//	id=(String) session.getAttribute(id);
		}
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.read(id);
		
		// 2.request저장
		request.setAttribute("dto", dto);
		
		// 3.view 페이지리턴
		return "/view/member/updateForm.jsp";
	}
}
