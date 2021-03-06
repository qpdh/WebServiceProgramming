package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.CommunityDAO;
import dto.CommunityCommentDTO;
import dto.CommunityDTO;

// TODO 컨트롤러 확장시킬 것
/**
 * Servlet implementation class CommunityController
 */
@WebServlet("/CommunityController")
public class CommunityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;

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
		request.setCharacterEncoding("utf-8");
		// TODO Auto-generated method stub
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath() + "/community";

		// 커맨드 추출
		String command = RequestURI.substring(contextPath.length());

		System.out.println("CommunityController-command : " + command);

		// 등록된 글 목록 페이지 출력하기
		if (command.equals("/CommunityListAction.community")) {
			requestCommunityList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./community_list.jsp");
			rd.forward(request, response);
		}

		// 새로운 글 등록 페이지
		else if (command.equals("/CommunityWriteForm.community")) {
			requestLoginName(request);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("./community_write.jsp");
			requestDispatcher.forward(request, response);
		}

		// 새로운 글 등록 페이지에서 글쓰기 버튼 누름
		else if (command.equals("/CommunityWriteAction.community")) {
			System.out.println("This is ComminityWriteAction.community");
			requestCommunityWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("/community/CommunityListAction.community");
			rd.forward(request, response);
		}

		// 댓글 등록 버튼 누름
		else if (command.equals("/CommunityCommentWriteAction.community")) {
			requestCommunityCommentWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("/community/CommunityViewAction.community");
			rd.forward(request, response);
		}

		// 상세보기
		else if (command.equals("/CommunityViewAction.community")) {
			requestCommunityView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/community/community_view.jsp");
			rd.forward(request, response);
		}
		// 수정
		else if (command.equals("/CommunityUpdateAction.community")) {
			// requestBoardUpdate(request);
			// RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			// rd.forward(request, response);
		}
		// 게시글 삭제
		else if (command.equals("/CommunityDeleteAction.community")) {
			requestCommunityDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/community/CommunityListAction.community");
			rd.forward(request, response);
		}
		// 댓글 삭제
		else if (command.equals("/CommunityCommentDeleteAction.community")) {
			requestCommunityCommentDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/community/CommunityViewAction.community");
			rd.forward(request, response);
		}
		// 좋아요
		else if (command.equals("/CommunityLikeAction.community")) {
			requestCommunityLike(request);
			RequestDispatcher rd = request.getRequestDispatcher("/community/CommunityViewAction.community");
			rd.forward(request, response);
		}
	}

	public void requestCommunityLike(HttpServletRequest request) {
		// TODO Auto-generated method stub
		CommunityDAO dao = CommunityDAO.getInstance();
		int communityId = Integer.parseInt(request.getParameter("num"));
		String userId = request.getParameter("user_id");
		dao.upadteLikes(communityId, userId);
	}

	// 게시글 삭제
	public void requestCommunityDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		CommunityDAO dao = CommunityDAO.getInstance();

		int communityId = Integer.parseInt(request.getParameter("num"));
		dao.deleteCommunity(communityId);
	}

	// 댓글 삭제
	public void requestCommunityCommentDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		CommunityDAO dao = CommunityDAO.getInstance();

		int commentId = Integer.parseInt(request.getParameter("communiyId"));
		dao.deleteCommunityComment(commentId);

	}

	// 등록된 글 목록 가져오기
	public void requestCommunityList(HttpServletRequest request) {
		CommunityDAO dao = CommunityDAO.getInstance();

		List<CommunityDTO> communityList = new ArrayList<CommunityDTO>();

		// 처음 키면 페이지 1로 설정
		int pageNum = 1;
		// 5개씩 불러올 예정
		int limit = LISTCOUNT;

		// 기존 페이지가 있다면 해당 페이지로 설정
		if (request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}

		System.out.println("requestCommunityList: PageNum : " + pageNum);
		String text = request.getParameter("input_tag");

		// community 테이블 레코드 갯수 가져오기
		int total_record = dao.getListCount(text);
		//
		communityList = dao.getCommunityList(pageNum, limit, text);

		int total_page;

		if (total_record % limit == 0) {
			total_page = total_record / limit;
			Math.floor(total_page);
		} else {
			total_page = total_record / limit;
			Math.floor(total_page);
			total_page = total_page + 1;
		}

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("communityList", communityList);
		// TODO 스크롤 내릴수록 추가되는 기능을 구현할 것
	}

	// 인증된 사용자 명 가져오기
	public void requestLoginName(HttpServletRequest request) {
		String id = request.getParameter("user_id");

		System.out.println("requestLoginName : " + id);
		// CommunityDAO dao = CommunityDAO.getInstance();

		// String name = dao.getLoginNameById(id);

		request.setAttribute("user_id", id);
	}

	// 새로운 글 등록하기
	public void requestCommunityWrite(HttpServletRequest request) throws UnsupportedEncodingException {
		try {
			MultipartRequest multi = new MultipartRequest(request, "C:\\WebProject\\Community", 5 * 1024 * 1024,
					"utf-8", new DefaultFileRenamePolicy());
			request.setCharacterEncoding("utf-8");

			Enumeration<String> em = multi.getParameterNames();
//		
			while (em.hasMoreElements()) {
				String name = em.nextElement();
				System.out.println(name + " : " + multi.getParameter(name));
			}

			System.out.println("title : " + multi.getParameter("title"));

			CommunityDAO dao = CommunityDAO.getInstance();

			CommunityDTO community = new CommunityDTO();

			community.setTitle(multi.getParameter("title"));

			community.setComment(multi.getParameter("content"));

			community.setTag(multi.getParameter("tag"));

			community.setUser_id(multi.getParameter("user_id"));

			// 날짜 형식 변환
			// 1999/12/12(11:11:11)
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd(HH:mm:ss)");
			Date date = new Date();

			community.setDate(formatter.format(date));

			System.out.println("변환한 시간: :" + community.getDate());

			// 데이터 로컬 폴더에 추가
			// 5메가 제한

			community.setFile_name(multi.getFilesystemName("picture"));

			dao.insertCommunity(community);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}
	}

	// 댓글 등록하기
	// 새로운 글 등록하기
	public void requestCommunityCommentWrite(HttpServletRequest request) throws UnsupportedEncodingException {
		try {
			request.setCharacterEncoding("utf-8");

			Enumeration<String> em = request.getParameterNames();
//			
			while (em.hasMoreElements()) {
				String name = em.nextElement();
				System.out.println(name + " : " + request.getParameter(name));
			}

			System.out.println("title : " + request.getParameter("title"));

			CommunityDAO dao = CommunityDAO.getInstance();

			CommunityCommentDTO comment = new CommunityCommentDTO();

			comment.setComment(request.getParameter("content"));

			comment.setUser_id(request.getParameter("user_id"));

			comment.setCommunityId(request.getParameter("community_id"));

			// 날짜 형식 변환
			// 1999/12/12(11:11:11)
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd(HH:mm:ss)");
			Date date = new Date();

			comment.setDate(formatter.format(date));

			System.out.println("변환한 시간: :" + comment.getDate());

			// 데이터 로컬 폴더에 추가
			// 5메가 제한

			dao.insertCommunityComment(comment);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}
		// 데이터 삽입

	}

	// 페이지 상세보기
	public void requestCommunityView(HttpServletRequest request) {

		CommunityDAO dao = CommunityDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = 1;
		if (request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}

		CommunityDTO community = new CommunityDTO();

		community = dao.getCommunityByNum(num, pageNum);

		CommunityDAO communityDAO = CommunityDAO.getInstance();
		community.setComments(communityDAO.getCommunityCommentsList(community.getId()));

		request.setAttribute("num", num);
		request.setAttribute("page", pageNum);
		request.setAttribute("community", community);
	}
}
