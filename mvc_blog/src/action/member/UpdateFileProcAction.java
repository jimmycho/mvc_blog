package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import utility.UploadSave;
import utility.Utility;
import model.member.MemberDAO;
import action.Action;

public class UpdateFileProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.model사용
		request.setCharacterEncoding("utf-8");
		
		String upDir=request.getRealPath("/view/member/storage");
		String tempDir = request.getRealPath("/view/member/temp");
		String fname = null;
		
		//업로드 처리 모듈 생성
		UploadSave upload = new UploadSave(request, -1, -1, tempDir);
		//보내지는 파라메터값(id,oldfile)를 받는다
		String id = upload.getParameter("id");
		String oldfile = UploadSave.encode(upload.getParameter("oldfile"));//파일명 한글처리
		
		FileItem fileItem = upload.getFileItem("fname");
		
		int size = (int) fileItem.getSize();
		if (size  > 0) {//변경할 사진이 업로드 됨
			if (oldfile != null && !oldfile.equals("member.jpg"))
				Utility.deleteFile(upDir, oldfile);//웹서버에 존재하는 변경전 파일 삭제
			fname = UploadSave.saveFile(fileItem, upDir);
		}
		
		//2.request저장

		//dao의 updateFile() 사진이름을 변경
		MemberDAO dao=new MemberDAO();
		int cnt = dao.updateFile(id, fname);
		request.setAttribute("cnt", cnt);
		
		//3.view 전달
		return "/view/member/updateFileProc.jsp";
	}

}
