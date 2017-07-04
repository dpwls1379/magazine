package dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Manager;

public class ManagerDao {
	private static ManagerDao instance;
	
	public static ManagerDao getInstance(){
		if(instance==null){
			instance=new ManagerDao();
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

	public int check(String m_id, String m_passwd) {
		// TODO Auto-generated method stub
		String dbpass="";
		int result=0;
		Manager manager=new Manager();
		if(session.selectOne("managerns.check", m_id)==null){
			result=-1;
		}else{
			manager=(Manager)session.selectOne("managerns.check", m_id);
			dbpass=manager.getM_passwd();
			if(dbpass.equals(m_passwd)){
				result=1;
			}else{
				result=0;
			}
		}
		
		return result;
	}
	
}
