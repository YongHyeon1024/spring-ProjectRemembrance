package com.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dao.Word;
import com.project.dao.WordServiceDAO;

@Controller
@RequestMapping("/word")
public class WordController {
	
	@Autowired
	private WordServiceDAO wDAO;
	
	@RequestMapping(value = "/wordstart.do", method = RequestMethod.GET)
	public String ajaxEx(Model model) {
		return "";
	}
	
	
	@RequestMapping(value="/wordcardCreate.do", method = RequestMethod.GET)
	public String wordcardCreate(@RequestParam("level") String value) {
		return "";
	}
	
	@RequestMapping(value = "/wordcardCreate.do", method = RequestMethod.POST)
	public String wordcardCreate(HttpServletRequest request, Model model, @RequestParam("q_name") String value, HttpSession session) {
		System.out.println("받아온 q_name : " + value);
		Map<String , String> sql = new HashMap<String, String>();
		String sqlvalue = "CREATE TABLE " + value +
							"(Q_NO NUMBER PRIMARY KEY, " + 
							"Q_ID VARCHAR2(20), " + 
							"Q_FRONT VARCHAR2(200), " + 
							"Q_BACK VARCHAR2(200), " + 
							"Q_HIT NUMBER)";
		sql.put("sql", sqlvalue);
		try {
			wDAO.createWordList(sql);
			model.addAttribute("msg", "성공했습니다.");
			model.addAttribute("href", request.getContextPath() + "/main.do?menu=11");
			session.setAttribute("cardsession", value);
		} catch (Exception e) {
			model.addAttribute("msg", "단어장 불러오기에 실패했습니다.");
			model.addAttribute("href", request.getContextPath() + "/main.do?menu=9");
		}
		return "alert";
	}
	
	
	
}
