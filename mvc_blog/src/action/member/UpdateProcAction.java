package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberDTO;
import action.Action;

public class UpdateProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		//1.model사용
		request.setCharacterEncoding("utf-8");
		MemberDTO dto=new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setMname(request.getParameter("mname"));
		dto.setTel(request.getParameter("tel"));
		dto.setEmail(request.getParameter("email"));
		dto.setAddress1(request.getParameter("address1"));
		dto.setAddress2(request.getParameter("address2"));
		dto.setZipcode(request.getParameter("zipcode"));
		dto.setJob(request.getParameter("job"));
		MemberDAO dao=new MemberDAO();
		int cnt=dao.update(dto);
		
		//2.request 저장
		request.setAttribute("cnt", cnt);
		
		//3.view 페이지리턴
		return "/view/member/updateProc.jsp";
	}

}
