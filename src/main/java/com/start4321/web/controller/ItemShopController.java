/*   작성자 : 김재환
	  작성일자 : 2017-2-3
	  페이지 역할 : purhistory.jsp에게 처리해서 값을 보내는 컨트롤러 입니다. */

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
	

	
	//삭제 맵핑
	@RequestMapping("/delete.ItemShop")
	public String pur_historydelete(int[] delete_pur_num) throws SQLException{
	
		Itemservice.delete(delete_pur_num);
		return "redirect:pur_history.ItemShop";
		
	}
	
	// 구매내역이 들어왔을 때
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
	
	// 구매하는 페이지(purchase.jsp)의 값을 쪼개어서 서비스에게 전달하는 페이지
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