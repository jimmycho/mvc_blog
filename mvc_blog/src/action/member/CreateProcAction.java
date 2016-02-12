package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import action.Action;
import model.member.MemberDAO;
import model.member.MemberDTO;
import utility.UploadSave;

public class CreateProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8"); 
		
		 
	    //업로드 폴더와 임시폴더 설정
	    String upDir=request.getRealPath("/view/member/storage");
	    
	    String tempDir = request.getRealPath("/view/member/temp");
	    //업로드 처리 모듈객체 생성
	    UploadSave upload = 
	    new UploadSave(request,-1,-1,tempDir);   
	    //모듈객체를 이용해서 보내는 파라메터값과 파일받음
	    FileItem fileItem = upload.getFileItem("fname");
	    int size = (int)fileItem.getSize();
	    String fname = null;
	    if(size>0){
	        fname = UploadSave.saveFile(fileItem, upDir);
	    }else{
	        fname = "member.jpg";
	    }
	    
	    String id = upload.getParameter("id");
	    String passwd = upload.getParameter("passwd");
	    String tel = upload.getParameter("tel");
	    String email = upload.getParameter("email");
	    String zipcode = upload.getParameter("zipcode");
	    String job = upload.getParameter("job");
	    //한글인코딩 추가
	    String mname = UploadSave.encode(upload.getParameter("mname"));
	    String address1 = UploadSave.encode(upload.getParameter("address1"));
	    String address2 = UploadSave.encode(upload.getParameter("address2"));
	      
	    //받은 파라메터와 파일을 DTO 객체 담고DAO의 
	    //create()로 디비저장
	 
	    MemberDTO dto = new MemberDTO();
	    dto.setId(id);
	    dto.setPasswd(passwd);
	    dto.setTel(tel);
	    dto.setEmail(email);
	    dto.setZipcode(zipcode);
	    dto.setJob(job);
	    dto.setMname(mname);
	    dto.setAddress1(address1);
	    dto.setAddress2(address2);
	    dto.setFname(fname);
	    
	    MemberDAO dao = new MemberDAO();
	    int cnt = dao.create(dto);
		
	    request.setAttribute("cnt", cnt);
	    
		return "/view/img/createProc.jsp";
	}

}



/*package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberDTO;

import org.apache.commons.fileupload.*;

import utility.UploadSave;
import action.Action;

public class CreateProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8"); 
		 
	    //업로드 폴더와 임시폴더 설정
	    String upDir=request.getRealPath("/member/storage");
	    String tempDir = request.getRealPath("/member/temp");
	    //업로드 처리 모듈객체 생성
	    UploadSave upload = new UploadSave(request,-1,-1,tempDir);   
	    //모듈객체를 이용해서 보내는 파라메터값과 파일받음
	    FileItem fileItem = upload.getFileItem("fname");
	    int size = (int)fileItem.getSize();
	    String fname = null;
	    if(size>0){
	        fname = UploadSave.saveFile(fileItem, upDir);
	    }else{
	        fname = "member.jpg";
	    }
	    
	    String id = upload.getParameter("id");
	    String passwd = upload.getParameter("passwd");
	    String tel = upload.getParameter("tel");
	    String email = upload.getParameter("email");
	    String zipcode = upload.getParameter("zipcode");
	    String job = upload.getParameter("job");
	    //한글인코딩 추가
	    String mname = UploadSave.encode(upload.getParameter("mname"));
	    String address1 = UploadSave.encode(upload.getParameter("address1"));
	    String address2 = UploadSave.encode(upload.getParameter("address2"));
	      
	    //받은 파라메터와 파일을 DTO 객체 담고DAO의 
	    //create()로 디비저장
	    
	    MemberDTO dto=new MemberDTO();
	    MemberDAO dao=new MemberDAO();
	 
	    dto.setId(id);
	    dto.setPasswd(passwd);
	    dto.setTel(tel);
	    dto.setEmail(email);
	    dto.setZipcode(zipcode);
	    dto.setJob(job);
	    dto.setMname(mname);
	    dto.setAddress1(address1);
	    dto.setAddress2(address2);
	    dto.setFname(fname);
	    
	    int cnt = dao.create(dto);
	    
	    request.setAttribute("cnt", cnt);
	    
		return "/view/member/createProc.jsp";
	}

}
*/