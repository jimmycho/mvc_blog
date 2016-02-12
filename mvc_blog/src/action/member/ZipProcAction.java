package action.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.ZipcodeDTO;
import action.Action;

public class ZipProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");  
		String dongli = request.getParameter("dongli");
		MemberDAO dao=new MemberDAO();		 
		List<ZipcodeDTO> list = dao.zipcodeList(dongli);
		request.setAttribute("list", list);	  
		
		return "/view/popup/zip_proc.jsp";
	}//execute

}//class
