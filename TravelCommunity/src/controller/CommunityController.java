package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommunityDAO;

/**
 * Servlet implementation class CommunityController
 */
@WebServlet("/CommunityController")
public class CommunityController extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		String contextPath = request.getContextPath();

		// 커맨드 추출
		String command = RequestURI.substring(contextPath.length());

		if (command.equals("/CommunityListAction.do")) { // 등록된 글 목록 페이지 출력하기
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./comunity/community.jsp");
			rd.forward(request, response);
		} else if (command.equals("/CommunityWriteForm.do")) { // 글 등록 페이지 출력하기

		}
	}

	// 등록된 글 목록 가져오기
	public void requestBoardList(HttpServletRequest request) {
		CommunityDAO dao = CommunityDAO.getInstance();

		List<CommunityDAO> communityList = new ArrayList<CommunityDAO>();

		// TODO 스크롤 내릴수록 추가되는 기능을 구현할 것
	}

	// 인증된 사용자 명 가져오기
	public void requestLoginName(HttpServletRequest request) {
		String id = request.getParameter("id");

		CommunityDAO dao = CommunityDAO.getInstance();

		String name = dao.getLoginNameById(id);
	}
}
