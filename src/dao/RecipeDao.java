package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.*;

public class RecipeDao {
	private static RecipeDao instance;

	private RecipeDao() {

	}

	public static RecipeDao getInstance() {
		if (instance == null) {
			instance = new RecipeDao();
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
		result = (int) session.selectOne("recipens.max");
		return result;
	}

	
	
	public int insert(Recipe recipe) {
		int result = 0;
		int number=max();
		
		recipe.setR_num(number);
		
		if(recipe.getU_id()==null){
			recipe.setU_id("");
		}else{
			recipe.setM_id("");
		}
		if(recipe.getR_image()==null){
			recipe.setR_image("nothing.jpg");
		}else{
			recipe.setR_image(recipe.getR_image());
		}
		
		result = session.insert("recipens.insert", recipe);
		
		return result;
	}
	
	

	// public List<Board> list(){
	public List<Recipe> list(int startRow, int endRow, int r_kind) {
		List<Recipe> list = new ArrayList<>();
		HashMap<String, Integer> hashMap = new HashMap<>();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		hashMap.put("r_kind", r_kind);
		list = session.selectList("recipens.list", hashMap);

		return list;
	}
	public List<Recipe> mylist(String u_id,String m_id){
		List<Recipe> list=new ArrayList<>();
		HashMap<String, String> hashMap=new HashMap<>();
		hashMap.put("u_id", u_id);
		hashMap.put("m_id", m_id);
		list=session.selectList("recipens.mylist",hashMap);
		return list;
	}
	
	public List<Recipe> rIndex(){
		List<Recipe> list=new ArrayList<>();
		list=session.selectList("recipens.rindex");
		return list;
	}
	
	public List<Recipe> mgrList() {
		List<Recipe> list=new ArrayList<>();
		list=session.selectList("recipens.mgrlist");
		return list;
	}
	
	public List<Recipe> allList(){
		List<Recipe> list=new ArrayList<>();
		list=session.selectList("recipens.allList");
		return list;
	}

	public void readcountUpdate(int r_num){
		session.update("recipens.readcountUpdate",r_num);
	}
	
	public Recipe select(int r_num) {
		Recipe recipe = new Recipe();
		recipe = (Recipe) session.selectOne("recipens.select", r_num);

		return recipe;
	}

	
	public int update(Recipe recipe){
		int result=0;
		
		result=session.update("recipens.update",recipe);
		
		return result;
	}
	
	public int delete(int r_num){
		int result=0;
		
		result=session.update("recipens.delete", r_num);
		
		return result;
	}

	public int getTotal(int r_kind) {
		int result = 0;
		Recipe recipe=new Recipe();
		recipe.setR_kind(r_kind);
		result = (int) session.selectOne("recipens.getTotal",recipe);
		return result;
	}
	
	public void likeitUp(int r_num){
		session.update("recipens.likeitUpdate",r_num);
	}
	public void saveitUp(int r_num){
		session.update("recipens.saveitUpdate",r_num);
	}

	public int realDel(int r_num) {
		int result=0;
		result=session.delete("recipens.realDel",r_num);
		return result;
	}



}
