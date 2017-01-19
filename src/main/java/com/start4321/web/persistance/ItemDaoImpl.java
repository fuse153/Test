package com.start4321.web.persistance;

import java.sql.SQLException; 
import java.util.List;

import org.springframework.stereotype.Component;

import com.start4321.web.model.DateSearchList;
import com.start4321.web.model.ItemShop;
import com.start4321.web.mybatis.ItemManager;

@Component("itemDao")
public class ItemDaoImpl implements ItemDao{

	@Override
	public List getList(DateSearchList date) throws SQLException {
		return ItemManager.getList(date);
	}
	@Override
	public void input(ItemShop itemshop) throws SQLException {
		ItemManager.input(itemshop);
	}
	@Override
	public void delete(int[] delete_pur_num) throws SQLException {
		ItemManager.delete(delete_pur_num);
	}

}
