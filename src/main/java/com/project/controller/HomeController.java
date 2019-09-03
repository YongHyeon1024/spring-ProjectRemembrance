package com.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dao.QnABoardDAO;
import com.project.dao.User;
import com.project.dao.Word;
import com.project.dao.WordServiceDAO;
import com.project.service.UserServiceimplement;

@Controller
public class HomeController {

	@Autowired
	private UserServiceimplement us;

	@Autowired
	private QnABoardDAO qDAO;
	
	@Autowired
	private WordServiceDAO wDAO;

	// 메인 화면 처리
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Model model, HttpSession httpSession, HttpServletRequest request,
			@RequestParam(value = "menu", required = false, defaultValue = "0") int menu,
			@RequestParam(value = "no", required = false, defaultValue = "0") int no,
			@RequestParam(value = "level", required = false, defaultValue = "") String level) {
		
		if (menu == 0) {
			List<User> list = us.selectUserList();
			//System.out.println(list.toString());
			model.addAttribute("userlist", list);
			
		} else if (menu == 1) { // word card
			System.out.println(level);
			Word temp = new Word();
			if(level != null) {
				httpSession.setAttribute("card_name", level);
				temp.setLevel(level);
				model.addAttribute("list", wDAO.selectWordList(level));
				//System.out.println(wDAO.selectWordList(level).toString());
			} else if(level == null) {
				
			}
		} else if (menu == 2) {
			if(httpSession.getAttribute("login_check") != null) {
				User thing = us.selectUserAll((String)httpSession.getAttribute("login_check")); 
				//System.out.println("thing : " + thing.toString());
				model.addAttribute("user", thing);
			} else {
				
			}
		} else if (menu == 3) {
			httpSession.setAttribute("BRD_HIT_CHECK", 1);
			List<Map<String, Object>> list = qDAO.selectBoardList();
			model.addAttribute("list", list);

			if(no != 0) {
				int chk = (Integer) httpSession.getAttribute("BRD_HIT_CHECK");
				if (chk == 1) {
					qDAO.updateBoardHit(no);
					httpSession.setAttribute("BRD_HIT_CHECK", 0);
				}
				
				Map<String, Object> map = qDAO.selectBoardOne(no);
				System.out.println(map.toString());
				model.addAttribute("board", map);
				
				int prev = qDAO.selectBoardPrev(no);
				int next = qDAO.selectBoardNext(no);
				//System.out.println("이전 : " + prev + "다음 : " + next);
				model.addAttribute("prev", prev);
				model.addAttribute("next", next);
			}
			
		} else if(menu == 11) {
			if(httpSession.getAttribute("cardsession") != null) {
				System.out.println("받아온 세션 값 : " + httpSession.getAttribute("cardsession"));
				List<Word> qlist = wDAO.selectWordList((String)httpSession.getAttribute("cardsession"));
				model.addAttribute("list", qlist);
			}
			httpSession.removeAttribute("cardsession");
		} else if(menu == 9) {
			if(httpSession.getAttribute("login_check") == null) {
				model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
				model.addAttribute("href", request.getContextPath() + "/main.do");
				return "alert";
			}
		}
		
		return "main";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:/main.do";
	}

	// 로그인 처리
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(HttpSession httpSession, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		if (httpSession.getAttribute("login_check") != null) {
			return "redirect:" + request.getContextPath() + "/main.do";
		}
		return "login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginPost(Model model, @ModelAttribute() User user, HttpSession httpSession,
			HttpServletRequest request) {
		try {
			// System.out.println("id : " + user.getUser_id() + " pw : " + user.getUser_pw());
			User tempuser = us.selectUserLogin(user);
			if (user.getUser_pw().equals(tempuser.getUser_pw())) {
				httpSession.setAttribute("login_check", user.getUser_id());
				// System.out.println("세션 받아온 것 : " + httpSession.getAttribute("login_check"));
				model.addAttribute("msg", (String) httpSession.getAttribute("login_check") + "님 로그인되었습니다.");
				model.addAttribute("href", request.getContextPath() + "/main.do");
				return "alert";
			} else {
				model.addAttribute("msg", "로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.");
				model.addAttribute("href", request.getContextPath() + "/main.do?menu=5");
				return "alert";
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("msg", "로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.");
			model.addAttribute("href", request.getContextPath() + "/main.do?menu=5");
			return "alert";
		}
	}

	// 회원 등록 페이지 관리
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String register_user(HttpSession httpSession) {
		return "register";
	}

	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String register(@ModelAttribute User user, Model model, HttpServletRequest request) {
		// System.out.println(user.toString());
		us.insertUserOne(user);
		model.addAttribute("msg", "회원 등록에 성공했습니다. 새로운 아이디로 로그인해주세요.");
		model.addAttribute("href", request.getContextPath() + "/main.do?menu=5");
		return "alert";
	}

	// 회원 등록 페이지 관리 시 상호작용 목적
	@RequestMapping(value = "/checkId.do", method = RequestMethod.GET)
	public @ResponseBody int check_user(@ModelAttribute User user, HttpSession httpSession) {
		// System.out.println("restcontroller : " + user.toString());
		User chkuser = us.selectUserOne(user);
		int result = 0;
		if (chkuser != null) {
			// 일치하는 아이디 없을 경우 ( 회원등록 가능)
			result = 1;
		}
		return result;
	}
	
	// 회원 등록 페이지 관리 시 상호작용 목적
	@RequestMapping(value = "/checkPw.do", method = RequestMethod.POST)
	public @ResponseBody int check_pw(@RequestParam("user_pw_before") String pw, HttpSession httpSession) {
		int result = 0;
		try {
			String userpw = us.selectUserPw(pw).getUser_pw();
			System.out.println("비번값 : " + userpw);
			if(userpw != "") {
				result = 1;
				return result;
			} else {
				return 0;
			}
		} catch (Exception e) {
			return 0;
		}
	}

	// 로그아웃 처리
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession httpSession, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		httpSession.invalidate();
		model.addAttribute("msg", "로그아웃 되었습니다.");
		model.addAttribute("href", request.getContextPath() + "/main.do");
		// 절대경로는 request.getContextPath(); 사용할것
		return "alert";
	}
	
	@RequestMapping(value = "/credit.do", method = RequestMethod.GET)
	public String credit() {
		return "Credit";
	}

}
