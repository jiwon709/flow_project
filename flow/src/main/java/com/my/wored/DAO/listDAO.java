package com.my.wored.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.wored.VO.listVO;

@Repository
public class listDAO {
	
	@Autowired
	private SqlSession sqlsession;

	public void changeList(listVO vo) {
		try {
			listMapper mapper = sqlsession.getMapper(listMapper.class);
			mapper.change(vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
