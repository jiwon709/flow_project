package com.my.wored.DAO;

import java.util.List;

import com.my.wored.VO.listVO;

public interface listMapper {

	public void insert(listVO vo);
	
	public void delete(listVO vo);

	public void insertCustom(listVO vo);

	public void deleteCustom(listVO vo);

	public List<listVO> read();

}
