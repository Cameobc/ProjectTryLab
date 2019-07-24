package com.project.trylab.qna;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.trylab.util.PageMaker;

@Repository
public class QnaDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "QnaMapper.";
	
	
	//write
	public int setWrite(QnaVO qnaVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", qnaVO);
	}
	
	//delete
	public int setDelete(int num) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", num);
	}
	
	//update
	public int setUpdate(QnaVO qnaVO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdate", qnaVO);
	}
	
	//select
	public QnaVO getSelect(int num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", num);
	}
	
	//list
	public List<QnaVO> getList(PageMaker pageMaker) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}
	
	//count
	public int getTotalCount(PageMaker pageMaker) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pageMaker);
	}
	
	//reply
	
	
	//replyUpdate
	
	
}
