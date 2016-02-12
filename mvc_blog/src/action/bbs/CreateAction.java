package action.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import action.Action;

public class CreateAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.model사용
		//2.request저장
		//3.뷰페이지 return
		return "/view/bbs/createForm.jsp";
		
	}

}
