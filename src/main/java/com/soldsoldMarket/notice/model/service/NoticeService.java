package com.soldsoldMarket.notice.model.service;



import java.sql.Connection;
import java.util.List;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;
import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.notice.model.dao.NoticeDao;
import com.soldsoldMarket.notice.model.vo.Notice;


public class NoticeService {
	

	public int getNoticeCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new NoticeDao().getNoticeCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<Notice> getNoticeList(PageInfo pageInfo) {
		List<Notice> list = null;
		Connection connection = getConnection();
		
		list = new NoticeDao().getNoticeList(connection,pageInfo);
		
		close(connection);
		
		
		
		return list;
	}

	public Notice getNoticeByNo(int no, boolean hasRead) {
		Notice notice = null;
		
		Connection connection = getConnection();
		
		notice = new NoticeDao().findNoticeByNo(connection,no);
		
		//게시글 조회수 증가 로직
		if(notice != null && !hasRead) {
			int result = new NoticeDao().updateReadCount(connection,notice);
			
			if(result > 0) {
				commit(connection);
			}else {
				rollback(connection);
			}
		}
		
		
		close(connection);
		
		return notice;
	
	}

	public int save(Notice notice) {
		int result = 0;
		
		Connection connection = getConnection();
		if(notice.getNo() != 0) {
			
			result = new NoticeDao().updateNotice(connection,notice);
		}else {
			
			result = new NoticeDao().insertNotice(connection,notice);
		}
		
		if(result > 0) {
			commit(connection);
			
			
		}else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public int delete(int no) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new NoticeDao().updateStatus(connection,no,"N");
		
		if(result > 0) {
			commit(connection);
		}else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	
	}

	
	

}
