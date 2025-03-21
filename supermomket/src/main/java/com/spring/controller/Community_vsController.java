package com.spring.controller;

import com.spring.mom.svc.Community_vsService;
import com.spring.mom.vo.Comment_vsVO;
import com.spring.mom.vo.Community_vsVO;
import com.spring.mom.vo.PagingVO;
import com.spring.mom.vo.VsimgVO;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class Community_vsController {

	@Autowired
	private Community_vsService svc;

	@Autowired
	private ServletContext context;

	// 글목록 검색 옵션
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("내용", "content");
		conditionMap.put("제목", "title");
		return conditionMap;
	}

	public String getUrl() {
		return context.getRealPath("/resources/img/vs/");
	}

	// VS 인덱스 페이지
	@RequestMapping("/vs_index.do")
	public String getBoardList(Community_vsVO vo, PagingVO pv, Comment_vsVO cvo,
			@RequestParam(value = "nowPage", required = false) String nowPage, Model model) {
		// System.out.println("/vs_index.do 컨트롤러 실행");
		// System.out.println("searchCondition: " + pv.getSearchCondition());
		// System.out.println("searchKeyword: " + pv.getSearchKeyword());

		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("title");

		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");

		String cntPerPage = "10";

		int total = svc.countBoard(vo);
		if (nowPage == null) {
			nowPage = "1";
		}

		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		// System.out.println("pagingVO: " + pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));

		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("boardList", svc.getBoardList(vo));
		return "community_vs/community_vs_index";
	}

	// 관리자페이지
	@RequestMapping("/vs_admin.do")
	public String getBoardListAdmin(Community_vsVO vo, HttpSession session, Model model) {
		// System.out.println("관리자 페이지 이동");

		model.addAttribute("boardList", svc.getBoardAdmin(vo));
		return "community_vs/community_vs_admin";
	}

	// 관리자 글 수정
	@RequestMapping("/vs_admin_update.do")
	@ResponseBody
	public List<Community_vsVO> updateBoardAdmin(Community_vsVO vo, Comment_vsVO cvo, Model model) {
		// System.out.println("/vs_admin_update.do 서블릿 실행");
		// System.out.println(vo);

		List<Community_vsVO> boardList = null;

		int result = svc.updateBoardAdmin(vo);

		if (result > 0) {
			boardList = svc.getBoardAdmin(vo);
		}

		return boardList;
	}

	// 관리자 글 삭제
	@RequestMapping("/vs_admin_delete.do")
	@ResponseBody
	public List<Community_vsVO> deleteBoardAdmin(Community_vsVO vo, VsimgVO vvo, Comment_vsVO cvo, Model model) {
		// System.out.println("/vs_admin_delete.do 서블릿 실행");
		// System.out.println(vo);

		List<Community_vsVO> boardList = null;
		List<Community_vsVO> deleteInfo = svc.getBoardInfo(vo);
		String img1 = "";
		String img2 = "";

		for (Community_vsVO delVO : deleteInfo) {
			img1 = delVO.getVs_img1();
			img2 = delVO.getVs_img2();
		}

		int result = svc.deleteBoard(vo);

		if (result > 0) {
			svc.deleteAllComment(cvo);
			svc.deleteAllVote(vvo);

			// 서버에 저장된 이미지 파일 삭제
			File deleteFile1 = new File(getUrl() + img1);
			File deleteFile2 = new File(getUrl() + img2);
			deleteFile1.delete();
			deleteFile2.delete();

			boardList = svc.getBoardAdmin(vo);
		}
		return boardList;
	}

	// 관리자 댓글 조회
	@RequestMapping("/vs_admin_getComment.do")
	@ResponseBody
	public List<Comment_vsVO> getCommentAdmin(Comment_vsVO vo) {
		List<Comment_vsVO> commentList = svc.getComment(vo);
		return commentList;
	}

	// 관리자 댓글 삭제
	@RequestMapping("/vs_admin_deleteComment.do")
	@ResponseBody
	public List<Comment_vsVO> deleteCommentAdmin(Comment_vsVO vo) {
		List<Comment_vsVO> commentList = null;
		// System.out.println(vo);

		int vs_rcno = vo.getVs_cno();

		int result = svc.deleteComment(vo);

		if (result > 0) {
			vo.setVs_rcno(vs_rcno);
			svc.deleteComment(vo);
			commentList = svc.getComment(vo);
		}

		return commentList;
	}

	// 글 작성 페이지로 이동
	@GetMapping("/vs_write.do")
	public String getWriterForm(HttpSession session) {
		// System.out.println("GET 방식의 /vs_write.do 서블릿 실행");
		return "community_vs/community_vs_write";
	}

	// 글 작성
	@PostMapping("/vs_write.do")
	public String insertBoard(Community_vsVO vo, MultipartHttpServletRequest requeset, HttpSession session)
			throws IllegalStateException, IOException {
		System.out.println("77777 POST 방식의 /vs_write.do 서블릿 실행");
		// System.out.println(vo);
		// System.out.println("session.getAttribute('userId') : " +
		// (String)session.getAttribute("userId"));

		if (session.getAttribute("userNickname") != null) {
			vo.setVs_writer((String) session.getAttribute("userNickname"));
		}

		Date day = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String formatedNow = sdf.format(day);
		// System.out.println(formatedNow);

		MultipartFile img1 = vo.getVs_img1_file();
		MultipartFile img2 = vo.getVs_img2_file();

		// System.out.println(img1);
		// System.out.println(img2);

		File uploadDir = new File(getUrl());
		if (!uploadDir.exists())
			uploadDir.mkdir();

		if (img1 != null && img2 != null) {
			if (!img1.isEmpty() && !img2.isEmpty()) {
				String Filename1 = formatedNow + "_" + img1.getOriginalFilename();
				String Filename2 = formatedNow + "_" + img2.getOriginalFilename();
				vo.setVs_img1(Filename1);
				vo.setVs_img2(Filename2);

				img1.transferTo(new File(getUrl() + vo.getVs_img1()));
				img2.transferTo(new File(getUrl() + vo.getVs_img2()));

				System.out.println("real_Filename1: " + getUrl() + vo.getVs_img1());
				System.out.println("real_Filename2: " + getUrl() + vo.getVs_img2());
			}
		}

		// System.out.println(vo);

		int result = svc.insertBoard(vo);

		if (result > 0) {
			// System.out.println("글 등록 성공");
		} else {
			// System.out.println("글 등록 실패");
		}

		return "redirect:vs_index.do";
	}

	// 글 상세보기
	@RequestMapping("/vs_info.do")
	public String selectBoardInfo(Community_vsVO vo, Comment_vsVO commentVO, VsimgVO vsVO, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		// System.out.println("/vs_info.do 서블릿 실행");
		// System.out.println(vo.getVs_no());
		model.addAttribute("boardList", svc.getBoardInfo(vo));
		model.addAttribute("commentList", svc.getComment(commentVO));
		model.addAttribute("recommentList", svc.getComment(commentVO));
		model.addAttribute("leftResult", svc.getLeftVote(vsVO));
		model.addAttribute("rightResult", svc.getRightVote(vsVO));
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("nowPage", nowPage);
		return "community_vs/community_vs_info";
	}

	// 글 수정페이지 이동
	@GetMapping("/vs_update.do")
	public String updateBoardInfo(Community_vsVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		// System.out.println("/vs_update.do GET 서블릿 실행");
		// System.out.println(vo.getVs_no());
		// System.out.println(nowPage);
		model.addAttribute("boardList", svc.getBoardInfo(vo));
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("nowPage", nowPage);
		return "community_vs/community_vs_modify";
	}

	// 글 수정
	@PostMapping("/vs_update.do")
	public String updateBoard(Community_vsVO vo, MultipartHttpServletRequest request,
			@RequestParam(value = "nowPage", required = false) String nowPage, Model model)
			throws IllegalStateException, IOException {
		// System.out.println("POST 방식의 /vs_update.do 서블릿 실행");
		// System.out.println(vo);
		// System.out.println(vo.getVs_no());
		String url = "";

		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("title");

		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");

		// 수정할 글의 정보 가져오기
		List<Community_vsVO> deleteInfo = svc.getBoardInfo(vo);
		String getImgName1 = "";
		String getImgName2 = "";

		for (Community_vsVO delVO : deleteInfo) {
			getImgName1 = delVO.getVs_img1();
			getImgName2 = delVO.getVs_img2();
		}

		File removeImg1 = new File(getUrl() + getImgName1);
		File removeImg2 = new File(getUrl() + getImgName2);

		Date day = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String formatedNow = sdf.format(day);
		// System.out.println(formatedNow);

		MultipartFile img1 = vo.getVs_img1_file();
		MultipartFile img2 = vo.getVs_img2_file();

		File uploadDir = new File(getUrl());
		if (!uploadDir.exists())
			uploadDir.mkdir();

		if (img1 != null && img2 != null) {
			if (!img1.isEmpty() && !img2.isEmpty()) {
				String Filename1 = formatedNow + "_" + img1.getOriginalFilename();
				String Filename2 = formatedNow + "_" + img2.getOriginalFilename();
				vo.setVs_img1(Filename1);
				vo.setVs_img2(Filename2);

				img1.transferTo(new File(getUrl() + vo.getVs_img1()));
				img2.transferTo(new File(getUrl() + vo.getVs_img2()));

				removeImg1.delete();
				removeImg2.delete();
				// System.out.println("Filename1: " + vo.getVs_img1());
				// System.out.println("Filename2: " + vo.getVs_img2());
			}
		} else if (img1 == null && img2 == null) {
			// System.out.println(vo);

		} else if (img1 == null) {
			if (!img2.isEmpty()) {
				String Filename2 = formatedNow + "_" + img2.getOriginalFilename();
				vo.setVs_img2(Filename2);

				img2.transferTo(new File(getUrl() + vo.getVs_img2()));

				// 기존 이미지파일 삭제
				removeImg2.delete();
				// System.out.println("Filename2: " + vo.getVs_img2());
			}
		} else if (img2 == null) {
			if (!img1.isEmpty()) {
				String Filename1 = formatedNow + "_" + img1.getOriginalFilename();
				vo.setVs_img1(Filename1);

				img1.transferTo(new File(getUrl() + vo.getVs_img1()));

				// 기존 이미지파일 삭제
				removeImg1.delete();
				// System.out.println("Filename1: " + vo.getVs_img1());
			}
		}

		// System.out.println(vo);

		int result = svc.updateBoard(vo);

		if (result > 0) {
			// System.out.println("글 수정 성공");
			model.addAttribute("searchCondition", vo.getSearchCondition());
			model.addAttribute("searchKeyword", vo.getSearchKeyword());
			model.addAttribute("nowPage", nowPage);
			url = "redirect:vs_info.do?vs_no=" + vo.getVs_no();
		} else {
			// System.out.println("글 수정 실패");
		}
		return url;
	}

	// 글 삭제
	@GetMapping("/vs_delete.do")
	public String deleteBoard(Community_vsVO vo, VsimgVO vvo, Comment_vsVO cvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		// System.out.println("/vs_delete.do 서블릿 실행");
		// System.out.println(vo.getVs_no());

		// 삭제할 글의 정보 가져오기
		List<Community_vsVO> deleteInfo = svc.getBoardInfo(vo);
		String img1 = "";
		String img2 = "";

		for (Community_vsVO delVO : deleteInfo) {
			img1 = delVO.getVs_img1();
			img2 = delVO.getVs_img2();
		}

		int result = svc.deleteBoard(vo);

		if (result > 0) {
			svc.deleteAllComment(cvo);
			svc.deleteAllVote(vvo);
			// System.out.println("글 삭제 성공");

			// 서버에 저장된 이미지 파일 삭제
			File deleteFile1 = new File(getUrl() + img1);
			File deleteFile2 = new File(getUrl() + img2);
			deleteFile1.delete();
			deleteFile2.delete();

			model.addAttribute("searchCondition", vo.getSearchCondition());
			model.addAttribute("searchKeyword", vo.getSearchKeyword());
			model.addAttribute("nowPage", nowPage);
		} else {
			// System.out.println("글 삭제 실패");
		}
		return "redirect:vs_index.do";
	}

	// 투표 입력
	@ResponseBody
	@PostMapping("/vs_vote.do")
	public Integer[] insertVote(VsimgVO vo, HttpSession session) {
		// System.out.println(vo.getV_no());
		// System.out.println(vo.getVs_no());

		if (session.getAttribute("userNickname") != null) {
			vo.setV_selector((String) session.getAttribute("userNickname"));
		}

		Integer[] resultarr = new Integer[2];

		int result = svc.insertVote(vo);

		if (result > 0) {
			resultarr[0] = svc.getLeftVote(vo);
			resultarr[1] = svc.getRightVote(vo);
		}

		return resultarr;
	}

	// 댓글 작성
	@ResponseBody
	@RequestMapping("/vs_comment_insert.do")
	public Map<String, Object> insertComment(Comment_vsVO vo, HttpSession session) {
		// System.out.println("/vs_comment_insert.do 서블릿 실행");
		// System.out.println(vo);

		if (session.getAttribute("userNickname") != null) {
			vo.setVs_writer((String) session.getAttribute("userNickname"));
		}

		String userId = (String) session.getAttribute("userNickname");
		List<Comment_vsVO> commentList = null;
		int result = svc.insertComment(vo);

		if (result > 0) {
			commentList = svc.getComment(vo);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("commentList", commentList);
		map.put("recommentList", commentList);
		return map;
	}

	// 댓글 수정
	@ResponseBody
	@RequestMapping("/vs_comment_update.do")
	public Map<String, Object> updateComment(Comment_vsVO vo, HttpSession session) {
		// System.out.println("/vs_comment_update.do 서블릿 실행");
		// System.out.println(vo);

		String userId = (String) session.getAttribute("userNickname");

		List<Comment_vsVO> commentList = null;
		int result = svc.updateComment(vo);

		if (result > 0) {
			commentList = svc.getComment(vo);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("commentList", commentList);
		map.put("recommentList", commentList);
		return map;
	}

	// 댓글 삭제
	@ResponseBody
	@RequestMapping("/vs_comment_delete.do")
	public Map<String, Object> deleteComment(Comment_vsVO vo, HttpSession session) {
		// System.out.println("/vs_comment_delete.do 서블릿 실행");
		// System.out.println(vo);

		int vs_rcno = vo.getVs_cno();
		String userId = (String) session.getAttribute("userNickname");

		List<Comment_vsVO> commentList = null;
		int result = svc.deleteComment(vo);

		if (result > 0) {
			vo.setVs_rcno(vs_rcno);
			svc.deleteComment(vo);
			commentList = svc.getComment(vo);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("commentList", commentList);
		map.put("recommentList", commentList);
		return map;
	}

	// 답글 작성
	@ResponseBody
	@RequestMapping("/vs_recomment_insert.do")
	public Map<String, Object> insertRecomment(Comment_vsVO vo, HttpSession session) {
		if (session.getAttribute("userNickname") != null) {
			vo.setVs_writer((String) session.getAttribute("userNickname"));
		}

		String userId = (String) session.getAttribute("userNickname");
		List<Comment_vsVO> commentList = null;

		// System.out.println(vo);

		int result = svc.insertRecomment(vo);

		if (result > 0) {
			commentList = svc.getComment(vo);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("commentList", commentList);
		map.put("recommentList", commentList);
		return map;
	}
}
