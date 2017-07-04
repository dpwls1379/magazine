package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.swing.border.Border;

import org.apache.catalina.connector.Request;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.*;

public class BoardADao {
	private static BoardADao instance;

	private BoardADao() {

	}

	public static BoardADao getInstance() {
		if (instance == null) {
			instance = new BoardADao();
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
			System.out.println(e.getMessage());
		}
	}

	public int max() {
		int result = 0;
		result = (int) session.selectOne("boardns.max");
		return result;
	}

	public int insert(Board board) {
		int result = 0;
		int number=max();
		int b_re_level=board.getB_re_level()+1;
		int b_re_step=board.getB_re_step()+1;
		
		if(board.getB_num()!=0){//답변!
			reUpdate(board);
			board.setB_ref(board.getB_ref());
			board.setB_num(number);
			board.setB_re_level(b_re_level);//새로 입력된다면 1씩 증가
			board.setB_re_step(b_re_step);
		}else{
			board.setB_num(number);
			board.setB_ref(number);
			board.setB_re_level(0);
			board.setB_re_step(0);
		}
		result = session.insert("boardns.insert", board);
		return result;
	}
	
	public int reUpdate(Board board) {
		int result = 0;
		int b_ref= board.getB_ref();
		int b_re_step= board.getB_re_step();
		
		HashMap<String , Integer> hashMap=new HashMap<>();
		hashMap.put("b_ref", b_ref);
		hashMap.put("b_re_step", b_re_step);
		
		result=session.update("boardns.reUpdate",hashMap);
		
		return result;
	}

	// public List<Board> list(){
	public List<Board> list(int startRow, int endRow) {
		List<Board> list = new ArrayList<>();
		HashMap<String, Integer> hashMap = new HashMap<>();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		list = session.selectList("boardns.list", hashMap);

		return list;
	}
	
	public List<Board> mylist(String u_id){
		List<Board> list=new ArrayList<>();
		list=session.selectList("boardns.mylist",u_id);
		return list;
	}
	
	public List<Board> mgrList(){
		List<Board> list=new ArrayList<>();
		list=session.selectList("boardns.mgrlist");
		return list;
	}
	
	public List<Board> bIndex(){
		List<Board> list=new ArrayList<>();
		list=session.selectList("boardns.bindex");
		return list;
	}

	public void readcountUpdate(int b_num){
		session.update("boardns.readcountUpdate",b_num);
	}
	
	public Board select(int b_num) {
		Board board = new Board();
		board = (Board) session.selectOne("boardns.select", b_num);

		return board;
	}

	
	public int update(Board board){
		int result=0;
		result=session.update("boardns.update",board);
		return result;
	}
	
	public int delete(int b_num){
		int result=0;
		
		result=session.update("boardns.delete", b_num);
		
		return result;
	}

	public int getTotal() {
		int result = 0;
		result = (int) session.selectOne("boardns.getTotal");
		return result;
	}

	public int realDel(int b_num) {
		// TODO Auto-generated method stub
		int result=0;
		result=session.delete("boardns.realDel",b_num);
		return result;
	}

}
