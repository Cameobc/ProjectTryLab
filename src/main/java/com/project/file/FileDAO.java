package com.project.file;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="FileMapper.";
	
	public int setWrite(List<FileVO> files) throws Exception{
		for(FileVO f:files) {
			System.out.println(f.getNum());
			System.out.println(f.getFname());
			System.out.println(f.getOname());
		}
		int res = sqlSession.insert(NAMESPACE+"setWrite",files);
		return res;
	}
	
	public int setUpdate(FileVO fileDTO) throws Exception{
		int res = sqlSession.update(NAMESPACE+"setUpdate", fileDTO);
		return res;
	}
	
	public int setDelete(int fnum) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", fnum);
	}
	
	public int setDeleteAll(int num) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDeleteAll", num);
	}
	
	public FileVO getSelect(int fnum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", fnum);
	}
	
	public List<FileVO> getList(int num) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", num);
	}
	
}
