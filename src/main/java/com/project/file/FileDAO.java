package com.project.file;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "FileMapper.";
	
	//write
	public int setWrite(List<FileVO> files) throws Exception {
		int result = sqlSession.insert(NAMESPACE+"setWrite", files);
		return result;
	}
	
	//deleteAll
	public int setDeleteAll(int num) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDeleteAll", num);
	}
	
	//delete
	public int setDelete(int fnum) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", fnum);
	}
	
	//update
	public int setUpdate(FileVO fileVO) throws Exception {
		int result = sqlSession.update(NAMESPACE+"setUpdate", fileVO);
		return result;
	}
	
	//select
	public FileVO getSelect(int fnum) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", fnum);
	}
	
	//list
	public List<FileVO> getList(int num) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", num);
	}
	
	
	
}
