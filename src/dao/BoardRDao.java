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

public class BoardRDao {
	private static BoardRDao instance;

	private BoardRDao() {

	}

	public static BoardRDao getInstance() {
		if (instance == null) {
			instance = new BoardRDao();
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
		result = (int) session.selectOne("boardRns.max");
		return result;
	}

	public int insert(BoardR boardR) {
		int result = 0;
		int number=max();
		int br_re_level=boardR.getBr_re_level()+1;
		int br_re_step=boardR.getBr_re_step()+1;
		
		if(boardR.getBr_num()!=0){//답변!
			reUpdate(boardR);
			boardR.setBr_ref(boardR.getBr_ref());
			boardR.setBr_num(number);
			boardR.setBr_re_level(br_re_level);//새로 입력된다면 1씩 증가
			boardR.setBr_re_step(br_re_step);
		}else{
			boardR.setBr_num(number);
			boardR.setBr_ref(number);
			boardR.setBr_re_level(0);
			boardR.setBr_re_step(0);
		}
		result = session.insert("boardRns.insert", boardR);
		return result;
	}
	
	public int reUpdate(BoardR boardR) {
		int result = 0;
		int br_ref= boardR.getBr_ref();
		int br_re_step= boardR.getBr_re_step();
		
		HashMap<String , Integer> hashMap=new HashMap<>();
		hashMap.put("br_ref", br_ref);
		hashMap.put("br_re_step", br_re_step);
		
		result=session.update("boardRns.reUpdate",hashMap);
		
		return result;
	}

	// public List<Board> list(){
	public List<BoardR> list(int r_num) {
		List<BoardR> list = new ArrayList<>();
		list = session.selectList("boardRns.list", r_num);

		return list;
	}
	
	public BoardR select(int br_num) {
		BoardR boardR = new BoardR();
		boardR = (BoardR) session.selectOne("boardRns.select", br_num);

		return boardR;
	}

	
	public int update(BoardR boardR){
		int result=0;
		result=session.update("boardRns.update",boardR);
		return result;
	}
	
	public int delete(int br_num){
		int result=0;
		
		result=session.update("boardRns.delete", br_num);
		
		return result;
	}

	public int getTotal() {
		int result = 0;
		result = (int) session.selectOne("boardRns.getTotal");
		return result;
	}

	public int realDel(int r_num) {
		// TODO Auto-generated method stub
		int result=0;
		List<BoardR> list=list(r_num);
		if(list.size()!=0){
			System.out.println(list);
			result=session.delete("boardRns.realDel",r_num);
		}else{
			result=1;
		}
		return result;
	}

}
