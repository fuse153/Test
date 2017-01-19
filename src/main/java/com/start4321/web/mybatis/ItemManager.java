package com.start4321.web.mybatis;

import java.io.Reader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.start4321.web.model.DateSearchList;
import com.start4321.web.model.ItemShop;

public class ItemManager {
	private static SqlSessionFactory sqlSessionFactory;
	
	static{
		try{
			Reader reader = 
					Resources.getResourceAsReader("com/start4321/web/mybatis/mybatis_config.xml");
			sqlSessionFactory =
					new SqlSessionFactoryBuilder().build(reader);
		}
		catch(Exception err){
			throw new RuntimeException("SqlSessionFactory 인스턴스 생성 실패 : " + err);
		}
	}

	public static List getList(DateSearchList date){
		
		List list = null;
		SqlSession session = sqlSessionFactory.openSession();

		if(date.getFrom() == null || date.getTo() == null)
		{
			list = session.selectList("getList");
		}
		else
		{
			list = session.selectList("getSearchList", date);
		}
		return list;
	}
	
	public static void input(ItemShop itemshop){
		
		// 연결 정보
		SqlSession session = sqlSessionFactory.openSession();
		
		session.insert("input", itemshop);
		session.commit();
		
	}

	public static void delete(int[] delete_pur_num){
		List<Integer> list = new ArrayList<Integer>();
		for(int i=0; i<delete_pur_num.length; i++) {
			list.add(delete_pur_num[i]);
		}
		
		
	//	for (int d:list) {
	//		System.out.println(d);
	//	}
		
		// 연결 정보
		SqlSession session = sqlSessionFactory.openSession();
		
		session.delete("delete", list);
		session.commit();
		
	}


}
