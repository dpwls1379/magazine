package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Mypage;

public class MypageDao {
	private static MypageDao instance;

	private MypageDao() {

	}

	public static MypageDao getInstance() {
		if (instance == null) {
			instance = new MypageDao();
		}
		return instance;
	}

	private static SqlSession session;

	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMapper.openSession(true);
			reader.close();
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}

	public int getTotal() {
		int result = 0;
		result = (int) session.selectOne("mypagens.getTotal");
		return result;
	}

	public int max() {
		int result = 0;
		result = (int) session.selectOne("mypagens.max");
		return result;
	}

	public List<Mypage> mylist(String u_id,String m_id) {
		// TODO Auto-generated method stub
		List<Mypage> list = new ArrayList<>();
		HashMap<String, String> hashmap = new HashMap<>();
		hashmap.put("u_id", u_id);
		hashmap.put("m_id", m_id);

		list = session.selectList("mypagens.mylist", hashmap);

		return list;
	}

	public int userSave(Mypage mypage) {
		int result = 0;
		int number = max();
		mypage.setMy_num(number);
		result = session.insert("mypagens.userSave", mypage);
		return result;
	}
	public int mgrSave(Mypage mypage) {
		int result = 0;
		int number = max();
		mypage.setMy_num(number);
		result = session.insert("mypagens.mgrSave", mypage);
		return result;
	}

	public Mypage select(int my_num) {
		Mypage mypage = (Mypage) session.selectOne("mypagens.select", my_num);
		return mypage;
	}

	public int delete(int my_num) {
		// TODO Auto-generated method stub
		int result = 0;
		result = session.update("mypagens.delete", my_num);
		return result;
	}

}
