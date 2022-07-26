package com.soldsoldMarket.member.model.service;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;
import java.sql.Connection;

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

}
