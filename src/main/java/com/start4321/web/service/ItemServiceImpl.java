package com.start4321.web.service;

import java.sql.SQLException; 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.start4321.web.model.DateSearchList;
import com.start4321.web.model.ItemShop;
import com.start4321.web.persistance.ItemDao;

@Component("Itemservice")
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemDao itemDao;

	@Override
	public List getList(DateSearchList date) throws SQLException {
		// TODO Auto-generated method stub
		return itemDao.getList(date);
	}

	@Override
	public void input(ItemShop itemshop) throws SQLException {
		itemDao.input(itemshop);
		
	}

	@Override
	public void delete(int[] delete_pur_num) throws SQLException {
		itemDao.delete(delete_pur_num);
	}
	
	
	

}
