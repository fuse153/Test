package com.start4321.web.controller;

import java.sql.SQLException; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.start4321.web.model.DateSearchList;
import com.start4321.web.model.ItemShop;
import com.start4321.web.service.ItemService;

@Controller
public class ItemShopController{

	@Autowired
	private ItemService Itemservice;
	
	
	
	private DateSearchList date = new DateSearchList();
	

	
	
	@RequestMapping("/delete.ItemShop")
	public String pur_historydelete(int[] delete_pur_num) throws SQLException{
	
		Itemservice.delete(delete_pur_num);
		return "redirect:pur_history.ItemShop";
		
	}
	
	@RequestMapping("/pur_history.ItemShop")
	public ModelAndView pur_historylist(String from , String to) throws SQLException{
		date.setFrom(from);
		date.setTo(to);
		ModelAndView mv = new ModelAndView("ItemShop/pur_history");
		mv.addObject("item", Itemservice.getList(date));
		return mv;
		
	}

	
	
	@RequestMapping(value = "/purchase.ItemShop", method=RequestMethod.GET)
	public String purchase(){
		return "ItemShop/purchase";
	}
	
	@RequestMapping(value = "/purchase.ItemShop", method=RequestMethod.POST)
	public String purchasecomplete(@ModelAttribute ItemShop itemshop) throws SQLException{
		String util_kind = itemshop.getUtil_kind();
		String history[] = util_kind.split(", ");
		itemshop.setUtil_kind(history[0]);
		itemshop.setSum(Integer.parseInt(history[1]));
		Itemservice.input(itemshop);
		return "redirect:pur_history.ItemShop";
		// view로 값을 보냄
	}
	
}


//ModelAndView mv = new ModelAndView("ItemShop/pur_history");
//mv.addObject("item", ItemService.input(itemshop));