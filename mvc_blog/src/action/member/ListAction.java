package action.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberDTO;
import utility.Paging;
import utility.Utility;
import action.Action;

public class ListAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		// 1.model사용
		request.setCharacterEncoding("utf-8");

		// 검색관련
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		// paging 관련
		int nowPage = 1; // 현재페이지
		int recordPerPage = 5; // 한페이지당 보여줄 레코드 갯수
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		MemberDAO dao=new MemberDAO();

		int total = dao.total(map);
		List<MemberDTO> list=dao.list(map);

		String paging = new Paging().paging3(total, nowPage, recordPerPage,
				col, word);

		// 2.request저장
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);

		// 3.view리턴
		return "/view/admin/list.jsp";
	}

}
