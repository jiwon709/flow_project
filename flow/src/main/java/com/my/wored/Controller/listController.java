package com.my.wored.Controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
			
//			
//			String nameArray[] = new String[7];
//			for(int i = 0; i <= nameArray.length; i++) {
//				nameArray[i] = fix_name;
//				
//				if
//			}
			
			vo.setFix_name(fix_name);
			vo.setPut_name(fix_name);

			System.out.println("controller : " + vo.getFix_name() + vo.getPut_name());
			
			dao.insertList(vo);
			
			
			return fix_name;
	}
	
	@RequestMapping(value = "/list/checkboxListDelete", method = RequestMethod.POST)
	@ResponseBody
	public String checkboxListDelete( 
			@RequestParam(value = "deleteName", required = false) String deleteName, listVO vo) {
		
		//아무것도 선택되지 않았을 때 main화면으로 돌아간다.
		if(deleteName == null) {
			return "main";
		}
//			String fix_name = chbox.get(0).toString();
			
			System.out.println(deleteName);
			
//			
//			String nameArray[] = new String[7];
//			for(int i = 0; i <= nameArray.length; i++) {
//				nameArray[i] = fix_name;
//				
//				if
//			}
			
			vo.setFix_name(deleteName);
			vo.setPut_name(deleteName);

			System.out.println("controller : " + vo.getFix_name() + vo.getPut_name());
			
			dao.deleteList(vo);
			
			
			return deleteName;
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
	
	@RequestMapping(value = "/list/customDelete", method = RequestMethod.POST)
	@ResponseBody
	public String customDelete( 
			@RequestParam(value = "customName", required = false) String customName, listVO vo) {
		
		//아무것도 입력되지 않았을 때 main화면으로 돌아간다.
		if(customName == null) {
			return "main";
		}
		
		System.out.println(customName);
		
		vo.setPut_name(customName);

		System.out.println("controller customName out : " + vo.getPut_name());
		
		dao.deleteCustom(vo);
		
		
		return customName;
	}
	

}
