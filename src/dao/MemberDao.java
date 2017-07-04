package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.sql.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.naming.*;

import model.*;

public class MemberDao {
	private static MemberDao instance; // =new MemberDao();

	private MemberDao() {

	}

	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}

	private static SqlSession session;
	static {// static: 초기화 블록
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMapper.openSession(true);
			reader.close();
		} catch (IOException e) {
			System.out.println("session read"+e.getMessage());
		}
	}
	/*
	 * private Connection getConnection(){ Connection conn=null; try { Context
	 * ctx=new InitialContext(); DataSource
	 * ds=(DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	 * conn=ds.getConnection(); } catch (Exception e) {
	 * System.out.println("연결에러: "+e.getMessage()); } return conn; }
	 */

	public int confirm(String u_id) {
		int result = 0;
		String dbId=(String) session.selectOne("memberns.confirm",u_id);
		if(dbId==null){
			result=1;
		}
		return result;
	}

	public int insert(Member member) {// DB에 입력
		int result = 0;
		result=session.insert("memberns.insert", member);
		return result;
	}

	public int check(String u_id, String u_passwd) {// DB에 입력
		int result = 0;
		/*
		 * HashMap<String, String> hs = new HashMap<>(); hs.put("id", id);
		 * 두개이상 집어넣을땐 hashmap을 써야함
		 */
		if(session.selectOne("memberns.check",u_id)!=null){
			Member member = (Member) session.selectOne("memberns.check", u_id);
			String dbPass = member.getU_passwd();
			if (u_passwd.equals(dbPass)) {
				result = 1;
			}else{
				result=0;
			}
		}else{
			result=-1;
		}
		
		return result;
	}

	public Member select(String u_id) {// DB에 입력
		
		Member mem = (Member) session.selectOne("memberns.select",u_id);
		
		return mem;
	}

	public int update(Member mem) {// DB에 입력
		int result = 0;
		result = session.update("memberns.update",mem);
		return result;
	}

	public int delete(String u_id) {
		int result = 0;
		result=session.update("memberns.delete",u_id);
		return result;
	}

	public List<Member> list(int startRow, int endRow) {//hashMap
		List<Member> list = new ArrayList<>();
		HashMap<String, Integer> hashMap=new HashMap<>();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		list=session.selectList("memberns.list",hashMap);
		
		return list;
	}

	public int getTotal() {
		int result = 0;
		result=(int) session.selectOne("memberns.getTotal");
		return result;
	}
}
