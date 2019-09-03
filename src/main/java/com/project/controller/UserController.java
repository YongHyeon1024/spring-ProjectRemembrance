package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dao.User;
import com.project.service.UserServiceimplement;

@Controller
public class UserController {
	
	@Autowired
	private UserServiceimplement us;
	
	@RequestMapping(value = "/user/userUpdate.do", method = RequestMethod.GET)
	public String userUpdate(Model model, HttpSession httpSession) {
		if(httpSession.getAttribute("login_check") != null) {
			User thing = us.selectUserAll((String)httpSession.getAttribute("login_check")); 
			System.out.println("thing : " + thing.toString());
			model.addAttribute("user", thing);
			return "/user/userUpdate";
		} else {
			return "redirect:main.do";
		}
	}
	
	// userupdate 이리로 온다.
	@RequestMapping(value = "/user/userUpdate.do", method = RequestMethod.POST)
	public String userUpdatenow(@ModelAttribute User user, HttpSession httpSession, Model model, HttpServletRequest request) {
		if(httpSession.getAttribute("login_check") != null) {
			System.out.println("세션 체크 " + httpSession.getAttribute("login_check"));
			System.out.println(user.toString());
			us.updateUserOne(user);
			model.addAttribute("msg", httpSession.getAttribute("login_check") + "님의 정보가 수정되었습니다.");
			model.addAttribute("href", request.getContextPath()+"/main.do");
			return "alert";
		} else {
			System.out.println("설마 여기 실행됨?");
			return "main";
		}
	}
	
	@RequestMapping(value = "/user/userDelete.do", method = RequestMethod.GET)
	public String userDelete(HttpSession httpSession, Model model, HttpServletRequest request) {
		if(httpSession.getAttribute("login_check") != null) {
			System.out.println("userdelete 세션 체크 : " + httpSession.getAttribute("login_check"));
			us.deleteUserOne((String)httpSession.getAttribute("login_check"));
			model.addAttribute("msg", "회원 정보가 삭제되었습니다.");
			model.addAttribute("href", request.getContextPath() + "/main.do");
			httpSession.invalidate();
			return "alert";
		} else {
			model.addAttribute("msg", "먼저 로그인해주십시오.");
			model.addAttribute("href", request.getContextPath() + "/main.do");
			return "alert";
		}
	}
	
//	// 회원 등록 페이지 관리 시 상호작용 목적
//	@RequestMapping(value = "/checkPw.do", method= RequestMethod.GET)
//	public @ResponseBody int check_pw(@ModelAttribute User user, HttpSession httpSession) {
//		System.out.println("restcontroller : " + user.toString());
//		User chkuser = us.selectUserOne(user);
//		System.out.println(chkuser.getUser_id());
//		int result = 0;
//		if(chkuser == null) {
//			result = 1;
//		}
//		return result;
//	}
}
