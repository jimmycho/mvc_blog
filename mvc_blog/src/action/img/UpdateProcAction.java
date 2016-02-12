package action.img;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.img.ImgDAO;
import model.img.ImgDTO;

import org.apache.commons.fileupload.FileItem;

import utility.UploadSave;
import action.Action;

public class UpdateProcAction implements Action {

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
	    //모듈객체를 이용해서 보내는 파라메터값과 파일받음111
	    FileItem fileItem = upload.getFileItem("filename");

	    int size = (int)fileItem.getSize();
	    
	    String filename = null;
	    
	    if(size>0){
	        filename = UploadSave.saveFile(fileItem, upDir);
	    }else{
	        filename = "img.jpg";
	    }
	    
	    int imgno =Integer.parseInt(upload.getParameter("imgno"));
	    String col = UploadSave.encode(upload.getParameter("col"));
	    String word = UploadSave.encode(upload.getParameter("word"));
	    int nowPage = Integer.parseInt(upload.getParameter("nowPage"));
	    
	    String title = UploadSave.encode(upload.getParameter("title"));
	    String content = UploadSave.encode(upload.getParameter("content"));
	    String wname = UploadSave.encode(upload.getParameter("wname"));
	    String passwd = UploadSave.encode(upload.getParameter("passwd"));
	    
	    ImgDTO dto=new ImgDTO();
	    ImgDAO dao=new ImgDAO();
	    
	    dto.setTitle(title);
	    dto.setContent(content);
	    dto.setWname(wname);
	    dto.setPasswd(passwd);
	    dto.setFilename(filename); 
	    dto.setImgno(imgno);
	    
	    int cnt =dao.passwdCheck(dto.getImgno(), dto.getPasswd());
	    
	    if (cnt == 1){ 
	    				dao.update(dto);
	    			}
	  
	        
		//2.request set attribute
	    request.setAttribute("cnt", cnt);
	    request.setAttribute("imgno", imgno);
	    request.setAttribute("col", col);
	    request.setAttribute("word", word);
	    request.setAttribute("nowPage", nowPage);
	    
		//3.return page
		return "/view/img/updateProc.jsp";
	}

}
