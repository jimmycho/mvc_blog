package action.img;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.img.ImgDAO;
import model.img.ImgDTO;

import org.apache.commons.fileupload.FileItem;

import utility.UploadSave;
import action.Action;

public class CreateProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.model
		request.setCharacterEncoding("utf-8"); 
		 
	    //업로드 폴더와 임시폴더 설정
	    String upDir = request.getRealPath("/view/img/storage");
	    String tempDir = request.getRealPath("/view/img/temp");
	    //업로드 처리 모듈객체 생성
	    UploadSave upload = 
	    new UploadSave(request,-1,-1,tempDir) ;   
	    //모듈객체를 이용해서 보내는 파라메터값과 파일받음
	    FileItem fileItem = upload.getFileItem("filename");

	    int size = (int)fileItem.getSize();
	    String filename = null;
	    if(size>0){
	        filename = UploadSave.saveFile(fileItem, upDir);
	    }else{
	        filename = "img.jpg";
	    }
	    
	    String wname = UploadSave.encode(upload.getParameter("wname"));
	    String title = UploadSave.encode(upload.getParameter("title"));
	    String content = UploadSave.encode(upload.getParameter("content"));
	    String passwd = UploadSave.encode(upload.getParameter("passwd"));
	 
	   

	    ImgDTO dto=new ImgDTO();
	    dto.setWname(wname);
	    dto.setTitle(title);
	    dto.setContent(content);
	    dto.setPasswd(passwd);
	    dto.setFilename(filename); 
	  
	    ImgDAO dao=new ImgDAO();
	    int cnt = dao.create(dto);
		
		//2.request setAttr.
	    request.setAttribute("cnt", cnt);
		//3.return page
		return "/view/img/createProc.jsp";
	}

}
