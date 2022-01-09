package com.my.wored.DAO;

import java.util.ArrayList;
import java.util.List;

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
			mapper.insert(vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteList(listVO vo) {
		try {
			listMapper mapper = sqlsession.getMapper(listMapper.class);
			mapper.delete(vo);
		} catch(Exception e) {
			e.printStackTrace();
		}	
	}

	public void insertCustom(listVO vo) {
		try {
			listMapper mapper = sqlsession.getMapper(listMapper.class);
			mapper.insertCustom(vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteCustom(listVO vo) {
		try {
			listMapper mapper = sqlsession.getMapper(listMapper.class);
			mapper.deleteCustom(vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<listVO> read() {
		List<listVO> list = new ArrayList<listVO>();
		try {
			listMapper mapper = sqlsession.getMapper(listMapper.class);
			list = mapper.read();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
