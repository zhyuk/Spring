package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.mom.svc.Community_vsService;
import com.spring.mom.vo.Comment_vsVO;
import com.spring.mom.vo.Community_vsVO;
import com.spring.mom.vo.PagingVO;
import com.spring.mom.vo.VsimgVO;

@Controller
public class Community_vsController {

	@Autowired
	private Community_vsService svc;

	// VS 인덱스 페이지
	@RequestMapping("/vs_index.do")
	public String getBoardList(Community_vsVO vo, PagingVO pv,
			@RequestParam(value = "nowPage", required = false) String nowPage, Model model) {
//		System.out.println("/vs_index.do 컨트롤러 실행");		
//		System.out.println("searchCondition: " + pv.getSearchCondition());
//		System.out.println("searchKeyword: " + pv.getSearchKeyword());

		String cntPerPage = "10";

		int total = svc.countBoard(vo);
		if (nowPage == null) {
			nowPage = "1";
		}

		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
//		System.out.println("pagingVO: " + pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));

		model.addAttribute("boardList", svc.getBoardList(vo));
		return "community_vs/community_vs_index";
	}

	// 관리자페이지
	@RequestMapping("/vs_admin.do")
	public String getBoardListAdmin(Community_vsVO vo, Model model) {
		System.out.println("관리자 페이지 이동");
		model.addAttribute("boardList", svc.getBoardAdmin(vo));
		return "community_vs/community_vs_admin";
	}

	// 관리자 글 수정
	@RequestMapping("/vs_admin_update.do")
	@ResponseBody
	public List<Community_vsVO> updateBoardAdmin(Community_vsVO vo, Model model) {
		System.out.println("/vs_admin_update.do 서블릿 실행");
		System.out.println(vo);
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
	public List<Community_vsVO> deleteBoardAdmin(Community_vsVO vo, Model model) {
		System.out.println("/vs_admin_delete.do 서블릿 실행");
		System.out.println(vo);
		List<Community_vsVO> boardList = null;

		int result = svc.deleteBoard(vo);

		if (result > 0) {
			boardList = svc.getBoardAdmin(vo);

		}

		return boardList;

	}

	// 글 작성 페이지로 이동
	@GetMapping("/vs_write.do")
	public String getWriterForm(HttpSession session) {
//		System.out.println("GET 방식의 /vs_write.do 서블릿 실행");
		return "community_vs/community_vs_write";
	}

	// 글 작성
	@PostMapping("/vs_write.do")
	public String insertBoard(Community_vsVO vo, MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {
//		System.out.println("POST 방식의 /vs_write.do 서블릿 실행");
//		System.out.println(vo);
//		System.out.println("session.getAttribute('userId') : " + (String)session.getAttribute("userId"));

		if (session.getAttribute("userId") != null) {
			vo.setVs_writer((String) session.getAttribute("userId"));
		}

		Date day = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String formatedNow = sdf.format(day);
//		System.out.println(formatedNow);

		MultipartFile img1 = vo.getVs_img1_file();
		MultipartFile img2 = vo.getVs_img2_file();

//		System.out.println(img1);
//		System.out.println(img2);

		String uploadPath = "C:/swork/supermomket/src/main/webapp/resources/img/vs/";
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists())
			uploadDir.mkdir();

		if (img1 != null && img2 != null) {
			if (!img1.isEmpty() && !img2.isEmpty()) {
				String Filename1 = formatedNow + "_" + img1.getOriginalFilename();
				String Filename2 = formatedNow + "_" + img2.getOriginalFilename();
				vo.setVs_img1(Filename1);
				vo.setVs_img2(Filename2);

				img1.transferTo(new File(uploadPath + vo.getVs_img1()));
				img2.transferTo(new File(uploadPath + vo.getVs_img2()));

//				System.out.println("Filename1: " + vo.getVs_img1());
//				System.out.println("Filename2: " + vo.getVs_img2());
			}
		}

//		System.out.println(vo);

		int result = svc.insertBoard(vo);

		if (result > 0) {
//			System.out.println("글 등록 성공");
		} else {
//			System.out.println("글 등록 실패");
		}

		return "redirect:vs_index.do";
	}

	// 글 상세보기
	@RequestMapping("/vs_info.do")
	public String selectBoardInfo(Community_vsVO vo, Comment_vsVO commentVO, VsimgVO vsVO, Model model) {
//		System.out.println("/vs_info.do 서블릿 실행");
//		System.out.println(vo.getVs_no());
		model.addAttribute("boardList", svc.getBoardInfo(vo));
		model.addAttribute("commentList", svc.getComment(commentVO));
		model.addAttribute("recommentList", svc.getComment(commentVO));
		model.addAttribute("leftResult", svc.getLeftVote(vsVO));
		model.addAttribute("rightResult", svc.getRightVote(vsVO));
		return "community_vs/community_vs_info";
	}

	// 글 수정페이지 이동
	@GetMapping("/vs_update.do")
	public String updateBoardInfo(Community_vsVO vo, Model model) {
//		System.out.println("/vs_update.do  GET 서블릿 실행");
//		System.out.println(vo.getVs_no());
		model.addAttribute("boardList", svc.getBoardInfo(vo));
		return "community_vs/community_vs_modify";
	}

	// 글 수정
	@PostMapping("/vs_update.do")
	public String updateBoard(Community_vsVO vo, MultipartHttpServletRequest request)
			throws IllegalStateException, IOException {
//		System.out.println("POST 방식의 /vs_update.do 서블릿 실행");
//		System.out.println(vo);
//		System.out.println(vo.getVs_no());
		String url = "";

		Date day = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String formatedNow = sdf.format(day);
//		System.out.println(formatedNow);

		MultipartFile img1 = vo.getVs_img1_file();
		MultipartFile img2 = vo.getVs_img2_file();

		String uploadPath = "C:/swork/supermomket/src/main/webapp/resources/img/vs/";
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists())
			uploadDir.mkdir();

		if (img1 != null && img2 != null) {
			if (!img1.isEmpty() && !img2.isEmpty()) {
				String Filename1 = formatedNow + "_" + img1.getOriginalFilename();
				String Filename2 = formatedNow + "_" + img2.getOriginalFilename();
				vo.setVs_img1(Filename1);
				vo.setVs_img2(Filename2);

				img1.transferTo(new File(uploadPath + vo.getVs_img1()));
				img2.transferTo(new File(uploadPath + vo.getVs_img2()));

//				System.out.println("Filename1: " + vo.getVs_img1());
//				System.out.println("Filename2: " + vo.getVs_img2());
			}
		} else if (img1 == null && img2 == null) {
//			System.out.println(vo);

		} else if (img1 == null) {
			if (!img2.isEmpty()) {
				String Filename2 = formatedNow + "_" + img2.getOriginalFilename();
				vo.setVs_img2(Filename2);

				img2.transferTo(new File(uploadPath + vo.getVs_img2()));
//				System.out.println("Filename2: " + vo.getVs_img2());
			}
		} else if (img2 == null) {
			if (!img1.isEmpty()) {
				String Filename1 = formatedNow + "_" + img1.getOriginalFilename();
				vo.setVs_img1(Filename1);

				img1.transferTo(new File(uploadPath + vo.getVs_img1()));
//				System.out.println("Filename1: " + vo.getVs_img1());
			}
		}

//		System.out.println(vo);

		int result = svc.updateBoard(vo);

		if (result > 0) {
//			System.out.println("글 수정 성공");

			url = "redirect:vs_info.do?vs_no=" + vo.getVs_no();
		} else {
//			System.out.println("글 수정 실패");
		}
		return url;
	}

	// 글 삭제
	@GetMapping("/vs_delete.do")
	public String deleteBoard(Community_vsVO vo, VsimgVO vvo, Comment_vsVO cvo) {
//		System.out.println("/vs_delete.do 서블릿 실행");
//		System.out.println(vo.getVs_no());
		
		// 삭제할 글의 정보 가져오기
		List<Community_vsVO> deleteInfo = svc.getBoardInfo(vo);
		String uploadPath = "C:/swork/supermomket/src/main/webapp/resources/img/vs/";
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
//			System.out.println("글 삭제 성공"); 

			// 서버에 저장된 이미지 파일 삭제
			File deleteFile1 = new File(uploadPath + img1);
			File deleteFile2 = new File(uploadPath + img2);
			deleteFile1.delete();
			deleteFile2.delete();
			
			
		} else {
//			System.out.println("글 삭제 실패");
		}
		return "redirect:vs_index.do";
	}

	// 투표 입력
	@ResponseBody
	@PostMapping("/vs_vote.do")
	public Integer[] insertVote(VsimgVO vo, HttpSession session) {
//		System.out.println(vo.getV_no());
//		System.out.println(vo.getVs_no());

		if (session.getAttribute("userId") != null) {
			vo.setV_selector((String) session.getAttribute("userId"));
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
//		System.out.println("/vs_comment_insert.do 서블릿 실행");
//		System.out.println(vo);

		if (session.getAttribute("userId") != null) {
			vo.setVs_writer((String) session.getAttribute("userId"));
		}

		String userId = (String) session.getAttribute("userId");
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
//		System.out.println("/vs_comment_update.do 서블릿 실행");
//		System.out.println(vo);

		String userId = (String) session.getAttribute("userId");

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
//		System.out.println("/vs_comment_delete.do 서블릿 실행");
//		System.out.println(vo);
		String userId = (String) session.getAttribute("userId");

		List<Comment_vsVO> commentList = null;
		int result = svc.deleteComment(vo);

		if (result > 0) {
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
	public Map<String, Object> insertRecomment(Comment_vsVO vo, HttpSession session){
		
		if (session.getAttribute("userId") != null) {
			vo.setVs_writer((String) session.getAttribute("userId"));
		}

		String userId = (String) session.getAttribute("userId");
		List<Comment_vsVO> commentList = null;
		
//		System.out.println(vo);
		
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
