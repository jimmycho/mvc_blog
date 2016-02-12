package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.NullAction;
import action.Action; 

public class Controller extends HttpServlet {

	private boolean usingTemplate = false; //템플릿 사용여부
	private String templatePage = null;  //템플릿 파일명
	private Map commandHandlerMap = new java.util.HashMap(); //action 들의 저장소

   //톰캣 구동시 int() 메소드 실행
	public void init(ServletConfig config) throws ServletException {

		//web.xml 파일로부터 configFile(action-config.properties파일)의 위치정보를 읽어옴
		String configFile = config.getInitParameter("configFile");
		//프로퍼티 객체생성
		Properties prop = new Properties();
		//파일객체 생성
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(configFile); //config 파일을 파일객체 fis에 저장
			prop.load(fis); //프로퍼티에 action-config properties 파일 정보 로딩
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (fis != null)
				try {
					fis.close(); //파일 객체 close
				} catch (IOException ex) {
				}
		}

		Iterator keyIter = prop.keySet().iterator(); //프로퍼티 객체로 부터 반복자 생성
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next(); //커맨드명 읽어옴
			System.out.println("command: " + command);

			String handlerClassName = prop.getProperty(command).trim(); //클래스명 읽어옴
			System.out.println("handlerClassName: " + handlerClassName);

			try {
				//읽어들인 클래스명의 클래스를 생성
				Class handlerClass = Class.forName(handlerClassName);

				// 읽어들인 클래스명의 객체를 생성합니다.
				Object handlerInstance = handlerClass.newInstance();

				// MAP에 키값으로 커맨드명 , 밸류값으로 해당 클래스객체명 저장
				// 키값>>mvc/hello.do , 클래스명>>mvc.action.HelloAction
				commandHandlerMap.put(command, handlerInstance);

			} catch (ClassNotFoundException e) {
				throw new ServletException(e);
			} catch (InstantiationException e) {
				throw new ServletException(e);
			} catch (IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
		//템플릿 페이지 파일명 읽어옴
		templatePage = config.getInitParameter("templatePage");

		if (templatePage != null && !templatePage.equals("")) {
			usingTemplate = true; // 템플릿 파일명 존재 확인 
		}
	}

	// 1. HTTP 요청받음(doGet(),doPost() 메소드 호출)
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response); //process()를 호출
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(request, response); //process()를 호출
	}

	private void process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String command = request.getRequestURI();	//커맨드에 requestURI저장	
		System.out.println("RequestURL: " + request.getRequestURL());
		System.out.println("RequestURI: " + request.getRequestURI());
		System.out.println("context: " + request.getContextPath());

		// URI:/www_mvc/mvc/list.do
		if (command.indexOf(request.getContextPath()) == 0) {
			//requestURI로 부터 커맨드 (*.do) 추출
			command = command.substring(request.getContextPath().length());
			System.out.println("command: " + command);
		}
	//커맨드 맵 내에 *.do에 해당하는 클래스 객체 로딩
		Action action = (Action) commandHandlerMap.get(command);

		// 핸들러가 없는 경우 null action 
		if (action == null) {
			action = new NullAction();
		}

		String viewPage = null;  //뷰페이지 명 선언(null 로 초기화)
		try {
			//해당 action.execute 를 실행 ( request.setAttribute ("hello", sb) 입력)
			//뷰페이지 파일명을 action.execute 메소드로 부터 리턴
			viewPage = action.execute(request, response);
			
		} catch (Throwable e) {
			throw new ServletException(e);
		}
		//템플릿 사용여부 결정(web.xml 파일내에 설정)
		if(viewPage.indexOf("popup")!=-1){
			usingTemplate=false;
		}else{
			usingTemplate=true;
		}
		if (usingTemplate) {
			request.setAttribute("CONTENT_PAGE", viewPage);
		}
	//Request Dispatcher 객체생성하고 포워드 페이지 알림
		RequestDispatcher dispatcher = request
				.getRequestDispatcher(usingTemplate ? templatePage : viewPage);
		dispatcher.forward(request, response);
	//forward 방식:포워드 페이지(hello.jsp)내에서 request.getAttribute("hello") 읽어들여 표시
		

		
	}
}