package action.img;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import utility.UploadSave;
import model.img.ImgDAO;
import model.img.ImgDTO;
import action.Action;

public class ReplyProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		//1.model
		request.setCharacterEncoding("utf-8");
		ImgDTO dto=new ImgDTO();
		ImgDAO dao=new ImgDAO();

		// 답변 순서의 증가 
		   dao.addAnsnum(dto.getGrpno(), dto.getAnsnum()); // 부모보다 큰 순서는 전부 한칸씩 이동 
		///////////////////////////////////////////////////////
		   //업로드 폴더와 임시폴더 설정
		   String upDir=request.getRealPath("/view/img/storage");
		   String tempDir = request.getRealPath("/view/img/temp");
		   //업로드 처리 모듈객체 생성
		   UploadSave upload = new UploadSave(request,-1,-1,tempDir);   
		   //모듈객체를 이용해서 보내는 파라메터값과 파일받음
		   FileItem fileItem = upload.getFileItem("fname");
		   String fname = null;
		   if(fileItem.getSize()>0){
		       fname = UploadSave.saveFile(fileItem, upDir);
		   }else{
		       fname = "img.jpg";
		   }
		   String col = upload.getParameter("col");
		   String word = upload.getParameter("word");
		   String nowPage = upload.getParameter("nowPage");
		   
		   String title = UploadSave.encode(upload.getParameter("title"));
		   String passwd = upload.getParameter("passwd");
		   String wname = UploadSave.encode(upload.getParameter("wname"));
		   String content = UploadSave.encode(upload.getParameter("content"));
		   
		   int imgno = Integer.parseInt(upload.getParameter("imgno"));
		   int indent = Integer.parseInt(upload.getParameter("indent"));
		   int ansnum = Integer.parseInt(upload.getParameter("ansnum"));
		   int grpno = Integer.parseInt(upload.getParameter("grpno"));

		   dto.setAnsnum(ansnum);
		   dto.setFilename(fname);
		   dto.setPasswd(passwd);
		   dto.setWname(wname);
		   dto.setTitle(title); 
		   dto.setContent(content);
		   dto.setGrpno(grpno);
		   dto.setAnsnum(ansnum);
		   dto.setIndent(indent);
		   dto.setImgno(imgno);
		   
		   int cnt=dao.reply(dto);	
		
		//2.request setAttribute
		   request.setAttribute("cnt", cnt);
		   request.setAttribute("col", col);
		   request.setAttribute("word", word);
		   request.setAttribute("nowPage", nowPage);
		   System.out.println("cnt:"+cnt);
		//3.return page
		return "/view/img/replyProc.jsp";
	}

}
