package com.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.server.reactive.ContextPathCompositeHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.entity.Member;
import com.board.mapper.MemberMapper;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;
	
	
	@PostMapping("/imageUpdate.do")
	public String imageUpdate(Member m, HttpSession session, RedirectAttributes rttr, HttpServletRequest request){
		System.out.println(m.toString());
		String memId = ((Member)session.getAttribute("mvo")).getMemId(); // 중복확인 안함
		
		MultipartRequest multi;
		// MultipartRequest 객체를 생성하기위한 매개변수 5가지
		// 1. request 객체
		// 2. 사진저장경로
		// 3. 허용 가능 사이즈
		// 4. 파일에 대한 인코딩
		// 5. 파일이름 중복제거
		String savePath = request.getSession().getServletContext().getRealPath("resources/profile");
		System.out.println("savePath : " + savePath);
		int maxSize = 1024 * 1024; //100mb
		String encoding = "UTF-8";
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		try {
			multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
			System.out.println(multi.getFileNames());
		} catch (IOException e) {
			System.out.println("파일크기 넘었냐?");
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "파일크기를 10MB를 넘을 수 없숩나더");			
			return "redirect:/imageForm.do";
		}
		
		File file = multi.getFile("memProfile");
		if(file != null) {
			// 이미지 파일인지 판별
			System.out.println("파일이름 뭐냐?"+file.getName());		
			String exe = file.getName().split("\\.")[1];
			System.out.println(exe);
			exe = exe.toLowerCase(); // 소문자로 변환
			if(!(exe.equals("jpg") || exe.equals("png") || exe.equals("jpeg") || exe.equals("gif"))) {
				System.out.println("이상한 파일 넣었냐?");
				file.delete();
				rttr.addFlashAttribute("msgType", "실패 메세지");
				rttr.addFlashAttribute("msg", "이미지 파일만 가능합니다.");			
				return "redirect:/imageForm.do";				
			}else {
				System.out.println("사진파일 이냐?");
				// 기존에 가지고 있던 프로필 사진 삭제
				System.out.println("사진업로드 할거냐?");
				String oldImg = memberMapper.registerCheck(memId).getMemProfile();
				if(oldImg != null) {
					System.out.println(oldImg);
					File oldFile = new File(savePath + "/"+oldImg);
					oldFile.delete();
				}
			}
		}
		
		// DB에 memProfile 값 넣어주기
		// memId, newProfile
		String newProfile = multi.getFilesystemName("memProfile");
		Member mvo = new Member();
		mvo.setMemId(memId);
		mvo.setMemProfile(newProfile);
		
		int cnt = memberMapper.updateImage(mvo);
		
		if(cnt == 1) {
			rttr.addFlashAttribute("msgType", "성공 메세지");
			rttr.addFlashAttribute("msg", "이미지 업로드 성공!");				
			return "redirect:/";
		}else {
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "이미지 업로드 실패!");			
			return "redirect:/imageForm.do";				
		}
	}

	
	@GetMapping("/imageForm.do")
	public String imageForm() {
		return "member/imageForm";
	}
	
	@PostMapping("/update.do")
	public String update(Member m, HttpSession session, RedirectAttributes rttr) {
		System.out.println(m.toString());
		if(m.getMemId() == null || m.getMemId().equals("") 
				|| m.getMemPw() == null || m.getMemPw().equals("") || m.getMemGender() == null
				|| m.getMemGender().equals("")
				|| m.getMemName() == null || m.getMemName().equals("")
				|| m.getMemAge() == 0 || m.getMemEmail() == null || m.getMemEmail().equals("")) {   
				// 회원가입 실패
				// "모든 정보를 입력해주요."
				rttr.addFlashAttribute("msgType", "실패 메세지");
				rttr.addFlashAttribute("msg", "모든 정보를 입력해주요.");
				return "redirect:/updateForm.do";
			}else {
				int cnt = memberMapper.update(m);
				
				if(cnt == 1) {
					// 회원수정 성공
					session.setAttribute("mvo", m);
					rttr.addFlashAttribute("msgType", "성공 메세지");
					rttr.addFlashAttribute("msg", "회원정보 수정에 성공하셨습니다.");				
					return "redirect:/";
				}else {
					// 회원가입 실패
					rttr.addFlashAttribute("msgType", "실패 메세지");
					rttr.addFlashAttribute("msg", "회원정보 수정에 실패하셨습니다.");
					return "redirect:/updateForm.do";
				}
			}
		
	}
	
	// 회원정보 수정하는 폼으로 이동
	@GetMapping("/updateForm.do")
	public String updateForm() {
		return "member/updateForm";
	}
	
	// 로그인 기능
	@PostMapping("/login.do")
	public String login(Member m, HttpSession session, RedirectAttributes rttr) {
		// 실습
		// 입력한 memID와 memPw가 일치하는 회원을 DB에서 가져와서
		// 로그인 성공시
		// - session에 mvo라는 이름으로 저장 후 -> index.jsp로 이동 -> 모달창에 "로그인에 성공했습니다."
		// 로그인 실패시
		// - loginForm.jsp로 이동 -> 모달창에 "다시 로그인해주세요."
		
		Member mvo = memberMapper.login(m);
		
		if(mvo == null) {
			// 로그인 실패
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "다시 로그인해주세요.");
			return "redirect:/loginForm.do";
		}else {
			// 로그인 성공
			rttr.addFlashAttribute("msgType", "성공 메세지");
			rttr.addFlashAttribute("msg", "로그인에 성공했습니다.");
			session.setAttribute("mvo", mvo);
			return "redirect:/";
		}
		
	}
	
	// 로그인 폼으로 이동
	@GetMapping("/loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}
	
	// 로그아웃 기능
	@GetMapping("/logout.do")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		session.removeAttribute("mvo");
		// session.invalidate();
		rttr.addFlashAttribute("msgType", "로그아웃 메세지");
		rttr.addFlashAttribute("msg", "정상적으로 로그아웃 되었습니다.");
		return "redirect:/";
	}
	
	
	// 회원가입 기능
	@PostMapping("/join.do")
	public String join(Member m, HttpSession session, RedirectAttributes rttr) {
		
		// RedirectAttributes
		// - redirect 방식으로 페이지 이동을 하는데, 저장해야할 정보가 있을 때
		// request(model) 없어지고, session을 사용하기에는 비효율적
		// 딱 한번만 데이터를 저장해서 다음페이지에 뿌려주는 객체
		
		if(m.getMemId() == null || m.getMemId().equals("") 
			|| m.getMemPw() == null || m.getMemPw().equals("")
			|| m.getMemName() == null || m.getMemName().equals("")
			|| m.getMemAge() == 0 || m.getMemEmail() == null || m.getMemEmail().equals("")) {   
			// 회원가입 실패
			// "모든 정보를 입력해주요."
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "모든 정보를 입력해주요.");
			return "redirect:/joinForm.do";
		}else {
			int cnt = memberMapper.join(m);
			
			if(cnt == 1) {
				// 회원가입 성공// 로그인 상태
				// "회원가입에 성공했습니다."
				session.setAttribute("mvo", m);
				rttr.addFlashAttribute("msgType", "성공 메세지");
				rttr.addFlashAttribute("msg", "회원가입에 성공했습니다.");				
				return "redirect:/";
			}else {
				// 회원가입 실패
				rttr.addFlashAttribute("msgType", "실패 메세지");
				rttr.addFlashAttribute("msg", "회원가입에 실패했습니다.");
				return "redirect:/joinForm.do";
			}
		}
		
	}
	
	
	// 회원가입 폼으로 이동
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "member/joinForm";
	}
	
	// 아이디 중복체크
	@GetMapping("/registerCheck.do")
	public @ResponseBody int registerCheck(@RequestParam("memId") String memId) {
		Member member = memberMapper.registerCheck(memId);
		
		if(member == null) {
			// 사용 가능한 아이디
			return 1;
		}else {
			return 0;
		}
		
	}
	
	
	
	
	
	
	
}
