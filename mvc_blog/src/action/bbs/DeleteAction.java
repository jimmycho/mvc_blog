package action.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bbs.BbsDTO;
import action.Action;

public class DeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.모델
		
		//2.리퀘스트저장
		//3.뷰페이지 리턴
		
		return "/view/bbs/deleteForm.jsp";
	}

}
