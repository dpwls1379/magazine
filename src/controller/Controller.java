package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "*.do", initParams = {
		@WebInitParam(name = "config", value = "/WEB-INF/command.properties") })
// 확장자가 *.do로 시작하는 것을 "config"라는 이름을 가지고 command.properties를 실행해라
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<>();

	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("config");
		// props:"/WEP-INF/command.properties"
		Properties pr = new Properties();
		// Java 11장 키=값을 가진 Map 구현
		FileInputStream f = null;
		try {
			String configFilePath = config.getServletContext().getRealPath(props);
			// configFilePath 실제 사용할 위치에 있는 이름->realPath써야함
			f = new FileInputStream(configFilePath);
			pr.load(f);
			// pr에는 command.properties파일의 데이터를 사용한다
			// '=' 앞에 있는 message.do을 key로 자동으로
			// 뒤에 있는 service.Message을 값으로 가진다
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (f != null) {
				try {
					f.close();
				} catch (IOException ex) {

				}
			}
		}
		Iterator<Object> keyIter = pr.keySet().iterator();
		// keyIter: message.do, 추가한 color.do
		// 11장 set: interface: HashSet(순서O), TreeSet(순서X)
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next();
			// command : message.do
			String className = pr.getProperty(command);
			// className : service.Message 문자
			try {
				Class<?> commandClass = Class.forName(className);
				// commandClass: service.Message 클래스
				Object commandInstance = commandClass.newInstance();
				// commandInstance: Message 객체
				commandMap.put(command, commandInstance);
				// commandMap에는 key: message.do, value: Message객체
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		CommandProcess com = null;
		try {
			String command = request.getRequestURI();
			// command: /ch13/message.do
			// request.getContextPath() : /ch13 실제 주소
			// request.getContextPath().length()+1 : 6
			command = command.substring(request.getContextPath().length() + 1);
			// command : message.do (substring: 앞에 6개를 뺀 나머지 글자)
			com = (CommandProcess) commandMap.get(command);
			// com: service.Message객체를 CommandProcess로 형변환
			// 자식 즉 Message객체의 requestPro()메소드 실행
			view = com.requestPro(request, response);
			// view는 "message.jsp" 라는 문자가 있음
		} catch (Throwable e) {
			throw new ServletException(e);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}