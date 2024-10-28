package com.spring.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.mom.svc.Community_vsService;
import com.spring.mom.vo.Community_vsVO;
import com.spring.mom.vo.VsimgVO;

@Controller
public class Community_vsController {

	@Autowired
	private Community_vsService svc;

	@RequestMapping("/vs_index.do")
	public String getBoardList(Community_vsVO vo, Model model) {
		System.out.println("컨트롤러 실행");
		model.addAttribute("boardList", svc.getBoardList(vo));
		return "community_vs/community_vs_index";
	}

	// 글 작성 페이지로 이동
	@GetMapping("/vs_write.do")
	public String getWriterForm() {
		System.out.println("GET 방식의 /vs_write.do 서블릿 실행");
		return "community_vs/community_vs_write";
	}

	// 글 작성
	@PostMapping("/vs_write.do")
	public String insertBoard(Community_vsVO vo, MultipartHttpServletRequest request)
			throws IllegalStateException, IOException {
		System.out.println("POST 방식의 /vs_write.do 서블릿 실행");
		System.out.println(vo);

		MultipartFile img1 = vo.getVs_img1_file();
		MultipartFile img2 = vo.getVs_img2_file();

		String uploadPath = "C:/swork/supermomket/src/main/webapp/resources/img/vs/";
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists())
			uploadDir.mkdir();

		if (img1 != null && img2 != null) {

			if (!img1.isEmpty() && !img2.isEmpty()) {
				vo.setVs_img1(img1.getOriginalFilename());
				vo.setVs_img2(img2.getOriginalFilename());

				img1.transferTo(new File(uploadPath + vo.getVs_img1()));
				img2.transferTo(new File(uploadPath + vo.getVs_img2()));

				System.out.println("Filename1: " + vo.getVs_img1());
				System.out.println("Filename2: " + vo.getVs_img2());
			}
		}

		System.out.println(vo);

		int result = svc.insertBoard(vo);

		if (result > 0) {
			System.out.println("글 등록 성공");
		} else {
			System.out.println("글 등록 실패");
		}

		return "redirect:vs_index.do";
	}

	// 글 상세보기
	@RequestMapping("/vs_info.do")
	public String selectBoardInfo(Community_vsVO vo, Model model) {
		System.out.println("/vs_info.do 서블릿 실행");
		System.out.println(vo.getVs_no());
		System.out.println("VO를 가져와요: " + svc.getBoardInfo(vo));
		model.addAttribute("boardList", svc.getBoardInfo(vo));
		return "community_vs/community_vs_info";
	}

	// 글 수정페이지 이동
	@GetMapping("/vs_update.do")
	public String updateBoardInfo(Community_vsVO vo, Model model) {
		System.out.println("/vs_update.do  GET 서블릿 실행");
		System.out.println(vo.getVs_no());
		model.addAttribute("boardList", svc.getBoardInfo(vo));
		return "community_vs/community_vs_modify";
	}

	// 글 수정
	@PostMapping("/vs_update.do")
	public String updateBoard(Community_vsVO vo, MultipartHttpServletRequest request)
			throws IllegalStateException, IOException {
		System.out.println("POST 방식의 /vs_update.do 서블릿 실행");
//		System.out.println(vo);
		System.out.println(vo.getVs_no());

		MultipartFile img1 = vo.getVs_img1_file();
		MultipartFile img2 = vo.getVs_img2_file();

		String uploadPath = "C:/swork/supermomket/src/main/webapp/resources/img/vs/";
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists())
			uploadDir.mkdir();

		if (img1 != null && img2 != null) {

			if (!img1.isEmpty() && !img2.isEmpty()) {
				vo.setVs_img1(img1.getOriginalFilename());
				vo.setVs_img2(img2.getOriginalFilename());

				img1.transferTo(new File(uploadPath + vo.getVs_img1()));
				img2.transferTo(new File(uploadPath + vo.getVs_img2()));

				System.out.println("Filename1: " + vo.getVs_img1());
				System.out.println("Filename2: " + vo.getVs_img2());
			}
		}

		System.out.println(vo);

		int result = svc.updateBoard(vo);

		if (result > 0) {
			System.out.println("글 수정 성공");
		} else {
			System.out.println("글 수정 실패");
		}
		return "redirect:vs_index.do";
	}

	// 글 삭제
	@GetMapping("/vs_delete.do")
	public String deleteBoard(Community_vsVO vo) {
		System.out.println("/vs_delete.do 서블릿 실행");
		System.out.println(vo.getVs_no());

		int result = svc.deleteBoard(vo);

		if (result > 0) {
			System.out.println("글 삭제 성공");
		} else {
			System.out.println("글 삭제 실패");
		}
		return "redirect:vs_index.do";
	}

	@PostMapping("/vs_vote.do")
	public void insertVote(VsimgVO vo) {
		System.out.println(vo.getV_no());
		System.out.println(vo.getVs_no());

		svc.insertVote(vo);
	}

}
