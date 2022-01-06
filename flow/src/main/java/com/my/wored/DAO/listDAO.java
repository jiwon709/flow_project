package com.my.wored.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.wored.VO.listVO;

@Repository
public class listDAO {
	
	@Autowired
	private SqlSession sqlsession;

	public void insertList(listVO vo) {
		try {
			listMapper mapper = sqlsession.getMapper(listMapper.class);
			System.out.println("listDAO : " + vo.getFix_name() + vo.getPut_name());
			mapper.insert(vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteList(listVO vo) {
		try {
			listMapper mapper = sqlsession.getMapper(listMapper.class);
			System.out.println("listDAO : " + vo.getFix_name() + vo.getPut_name());
			mapper.delete(vo);
		} catch(Exception e) {
			e.printStackTrace();
		}	
	}

	public void insertCustom(listVO vo) {
		try {
			listMapper mapper = sqlsession.getMapper(listMapper.class);
			System.out.println("listDAO : " + vo.getFix_name() + vo.getPut_name());
			mapper.insertCustom(vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
