package com.project.trylab.file;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAO {

	private SqlSession sqlSession;
	private static final String NAMESPACE = "FileMapper.";
	
	//write
	public int setWrite(List<FileVO> files) throws Exception {
		int result = sqlSession.insert(NAMESPACE+"setWrite", files);
		
		return result;
	}
	
	//delete
	
	
	//update
	
	//select
	
	//list
	
	
	
}
