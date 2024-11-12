package com.spring.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.mom.svc.CommentService;
import com.spring.mom.svc.CommunityService;
import com.spring.mom.vo.Comment_noriterVO;
import com.spring.mom.vo.Comment_shoppingVO;
import com.spring.mom.vo.Comment_yookaVO;
import com.spring.mom.vo.Community_noriterVO;
import com.spring.mom.vo.Community_shoppingVO;
import com.spring.mom.vo.Community_yookaVO;
import com.spring.mom.vo.PagingVO;
import com.spring.mom.vo.Updown_NoriterVO;
import com.spring.mom.vo.Updown_ShoppingVO;
import com.spring.mom.vo.Updown_YookaVO;

@Controller
public class CommunityController {
	int cntChk = 0;

	@Autowired
	private CommunityService communityService;
	@Autowired
	private CommentService commentService;

	String realPath = "c:/fullstack/swork/supermomket/src/main/webapp/resources/img/community/";

	// 글목록 검색
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("내용", "content");
		conditionMap.put("제목", "title");
		conditionMap.put("작성자","writer");
		
		System.out.println(conditionMap);
		return conditionMap;
	}

	// 글 등록
	@RequestMapping(value = "/insertCommunity.do", method = RequestMethod.POST)
	public String insertCommunity(Community_yookaVO vo, Community_noriterVO nvo, Community_shoppingVO svo,
			@RequestParam("communityID") String communityID, HttpSession session,
			@RequestParam("uploadFiles") List<MultipartFile> uploadFiles) throws Exception {
		System.out.println("insertCommunity post 실행 : " + vo);
		if (session.getAttribute("userId") != null) {
			vo.setCm_writer((String) session.getAttribute("userId"));
		}
		
		StringBuilder cm_img = new StringBuilder();
	    for (MultipartFile uploadFile : uploadFiles) {
	        if (!uploadFile.isEmpty()) {
	            String fileName = uploadFile.getOriginalFilename();
	            cm_img.append(fileName).append(","); 
	            uploadFile.transferTo(new File(realPath + fileName));
	            System.out.println("Uploaded File: " + fileName);
	        }
	    }

	    if (cm_img.length() > 0) {
	        cm_img.setLength(cm_img.length() - 1);
	        vo.setCm_img(cm_img.toString());
	    }

	    String Url = "redirect:";
		switch (communityID) {
		case "yooka":
			vo.setCm_img(cm_img.toString());
			communityService.insertYooka(vo);
			Url += "getCommunity_yookaList.do";
			break;
		case "noriter":
			nvo.setCm_img(cm_img.toString());
			communityService.insertNoriter(nvo);
			Url += "getCommunity_noriterList.do";
			break;
		case "shopping":
			svo.setCm_img(cm_img.toString());
			communityService.insertShopping(svo);
			Url += "getCommunity_shoppingList.do";
			break;
		}
		
		return Url ;
	}

	@RequestMapping(value = "/insertCommunity.do", method = RequestMethod.GET)
	public String insertView(Community_yookaVO vo) throws Exception {
		System.out.println("insertCommunity get 실행");
		return "community/insertCommunity";
	}

	// 글 수정
	@RequestMapping(value = "/updateYooka.do", method=RequestMethod.GET)
	public String updateYooka(Community_yookaVO vo, Model model) {
		System.out.println("updateYooka 실행");
		Community_yookaVO upyooka = communityService.getYooka(vo);
		model.addAttribute("yookaList1", upyooka);
		System.out.println(" update get vo : " + vo);
		return "community/updateYooka";
	}
	
	
	@RequestMapping(value = "/updateYooka.do", method=RequestMethod.POST)
	public String updateYooka(Community_yookaVO vo, 
	                          @RequestParam(value="uploadFiles", required=false) List<MultipartFile> uploadFiles,
	                          @RequestParam(value="deleteOldImage", required=false) boolean deleteOldImage, 
	                          HttpSession session, Model model) throws Exception {
		
		Community_yookaVO upyooka = communityService.getYooka(vo);
		System.out.println("update post vo: " + vo);
	    // 기존 이미지 삭제 처리
	    if (deleteOldImage && vo.getCm_img() != null) {
	        File oldFile = new File(realPath + vo.getCm_img());
	        if (oldFile.exists()) {
	            oldFile.delete();
	        }
	        vo.setCm_img(null);  // 이미지 필드 초기화
	    }

	    // 새 이미지 업로드
	    if (uploadFiles != null && !uploadFiles.isEmpty()) {
	        StringBuilder cm_img = new StringBuilder();
	        for (MultipartFile uploadFile : uploadFiles) {
	            if (!uploadFile.isEmpty()) {
	                String fileName = uploadFile.getOriginalFilename();
	                cm_img.append(fileName).append(","); 
	                uploadFile.transferTo(new File(realPath + fileName));
	                System.out.println("Uploaded File: " + fileName);
	            }
	        }

	        if (cm_img.length() > 0) {
	            cm_img.setLength(cm_img.length() - 1);
	            vo.setCm_img(cm_img.toString());
	        }
	    }

	    // 게시글 업데이트 처리
	    System.out.println("getYooka: " + vo);
	    communityService.updateYooka(vo);

	    model.addAttribute("yookaList1", upyooka);
	    return "redirect:getCommunity_yookaList.do?cm_no=" + vo.getCm_no();
	}
	@RequestMapping(value = "/updateNoriter.do", method=RequestMethod.GET)
	public String updateNoriter(Community_noriterVO vo, Model model) {
		System.out.println("updateNoriter 실행");
		Community_noriterVO upnoriter = communityService.getNoriter(vo);
		model.addAttribute("noriterList1", upnoriter);
		System.out.println(" update get vo : " + vo);
		return "community/updateNoriter";
	}
	
	@RequestMapping(value = "/updateNoriter.do", method=RequestMethod.POST)
	public String updateNoriter(Community_noriterVO vo, 
			@RequestParam(value="uploadFiles", required=false) List<MultipartFile> uploadFiles,
			@RequestParam(value="deleteOldImage", required=false) boolean deleteOldImage, 
			HttpSession session, Model model) throws Exception {
		
		Community_noriterVO upnoriter = communityService.getNoriter(vo);
		System.out.println("update post vo: " + vo);
		// 기존 이미지 삭제 처리
		if (deleteOldImage && vo.getCm_img() != null) {
			File oldFile = new File(realPath + vo.getCm_img());
			if (oldFile.exists()) {
				oldFile.delete();
			}
			vo.setCm_img(null);  // 이미지 필드 초기화
		}
		
		// 새 이미지 업로드
		if (uploadFiles != null && !uploadFiles.isEmpty()) {
			StringBuilder cm_img = new StringBuilder();
			for (MultipartFile uploadFile : uploadFiles) {
				if (!uploadFile.isEmpty()) {
					String fileName = uploadFile.getOriginalFilename();
					cm_img.append(fileName).append(","); 
					uploadFile.transferTo(new File(realPath + fileName));
					System.out.println("Uploaded File: " + fileName);
				}
			}
			
			if (cm_img.length() > 0) {
				cm_img.setLength(cm_img.length() - 1);
				vo.setCm_img(cm_img.toString());
			}
		}
		
		// 게시글 업데이트 처리
		System.out.println("getNoriter: " + vo);
		communityService.updateNoriter(vo);
		
		model.addAttribute("noriterList1", upnoriter);
		return "redirect:getCommunity_noriterList.do?cm_no=" + vo.getCm_no();
	}
	@RequestMapping(value = "/updateShopping.do", method=RequestMethod.GET)
	public String updateShopping(Community_shoppingVO vo, Model model) {
		System.out.println("updateShopping 실행");
		Community_shoppingVO upshopping = communityService.getShopping(vo);
		model.addAttribute("yookaShopping1", upshopping);
		System.out.println(" update get vo : " + vo);
		return "community/updateShopping";
	}
	
	@RequestMapping(value = "/updateShopping.do", method=RequestMethod.POST)
	public String updateShopping(Community_shoppingVO vo, 
			@RequestParam(value="uploadFiles", required=false) List<MultipartFile> uploadFiles,
			@RequestParam(value="deleteOldImage", required=false) boolean deleteOldImage, 
			HttpSession session, Model model) throws Exception {
		
		Community_shoppingVO upshopping = communityService.getShopping(vo);
		System.out.println("update post vo: " + vo);
		// 기존 이미지 삭제 처리
		if (deleteOldImage && vo.getCm_img() != null) {
			File oldFile = new File(realPath + vo.getCm_img());
			if (oldFile.exists()) {
				oldFile.delete();
			}
			vo.setCm_img(null);  // 이미지 필드 초기화
		}
		
		// 새 이미지 업로드
		if (uploadFiles != null && !uploadFiles.isEmpty()) {
			StringBuilder cm_img = new StringBuilder();
			for (MultipartFile uploadFile : uploadFiles) {
				if (!uploadFile.isEmpty()) {
					String fileName = uploadFile.getOriginalFilename();
					cm_img.append(fileName).append(","); 
					uploadFile.transferTo(new File(realPath + fileName));
					System.out.println("Uploaded File: " + fileName);
				}
			}
			
			if (cm_img.length() > 0) {
				cm_img.setLength(cm_img.length() - 1);
				vo.setCm_img(cm_img.toString());
			}
		}
		
		// 게시글 업데이트 처리
		System.out.println("getShopping: " + vo);
		communityService.updateShopping(vo);
		
		model.addAttribute("shoppingList1", upshopping);
		return "redirect:getCommunity_shoppingList.do?cm_no=" + vo.getCm_no();
	}


	// 글 삭제
	@RequestMapping("/deleteYooka.do")
	public String deleteYooka(Community_yookaVO vo, HttpServletRequest request) {
		realPath = request.getSession().getServletContext().getRealPath("/resources/img/community/");
		if (vo.getCm_img() != null) {
//			System.out.println("파일삭제" + realPath + vo.getCm_img());
			File file = new File(realPath + vo.getCm_img());
			file.delete();
		}
		communityService.deleteYooka(vo);
		return "redirect:getCommunity_yookaList.do";

	}

	@RequestMapping("/deleteNoriter.do")
	public String deleteNoriter(Community_noriterVO vo, HttpServletRequest request) {
		realPath = request.getSession().getServletContext().getRealPath("/resources/img/community/");
		if (vo.getCm_img() != null) {
//			System.out.println("파일삭제" + realPath + vo.getCm_img());
			File file = new File(realPath + vo.getCm_img());
			file.delete();
		}
		communityService.deleteNoriter(vo);
		return "redirect:getCommunity_noriterList.do";

	}

	@RequestMapping("/deleteShopping.do")
	public String deleteShopping(Community_shoppingVO vo, HttpServletRequest request) {
		realPath = request.getSession().getServletContext().getRealPath("/resources/img/community/");
		if (vo.getCm_img() != null) {
//			System.out.println("파일삭제" + realPath + vo.getCm_img());
			File file = new File(realPath + vo.getCm_img());
			file.delete();
		}
		communityService.deleteShopping(vo);
		return "community/getCommunity_shoppingList";

	}

//	// 글 상세조회
//	@RequestMapping("/getYooka/{seq}")
//	public String getYooka(@RequestParam(value = "error", required = false) String error, @PathVariable("cm_no") int cm_no, Community_yookaVO vo, Model model) {
//		vo.setCm_no(cm_no);
//		Community_yookaVO yooka = communityService.getYooka(vo);
//		if (!(error == null || error.equals("")))
//			cntChk = 0;
//		else if (cntChk <= 0)
//			communityService.updateCntYooka(yooka);
//		else
//			cntChk = 0;
//		yooka = communityService.getYooka(vo);
//
//		model.addAttribute("yooka", yooka);
//		return "community/getYooka";
//	}
//
//	@RequestMapping("/getNoriter/{seq}")
//	public String getNoriter(@RequestParam(value = "error", required = false) String error, @PathVariable("cm_no") int cm_no, Community_noriterVO vo, Model model) {
//		vo.setCm_no(cm_no);
//		Community_noriterVO noriter = communityService.getNoriter(vo);
//		if (!(error == null || error.equals("")))
//			cntChk = 0;
//		else if (cntChk <= 0)
//			communityService.updateCntNoriter(noriter);
//		else
//			cntChk = 0;
//		noriter = communityService.getNoriter(vo);
//
//		model.addAttribute("noriter", noriter);
//		return "community/getNoriter";
//	}
//
//	@RequestMapping("/getShopping/{seq}")
//	public String getShopping(@RequestParam(value = "error", required = false) String error, @PathVariable("cm_no") int cm_no, Community_shoppingVO vo, Model model) {
//		vo.setCm_no(cm_no);
//		Community_shoppingVO shopping = communityService.getShopping(vo);
//		if (!(error == null || error.equals("")))
//			cntChk = 0;
//		else if (cntChk <= 0)
//			communityService.updateShopping(shopping);
//		else
//			cntChk = 0;
//		shopping = communityService.getShopping(vo);
//
//		model.addAttribute("shopping", shopping);
//		return "community/getShopping";
//	}

	@RequestMapping("/getYooka.do")
	public String getYooka(@RequestParam(value = "error", required = false) String error, 
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cm_no") int cm_no,
			Community_yookaVO vo, Model model, 
			Comment_yookaVO cvo, Updown_YookaVO updown) {
		System.out.println("yooka상세조회vo : " + vo);
		Community_yookaVO yooka = communityService.getYooka(vo);

		if (!(error == null || error.equals("")))
			cntChk = 0;
		else if (cntChk <= 0)
			communityService.updateCntYooka(yooka);
		else
			cntChk = 0;

		yooka = communityService.getYooka(vo);

		cvo.setCm_no(cm_no); // 게시판 번호 설정
		List<Comment_yookaVO> commentList = commentService.getCommentYookaList(cvo);

		model.addAttribute("yooka", yooka);
		model.addAttribute("commentList", commentList);
//		System.out.println("yooka :" + yooka);
		System.out.println("vo : " + vo);
		
		model.addAttribute("likeResult", communityService.getLikeYooka(updown));
		model.addAttribute("hateResult", communityService.getHateYooka(updown));
		 System.out.println("like"+communityService.getLikeYooka(updown));
		 System.out.println("hate" +communityService.getHateYooka(updown));
		
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
//		System.out.println("vo.getSearchCondition() : " +vo);
		model.addAttribute("commentYooka", commentService.getCommentYookaList(cvo));
		model.addAttribute("commentYooka1", commentService.getCommentYookaList(cvo));
//		System.out.println("commentYooka : " + commentService.getCommentYookaList(cvo));

		model.addAttribute("nowPage", nowPage);
		return "community/getYooka";
	}

	@RequestMapping("/getNoriter.do")
	public String getNoriter(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "nowPage", required = false) String nowPage, @RequestParam(value = "cm_no") int cm_no,
			Community_noriterVO vo, Model model, Comment_noriterVO cvo,
			Updown_NoriterVO updown) {
//		System.out.println("noriter상세조회vo : " + vo);

		vo.setCm_no(cm_no);
		Community_noriterVO noriter = communityService.getNoriter(vo);
		if (!(error == null || error.equals("")))
			cntChk = 0;
		else if (cntChk <= 0)
			communityService.updateCntNoriter(noriter);
		else
			cntChk = 0;

		cvo.setCm_no(cm_no); // 게시판 번호 설정
		List<Comment_noriterVO> commentList = commentService.getCommentNoriterList(cvo);

		
		model.addAttribute("likeResult", communityService.getLikeNoriter(updown));
		model.addAttribute("hateResult", communityService.getHateNoriter(updown));
		
		model.addAttribute("noriter", noriter);
		model.addAttribute("commentList", commentList);
//		System.out.println("noriter :" + noriter);
		
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("nowPage", nowPage);
		
		
		model.addAttribute("commentNoriter", commentService.getCommentNoriterList(cvo));
		model.addAttribute("commentNoriter1", commentService.getCommentNoriterList(cvo));
//		System.out.println("commentNoriter : " + commentService.getCommentNoriterList(cvo));
		return "community/getNoriter";
	}

	@RequestMapping("/getShopping.do")
	public String getCommunityYooka(@RequestParam(value = "error", required = false) String error, 
			@RequestParam(value = "nowPage", required = false) String nowPage, 
			Community_shoppingVO vo,
			Model model, Comment_shoppingVO cvo, 
			@RequestParam(value = "cm_no") int cm_no,
			Updown_ShoppingVO updown) {
//		System.out.println("상세조회vo : " + vo);
		vo.setCm_no(cm_no);
		Community_shoppingVO shopping = communityService.getShopping(vo);
		if (!(error == null || error.equals("")))
			cntChk = 0;
		else if (cntChk <= 0)
			communityService.updateCntShopping(shopping);
		else
			cntChk = 0;

		shopping = communityService.getShopping(vo);
		cvo.setCm_no(cm_no); // 게시판 번호 설정
		List<Comment_shoppingVO> commentList = commentService.getCommentShoppingList(cvo);

		
		model.addAttribute("likeResult", communityService.getLikeShopping(updown));
		model.addAttribute("hateResult", communityService.getHateShopping(updown));
		
		model.addAttribute("shopping", shopping);
		model.addAttribute("commentList", commentList);
//		System.out.println("shopping :" + shopping);
		
		
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("nowPage", nowPage);
		

		model.addAttribute("commentShopping", commentService.getCommentShoppingList(cvo));
		model.addAttribute("commentShopping1", commentService.getCommentShoppingList(cvo));
//		System.out.println("commentShopping : " + commentService.getCommentShoppingList(cvo));
		return "community/getShopping";
	}
	// 글 목록

	@RequestMapping("/getCommunity_yookaList.do")
	public String getCommunityYooka(PagingVO pv, 
			Comment_yookaVO cvo, Community_yookaVO vo, Model model, HttpSession session,
			Updown_YookaVO uvo, @RequestParam(value = "nowPage", required = false) String nowPage
			) {
//		System.out.println("yooka목록");
		
		String cntPerPage = "10";
		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("cm_title");
		
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		
		cvo.getCm_no();
		int replyCnt = commentService.replyCntYooka(cvo);
//		System.out.println("컨트롤러 cvo : " + cvo );
//		System.out.println("replyCnt : " + replyCnt);
		int total = communityService.countYooka(vo);
//		System.out.println("total :" + total);
		if (nowPage == null) {
			nowPage = "1";
		}
		
		int like = communityService.getLikeYooka(uvo);
		int hate = communityService.getHateYooka(uvo);
		
		
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));
		
		
		model.addAttribute("replyCntYooka", replyCnt);
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("yookaList", communityService.getYookaList(vo));
		 System.out.println("cvo: " + cvo);
		 System.out.println("uvo: " + uvo);
		model.addAttribute("likeResult1", like);
		model.addAttribute("hateResult1", hate);
		System.out.println("like " +like);
		 System.out.println("hate " +hate);
		return "community/getCommunity_yookaList";
	}

	@RequestMapping("/getCommunity_noriterList.do")
	public String getCommunityNoriter(PagingVO pv, Community_noriterVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage) {
//		System.out.println("noriter목록");

		String cntPerPage = "10";
		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("title");
		else
			vo.setSearchCondition(vo.getSearchCondition());
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		else
			vo.setSearchKeyword(vo.getSearchKeyword());

		int total = communityService.countNoriter(vo);
//		System.out.println("total :" + total);
		if (nowPage == null) {
			nowPage = "1";
		}

		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));

		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("noriterList", communityService.getNoriterList(vo));
		return "community/getCommunity_noriterList";
	}

	@RequestMapping("/getCommunity_shoppingList.do")
	public String getCommunityShopping(PagingVO pv, Community_shoppingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage) {
//		System.out.println("shopping목록");

		String cntPerPage = "10";
		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("title");
		else
			vo.setSearchCondition(vo.getSearchCondition());
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		else
			vo.setSearchKeyword(vo.getSearchKeyword());

		int total = communityService.countShopping(vo);
		System.out.println("total :" + total);
		if (nowPage == null) {
			nowPage = "1";
		}

		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));

		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("shoppingList", communityService.getShoppingList(vo));

		return "community/getCommunity_shoppingList";
	}

	/* 댓글 Controller */

	// 댓글 등록
	@RequestMapping("/insertCommentYooka.do")
	public String insertCommentYooka(Comment_yookaVO vo, Community_yookaVO cvo, HttpSession session) throws Exception {
		if (session.getAttribute("userId") != null) {
			vo.setCo_writer((String) session.getAttribute("userId"));
		}
		String url = "";
//		System.out.println("댓글등록");
		communityService.getYooka(cvo);
		int result = commentService.insertCommentYooka(vo);

		if (result > 0) {
			url = "redirect:getYooka.do?cm_no=" + vo.getCm_no();
		}
		return url;
	}

	@RequestMapping("/insertCommentNoriter.do")
	public String insertCommentNoriter(Comment_noriterVO vo, Community_noriterVO cvo, HttpSession session) throws Exception {
		if (session.getAttribute("userId") != null) {
			vo.setCo_writer((String) session.getAttribute("userId"));
		}
		String url = "";
//		System.out.println("댓글등록");
		communityService.getNoriter(cvo);
		int result = commentService.insertCommentNoriter(vo);

		if (result > 0) {
			url = "redirect:getNoriter.do?cm_no=" + vo.getCm_no();
		}
		return url;
	}

	@RequestMapping("/insertCommentShopping.do")
	public String insertCommentShopping(Comment_shoppingVO vo, Community_shoppingVO cvo, HttpSession session) throws Exception {
		if (session.getAttribute("userId") != null) {
			vo.setCo_writer((String) session.getAttribute("userId"));
		}
		String url = "";
//		System.out.println("댓글등록");
		communityService.getShopping(cvo);
		int result = commentService.insertCommentShopping(vo);

		if (result > 0) {
			url = "redirect:getShopping.do?cm_no=" + vo.getCm_no();
		}
		return url;
	}

	// 댓글 수정
	@RequestMapping("/updateCommentYooka.do")
	public String updateCommentYooka(Comment_yookaVO vo, HttpSession session, @RequestParam(value = ("co_date2"), required = false) String co_date2) {
//		System.out.println("댓글수정 controller : " + vo);
		vo.setCo_date2(co_date2);
		String url = "";
		int result = commentService.updateCommentYooka(vo);
//		System.out.println("result :" + result);
		if (result > 0) {
			url = "redirect:getYooka.do?cm_no=" + vo.getCm_no();
		} else {
			url = "community/getYooka";
		}
		return url;
	}

	@RequestMapping("/updateCommentNoriter.do")
	public String updateCommentNoriter(Comment_noriterVO vo, HttpSession session) {
//		System.out.println("댓글수정 controller : " + vo);
		String url = "";
		int result = commentService.updateCommentNoriter(vo);
//		System.out.println("result :" + result);
		if (result > 0) {
			url = "redirect:getNoriter.do?cm_no=" + vo.getCm_no();
		} else {
			url = "community/getNoriter";
		}
		return url;
	}

	@RequestMapping("/updateCommentShopping.do")
	public String updateCommentShopping(Comment_shoppingVO vo, HttpSession session) {
//		System.out.println("댓글수정 controller : " + vo);
		String url = "";
		int result = commentService.updateCommentShopping(vo);
//		System.out.println("result :" + result);
		if (result > 0) {
			url = "redirect:getShopping.do?cm_no=" + vo.getCm_no();
		} else {
			url = "community/getShopping";
		}
		return url;
	}

	// 댓글 삭제
	@RequestMapping("/deleteCommentYooka.do")
	public String deleteCommentYooka(Comment_yookaVO vo, HttpSession session) {
//		System.out.println("댓글 삭제 cotroller : " + vo);
		String url = "";
		int result = commentService.deleteCommentYooka(vo);
//		System.out.println("result :" + result);
		if (result > 0) {
			url = "redirect:getYooka.do?cm_no=" + vo.getCm_no();
		} else {
			url = "community/getYooka";
		}
		return url;
	}

	@RequestMapping("/deleteCommentNoriter.do")
	public String deleteCommentNoriter(Comment_noriterVO vo, HttpSession session) {
//		System.out.println("댓글 삭제 cotroller : " + vo);
		String url = "";
		int result = commentService.deleteCommentNoriter(vo);
//		System.out.println("result :" + result);
		if (result > 0) {
			url = "redirect:getYooka.do?cm_no=" + vo.getCm_no();
		} else {
			url = "community/getYooka";
		}
		return url;
	}

	@RequestMapping("/deleteCommentShopping.do")
	public String deleteCommentShopping(Comment_shoppingVO vo, HttpSession session) {
//		System.out.println("댓글 삭제 cotroller : " + vo);
		String url = "";
		int result = commentService.deleteCommentShopping(vo);
//		System.out.println("result :" + result);
		if (result > 0) {
			url = "redirect:getShopping.do?cm_no=" + vo.getCm_no();
		} else {
			url = "community/getShopping";
		}
		return url;
	}

	// 대댓글 등록
	@RequestMapping("/insertReplyYooka.do")
	public String insertReplyYooka(Comment_yookaVO vo, Community_yookaVO cvo, HttpSession session) throws Exception {
		if (session.getAttribute("userId") != null) {
			vo.setCo_writer((String) session.getAttribute("userId"));
		}
		String url = "";
		communityService.getYooka(cvo);
//		System.out.println("대댓글등록");
		int result = commentService.insertReplyYooka(vo);

		if (result > 0) {
			url = "redirect:getYooka.do?cm_no=" + vo.getCm_no();
		}
		return url;
	}

	@RequestMapping("/insertReplyNoriter.do")
	public String insertReplyNoriter(Comment_noriterVO vo, Community_noriterVO cvo, HttpSession session) throws Exception {
		if (session.getAttribute("userId") != null) {
			vo.setCo_writer((String) session.getAttribute("userId"));
		}
		String url = "";
		communityService.getNoriter(cvo);
		System.out.println("대댓글등록");
		int result = commentService.insertReplyNoriter(vo);

		if (result > 0) {
			url = "redirect:getNoriter.do?cm_no=" + vo.getCm_no();
		}
		return url;
	}

	@RequestMapping("/insertReplyShopping.do")
	public String insertReplyShopping(Comment_shoppingVO vo, Community_shoppingVO cvo, HttpSession session) throws Exception {
		if (session.getAttribute("userId") != null) {
			vo.setCo_writer((String) session.getAttribute("userId"));
		}
		String url = "";
		communityService.getShopping(cvo);
//		System.out.println("대댓글등록");
		int result = commentService.insertReplyShopping(vo);

		if (result > 0) {
			url = "redirect:getShopping.do?cm_no=" + vo.getCm_no();
		}
		return url;
	}
	// 대댓글 수정
	@RequestMapping("/updateReplyYooka.do")
	public String updateReplyYooka(Comment_yookaVO vo, HttpSession session) {
//		System.out.println("대댓글수정 controller : " + vo);
		String url = "";
		int result = commentService.updateReplyYooka(vo);
//		System.out.println("result :" + result);
		if (result > 0) {
			url = "redirect:getYooka.do?cm_no=" + vo.getCm_no();
		} else {
			url = "community/getYooka";
		}
		return url;
	}

	@RequestMapping("/updateReplyNoriter.do")
	public String updateReplyNoriter(Comment_noriterVO vo, HttpSession session) {
//		System.out.println("대댓글수정 controller : " + vo);
		String url = "";
		int result = commentService.updateReplyNoriter(vo);
//		System.out.println("result :" + result);
		if (result > 0) {
			url = "redirect:getNoriter.do?cm_no=" + vo.getCm_no();
		} else {
			url = "community/getNoriter";
		}
		return url;
	}

	@RequestMapping("/updateReplyShopping.do")
	public String updateReplyShopping(Comment_shoppingVO vo, HttpSession session) {
//		System.out.println("대댓글수정 controller : " + vo);
		String url = "";
		int result = commentService.updateReplyShopping(vo);
//		System.out.println("result :" + result);
		if (result > 0) {
			url = "redirect:getShopping.do?cm_no=" + vo.getCm_no();
		} else {
			url = "community/getShopping";
		}
		return url;
	}

	// 대댓글 삭제
	@RequestMapping("/deleteReplyYooka.do")
	public String deleteReplyYooka(Comment_yookaVO vo, HttpSession session) {
//		System.out.println("대댓글 삭제 cotroller : " + vo);
		String url = "";
		int result = commentService.deleteReplyYooka(vo);
//		System.out.println("result :" + result);
		if (result > 0) {
			url = "redirect:getYooka.do?cm_no=" + vo.getCm_no();
		} else {
			url = "community/getYooka";
		}
		return url;
	}

	@RequestMapping("/deleteReplyNoriter.do")
	public String deleteReplyNoriter(Comment_noriterVO vo, HttpSession session) {
//		System.out.println("대댓글 삭제 cotroller : " + vo);
		String url = "";
		int result = commentService.deleteReplyNoriter(vo);
//		System.out.println("result :" + result);
		if (result > 0) {
			url = "redirect:getNoriter.do?cm_no=" + vo.getCm_no();
		} else {
			url = "community/getNoriter";
		}
		return url;
	}

	@RequestMapping("/deleteReplyShopping.do")
	public String deleteReplyShopping(Comment_shoppingVO vo, HttpSession session) {
//		System.out.println("대댓글 삭제 cotroller : " + vo);
		String url = "";
		int result = commentService.deleteReplyShopping(vo);
//		System.out.println("result :" + result);
		if (result > 0) {
			url = "redirect:getShopping.do?cm_no=" + vo.getCm_no();
		} else {
			url = "community/getShopping";
		}
		return url;
	}
	
	//추천
	@ResponseBody
	@RequestMapping(value="/likeYooka.do" , method = RequestMethod.POST)
	public Integer[] likeYooka(Updown_YookaVO vo, HttpSession session) {
		 
		if (session.getAttribute("userId") != null) {
			vo.setCm_writer((String)session.getAttribute("userId"));
		}
		
		Integer[] resultarr = new Integer[2];
		System.out.println(vo);
		
		int result = communityService.insertUpDownYooka(vo);
		
		if(result > 0) {
			resultarr[0] = communityService.getLikeYooka(vo);
			resultarr[1] = communityService.getHateYooka(vo);
		}
	 
	 
		return resultarr;
	}
	@ResponseBody
	@RequestMapping(value="/likeNoriter.do" , method = RequestMethod.POST)
	public Integer[] likeNoriter(Updown_NoriterVO vo, HttpSession session) {
		
		if (session.getAttribute("userId") != null) {
			vo.setCm_writer((String)session.getAttribute("userId"));
		}
		
		Integer[] resultarr = new Integer[2];
		System.out.println(vo);
		
		int result = communityService.insertUpDownNoriter(vo);
		
		if(result > 0) {
			resultarr[0] = communityService.getLikeNoriter(vo);
			resultarr[1] = communityService.getHateNoriter(vo);
		
		}
		return resultarr;
	}
	@ResponseBody
	@RequestMapping(value="/likeShopping.do" , method = RequestMethod.POST)
	public Integer[] likeShopping(Updown_ShoppingVO vo, HttpSession session) {
		
		if (session.getAttribute("userId") != null) {
			vo.setCm_writer((String)session.getAttribute("userId"));
		}
		
		Integer[] resultarr = new Integer[2];
		System.out.println(vo);
		
		int result = communityService.insertUpDownShopping(vo);
		
		if(result > 0) {
			resultarr[0] = communityService.getLikeShopping(vo);
			resultarr[1] = communityService.getHateShopping(vo);
		}
		
		
		return resultarr;
	}
	
	// 관리자 페이지 리스트 Yooka
	@RequestMapping("/adminYooka.do")
	public String adminYookaList(Community_yookaVO vo, Model model) {
		System.out.println("관리자 페이지 ㄱㄱ");
		model.addAttribute("yookaList", communityService.getYookaAdmin(vo));
		return "community/admin_yooka";
	}
	
	// 관리자 페이지 수정
	@ResponseBody
	@RequestMapping("adminYookaUpdate.do")
	public List<Community_yookaVO> updateYookaAdmin(Community_yookaVO vo, Model model){
		System.out.println("관리자 수정!");
		List<Community_yookaVO> yookaList = null;
		
		int result = communityService.updateYookaAdmin(vo);
		
		if(result > 0) {
			yookaList = communityService.getYookaAdmin(vo);
		}
		
		return yookaList;
	}
	
	//관리자 페이지 삭제
	@ResponseBody
	@RequestMapping("adminYookaDelete.do")
	public List<Community_yookaVO> deleteYookaAdmin(Community_yookaVO vo, Model model){
		System.out.println("관리자 삭제!");
		List<Community_yookaVO> deleteList = null;
		
		int result = communityService.deleteYookaAdmin(vo);
		
		if(result > 0) {
			deleteList = communityService.getYookaAdmin(vo);
		}
		
		return deleteList;
	}
}













