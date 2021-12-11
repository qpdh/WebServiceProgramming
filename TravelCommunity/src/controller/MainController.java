package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath() + "/main";

		// 커맨드 추출
		String command = RequestURI.substring(contextPath.length());

		System.out.println("MainController-command : " + command);

		// 여행지 페이지로 이동
		if (command.equals("/Travel.main")) {
			// requestCommunityList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./travel.jsp");
			rd.forward(request, response);
		}

		// 커뮤니티 페이지로 이동
		else if (command.equals("/Community.main")) {
			// requestLoginName(request);
			response.sendRedirect("/community/CommunityListAction.community");
//			RequestDispatcher requestDispatcher = request
//					.getRequestDispatcher("/community/CommunityListAction.community");
//			requestDispatcher.forward(request, response);
		}

		// 로그인 페이지로 이동
		else if (command.equals("/CommunityWriteAction.community")) {
			// requestCommunityWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("/community/CommunityListAction.community");
			rd.forward(request, response);
		}

		// 회원가입 페이지로 이동
		else if (command.equals("/CommunityWriteAction.community")) {
			// requestCommunityWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("/community/CommunityListAction.community");
			rd.forward(request, response);
		}
	}

}
