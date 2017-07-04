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

import model.Magazine;

public class MagazineDao {
	private static MagazineDao instance;

	private MagazineDao() {
	}

	public static MagazineDao getInstance() {
		if (instance == null) {
			instance = new MagazineDao();
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

	public int getTotal(int ma_kind) {
		int result = 0;
		Magazine magazine=new Magazine();
		magazine.setMa_kind(ma_kind);
		result = (int) session.selectOne("magazinens.getTotal",magazine);
		return result;
	}

	public List<Magazine> list(int startRow, int endRow, int ma_kind) {
		// TODO Auto-generated method stub
		List<Magazine> list = new ArrayList<>();
		HashMap<String, Integer> hashmap = new HashMap<>();
		hashmap.put("startRow", startRow);
		hashmap.put("endRow", endRow);
		hashmap.put("ma_kind", ma_kind);
		list = session.selectList("magazinens.list", hashmap);

		return list;
	}
	
	public List<Magazine> mylist(){
		List<Magazine> list=new ArrayList<>();
		list=session.selectList("magazinens.mylist");
		return list;
	}
	
	public List<Magazine> mgrList() {
		// TODO Auto-generated method stub
		List<Magazine> list=new ArrayList<>();
		list=session.selectList("magazinens.mgrlist");
		return list;
	}
	
	public List<Magazine> mIndex(){
		List<Magazine> list=new ArrayList<>();
		list=session.selectList("magazinens.mindex");
		return list;
	}

	public int max() {
		int result = 0;
		result = (int) session.selectOne("magazinens.max");
		return result;
	}

	public int insert(Magazine magazine) {
		int result = 0;
		int number = max();
		magazine.setMa_num(number);
		if (magazine.getMa_image() == null) {
			magazine.setMa_image("nothing.jpg");
		}
		result = session.insert("magazinens.insert", magazine);
		return result;
	}

	public void readcountUpdate(int ma_num) {

		session.update("magazinens.readcountUpdate", ma_num);

	}

	public Magazine select(int ma_num) {
		Magazine magazine = new Magazine();
		magazine = (Magazine) session.selectOne("magazinens.select", ma_num);
		return magazine;
	}

	public int update(Magazine magazine) {
		// TODO Auto-generated method stub
		int result = 0;
		if (magazine.getMa_image() == null) {
			magazine.setMa_image("nothing.jpg");
		}
		result = session.update("magazinens.update", magazine);

		return result;
	}

	public int delete(int ma_num) {
		// TODO Auto-generated method stub
		int result = 0;
		result = session.update("magazinens.delete", ma_num);
		return result;
	}

	public int realDel(int ma_num) {
		// TODO Auto-generated method stub
		int result=0;
		result=session.delete("magazinens.realDel",ma_num);
		return result;
	}

}
