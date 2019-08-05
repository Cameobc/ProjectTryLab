package com.project.notice;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.util.PageMaker;


@Repository
public class NoticeDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "NoticeMapper.";
	
	
	//write
	public int setWrite(NoticeVO noticeVO) throws Exception {
		int result = sqlSession.insert(NAMESPACE+"setWrite", noticeVO);
		return result;
	}
	
	//delete
	public int setDelete(int num) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", num);
	}
	
	//update
	public int setUpdate(NoticeVO noticeVO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdate", noticeVO);
	}
	
	//select
	public NoticeVO getSelect(int num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", num);
	}
	
	//list
	public List<NoticeVO> getList(PageMaker pageMaker) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}
	
	
	//totalCount
	public int getTotalCount(PageMaker pageMaker) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pageMaker);
	}
	
	
}
