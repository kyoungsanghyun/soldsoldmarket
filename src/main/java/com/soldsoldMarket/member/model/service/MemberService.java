package com.soldsoldMarket.member.model.service;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.close;
import static com.soldsoldMarket.common.jdbc.JDBCTemplate.commit;
import static com.soldsoldMarket.common.jdbc.JDBCTemplate.getConnection;
import static com.soldsoldMarket.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.member.model.dao.MemberDao;
import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.member.model.vo.Report;

public class MemberService {
	
	public Member login(String id, String pwd) {
		
		Member member = this.findMemberById(id);
		
		if(member == null || !member.getPwd().equals(pwd)) {
			return null;
		}else {
			return member;
		}
	}

	public Member findMemberById(String id) {
		
		Connection connection = getConnection();
		Member member = new MemberDao().findMemberById(connection,id);
		
		close(connection);
		
		return member;
		
	}

	public int save(Member member) {
		int result = 0;
		
		Connection connection = getConnection();
		
		if(member.getJoinDate() == null) {
		
		result = new MemberDao().insert(connection,member);
		if(result > 0 ) {
			commit(connection);
		}else {
			rollback(connection);
		}
		
		}else {
			
		}
		
		
		return result;
	}
	
	public int save2(Member member) {
		int result = 0;
		
		Connection connection = getConnection();
		
		if(member.getId() != null) {
			result = new MemberDao().updateMember(connection,member);
		} else {
			result = new MemberDao().insertMember(connection, member);
		}
			if(result > 0 ) {
				commit(connection);
			}else {
				rollback(connection);
			}
		
		return result;
	}

	public Boolean isduplicateId(String userId) {
		Member member = this.findMemberById(userId);
		
		return member != null;
	}

	public Member loginByE(String email) {

		Member member = this.findMemberById(email);
		
		
		return member;
	}
	
	public int getMemberCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new MemberDao().getMemberCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<Member> getMemberList(PageInfo pageInfo) {
		List<Member> list = null;
		Connection connection = getConnection();
		
		list = new MemberDao().findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}

	public int save3(Member memberUpdate) {
		int result = 0;
		
		Connection connection = getConnection();
		
		if(memberUpdate.getId() != null) {
			result = new MemberDao().updateMember(connection, memberUpdate);
		}
			if(result > 0 ) {
				commit(connection);
			}else {
				rollback(connection);
			}
			
		close(connection);
		
		return result;
		
	}
	
	
	// 신고하기 체크 로직 (서블렛용)
	public Report reportingcheck(String loginid, String sname) {
		Connection connetion = getConnection();
		
		Report report = new MemberDao().reportingcheck(connetion, loginid, sname);
		
		close(connetion);
		
		return report;
	}
	// 신고했는지 확인
	public Report findReportByNoAndId(String loginid, String sname) {
		Report report = null;
		int result = 0;
		int update = 0;
		
		Connection connetion = getConnection();
		
		report = new MemberDao().reportingcheck(connetion, loginid, sname);
		
		if(report != null) {
			update = new MemberService().reportminusCount(loginid, sname);
			result = new MemberService().cancelReport(loginid, sname);
		} else {
			result = new MemberService().wantReport(loginid, sname);
			update = new MemberService().reportplusCount(loginid, sname);
		}
		
		close(connetion);

		return report;
	}
	
	// 멤버 테이블에 신고당한횟수 증가
	private int reportplusCount(String loginid, String sname) {
		Connection connection = getConnection();
		
		int result = new MemberDao().plusReport(connection, loginid, sname);

		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		close(connection);

		return result;
	}
	// 멤버 테이블에 신고당한횟수 감소
	private int reportminusCount(String loginid, String sname) {
		Connection connection = getConnection();
		
		int result = new MemberDao().minusReport(connection, loginid, sname);

		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		close(connection);

		return result;
	}

	// 신고 취소
	private int cancelReport(String loginid, String sname) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new MemberDao().deleteReport(connection, loginid, sname);
			
		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	// 신고 넣기
	private int wantReport(String loginid, String sname) {
		
		int result = 0;
		Connection connection = getConnection();
		
		result = new MemberDao().insertReport(connection, loginid, sname);
			
		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

}

