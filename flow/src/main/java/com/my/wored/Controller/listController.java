package com.my.wored.Controller;

import java.util.ArrayList;
import java.util.List;

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
	
	
	@RequestMapping(value = "/list/checkboxList", method = RequestMethod.POST)
	@ResponseBody
	public String checkboxListInsert( 
			@RequestParam(value = "chbox[]", required = false) List<String> chbox, listVO vo){
		
		//아무것도 선택되지 않았을 때 임의로 main 단어 리턴. -> uncheck시 에러 발생 방지
		if(chbox == null) {
			return "main";
		}
			String fix_name = chbox.get(0).toString();	
			vo.setFix_name(fix_name);
			
			dao.insertList(vo);
			
			return fix_name;
	}
	
	
	@RequestMapping(value = "/list/checkboxListDelete", method = RequestMethod.POST)
	@ResponseBody
	public String checkboxListDelete( 
			@RequestParam(value = "deleteName", required = false) String deleteName, listVO vo){
		
		//아무것도 선택되지 않았을 때 임의로 main 단어 리턴. -> uncheck시 에러 발생 방지
		if(deleteName == null) {
			return "main";
		}	
			vo.setFix_name(deleteName);
			dao.deleteList(vo);
			
			return deleteName;
	}
	
	
	@RequestMapping(value = "/list/customList", method = RequestMethod.POST)
	@ResponseBody
	public String customList( 
			@RequestParam(value = "customName", required = false) String customName, listVO vo) {
		
		//아무것도 입력 되지 않았을 때 임의로 main 단어 리턴. -> 에러 발생 방지
		if(customName == null) {
			return "main";
		}
		
			vo.setPut_name(customName);
			dao.insertCustom(vo);
		
		return customName;
	}
	
	
	@RequestMapping(value = "/list/customDelete", method = RequestMethod.POST)
	@ResponseBody
	public String customDelete( 
			@RequestParam(value = "customName", required = false) String customName, listVO vo) {
		
		//아무것도 입력 되지 않았을 때 임의로 main 단어 리턴. -> 에러 발생 방지
		if(customName == null) {
			return "main";
		}
		
		
		vo.setPut_name(customName);

		//check용
		System.out.println("controller customName out : " + vo.getPut_name());
		
		dao.deleteCustom(vo);
		
		
		return customName;
	}
	
	
	//미완성
	@RequestMapping(value = "/list/readList", method = RequestMethod.POST)
	@ResponseBody
	public List<listVO> readList() {
		List<listVO> list = new ArrayList<listVO>();
		
		list = dao.read();
		
		return list;
	}
	

}
