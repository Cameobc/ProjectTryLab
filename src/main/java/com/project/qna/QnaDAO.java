package com.project.qna;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.util.PageMaker;

@Repository
public class QnaDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "QnaMapper.";
	
	
	//hit
	public void updateHit(int num) throws Exception {
		sqlSession.update(NAMESPACE+"updateHit", num);
	}
	
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
	public int setReply(QnaVO qnaVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setReply", qnaVO);
	}
	
	//replyUpdate
	public int setReplyUpdate(QnaVO qnaVO) throws Exception {
		return sqlSession.update(NAMESPACE+"setReplyUpdate", qnaVO);
	}
	
	
}
