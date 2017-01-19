package com.start4321.web.persistance;

import java.sql.SQLException;
import java.util.List;

import com.start4321.web.model.DateSearchList;
import com.start4321.web.model.ItemShop;

public interface ItemDao {
	public List getList(DateSearchList date) throws SQLException;
	public void input(ItemShop itemshop) throws SQLException; 
	public void delete(int[] delete_pur_num) throws SQLException;
}
