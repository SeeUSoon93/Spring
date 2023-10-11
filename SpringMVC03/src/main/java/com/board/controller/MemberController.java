package com.board.controller;

import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.entity.Member;
import com.board.mapper.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@GetMapping("/registerCheck.do")
	public @ResponseBody int registerCheck(@RequestParam("memId") String memId) {
		System.out.println("중복체크?");
		Member member = memberMapper.memberSelect(memId);
		int result = 1;
		if(member != null) {
			result = 0;
		}
		return result;
	}
	
	//로그아웃
	@GetMapping("/logout.do")
	public String logout(HttpSession session, RedirectAttributes rttr){
		System.out.println("로그아웃 할거냐?");
		session.invalidate();
		rttr.addFlashAttribute("logout", "logout");
		System.out.println("모델에 담았냐?");		
		return "redirect:/";
	}
	
	//회원가입
	@PostMapping("/join.do")
	public String join(Member m, HttpSession session, RedirectAttributes rttr){
	System.out.println("회원가입 할거냐?"+m.toString());		
		// RedirectAttributes
		// - redirect 방식으로 페이지 이동을 하는데, 저장해야할 정보가 있을 때
		// request(model) 없어지고, session을 사용하기에는 비효율적
		// 딱 한번만 데이터를 저장해서 다음페이지에 뿌려주는 객체
		
		// 유효성 검사안했을 때 입력안한 값있나 확인
		// 난 필요없는 코드긴 함////////////////////////////////////////////
	if(m.getMemId() == null || m.getMemId().equals("")
       || m.getMemPw()==null || m.getMemPw().equals("")
       || m.getMemName()==null || m.getMemName().equals("")
       || m.getMemAge()==0 // memAge는 int형, int형은 값을 잘못 가져올 경우 기본값이 0
       || m.getMemEmail()==null || m.getMemEmail().equals("") ) {
		// 회원가입 실패
	    // "모든 정보를 입력해주세요"
		rttr.addFlashAttribute("msgType", "실패 메세지");
		rttr.addFlashAttribute("msg", "모든 정보를 입력해주세요");
	    return "redirect:/joinForm.do";
	   /////////////////////////////////////////////////////////////
	} else {

		int cnt = memberMapper.memberInsert(m);

		if (cnt == 1) {
			session.setAttribute("mvo", m);
			System.out.println("회원가입 했냐?");
			rttr.addFlashAttribute("msgType", "성공 메세지");
			rttr.addFlashAttribute("msg", "회원가입에 성공했습니다");
			return "redirect:/joinForm.do";
		} else {
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "회원가입에 실패했습니다");
			return "redirect:/joinForm.do";
		}
	}
}
	
	
}
