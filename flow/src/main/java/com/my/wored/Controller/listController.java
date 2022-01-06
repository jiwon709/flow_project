package com.my.wored.Controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.wored.DAO.listDAO;
import com.my.wored.VO.listVO;

@Controller
public class listController {
	
	@Autowired
	private listDAO dao;
	
	@RequestMapping(value = "/list/boxPage", method = RequestMethod.GET)
	public String boxPage() {
		
		return "/list/boxPage";
	}
	
	@RequestMapping(value = "/list/checkboxList", method = RequestMethod.POST)
	@ResponseBody
	public String checkboxList( 
			@RequestParam(value = "chbox[]", required = false) List<String> chbox, listVO vo) {
		
		//아무것도 선택되지 않았을 때 main화면으로 돌아간다.
		if(chbox == null) {
			return "main";
		}
		
		String fix_name = chbox.get(0).toString();
		
		System.out.println(fix_name);
				
		vo.setFix_name(fix_name);
		vo.setPut_name(fix_name);

		System.out.println("controller : " + vo.getFix_name() + vo.getPut_name());
		
		dao.insertList(vo);
		
		
		return fix_name;
	}
	
	@RequestMapping(value = "/list/customList", method = RequestMethod.POST)
	@ResponseBody
	public String customList( 
			@RequestParam(value = "customName", required = false) String customName, listVO vo) {
		
		//아무것도 입력되지 않았을 때 main화면으로 돌아간다.
		if(customName == null) {
			return "main";
		}
		
		System.out.println(customName);
		
		vo.setPut_name(customName);

		System.out.println("controller customName : " + vo.getPut_name());
		
		dao.insertCustom(vo);
		
		
		return customName;
	}
	

}