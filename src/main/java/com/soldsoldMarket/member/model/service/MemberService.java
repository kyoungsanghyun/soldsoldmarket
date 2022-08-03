package com.soldsoldMarket.member.model.service;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;
import java.sql.Connection;
import java.util.List;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.member.model.dao.MemberDao;
import com.soldsoldMarket.member.model.vo.Member;

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

}
