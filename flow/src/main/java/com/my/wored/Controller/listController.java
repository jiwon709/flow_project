package com.my.wored.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.wored.DAO.listDAO;
import com.my.wored.VO.listVO;

@Controller
public class listController {
	
	
	private listDAO dao;
	
	@RequestMapping(value = "/list/boxPage", method = RequestMethod.GET)
	public String boxPage() {
		
		return "/list/boxPage";
	}
	
	@RequestMapping(value = "/list/checkboxList", method = RequestMethod.POST)
	@ResponseBody
	public String checkboxList(HttpSession session, 
			@RequestParam(value = "chbox[]", required = false) List<String> chbox, listVO vo) {
		
		String fix_name = String.valueOf(chbox);
		System.out.println(fix_name);
		vo.setFix_name(fix_name);
		
		dao.changeList(vo);
		
		return fix_name;
	}
	

}
