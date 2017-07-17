package com.pro.myrp.service.stock;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.domain.Stock_conditionDTO;
import com.pro.myrp.persistence.stock.StockDAO;

@Service
public class StockServiceImpl implements StockService, CodeMyRP {

	@Inject
	private StockDAO dao;

	@Override
	public String stock_condition_service(HttpServletRequest req, Model model) throws Exception {
		
		long stock_amount = 0;
		long purchase_unit_price = 0;
		long sale_unit_price = 0;
		long stock_purchase_sum = 0;
		long sale_unit_price_sum = 0;
		
		ArrayList<Stock_conditionDTO> stock_conditionDtos = new ArrayList<Stock_conditionDTO>();
		
		stock_conditionDtos = dao.select_stock_condition();
		
		for(int i = 0; i < stock_conditionDtos.size(); i++) {
			stock_amount += stock_conditionDtos.get(i).getStock_amount();
			purchase_unit_price += stock_conditionDtos.get(i).getpurchase_unit_price();
			sale_unit_price += stock_conditionDtos.get(i).getSale_unit_price();
			stock_purchase_sum += (stock_conditionDtos.get(i).getStock_amount() * stock_conditionDtos.get(i).getpurchase_unit_price());
			sale_unit_price_sum += ((long)stock_conditionDtos.get(i).getStock_amount() * (long)stock_conditionDtos.get(i).getSale_unit_price());
			System.out.println("sale_unit_price_sum : " + sale_unit_price_sum);
			System.out.println("stock_conditionDtos.get(i).getStock_amount() : " + stock_conditionDtos.get(i).getStock_amount());
			System.out.println("stock_conditionDtos.get(i).getSale_unit_price() : " + stock_conditionDtos.get(i).getSale_unit_price());
			System.out.println("(long)stock_conditionDtos.get(i).getStock_amount() * stock_conditionDtos.get(i).getSale_unit_price() : " + ((long)stock_conditionDtos.get(i).getStock_amount() * (long)stock_conditionDtos.get(i).getSale_unit_price()));
			
		}
		
		model.addAttribute("stock_conditionDtos", stock_conditionDtos);
		model.addAttribute("stock_amount", stock_amount);
		model.addAttribute("purchase_unit_price", purchase_unit_price);
		model.addAttribute("sale_unit_price", sale_unit_price);
		model.addAttribute("stock_purchase_sum", stock_purchase_sum);
		model.addAttribute("sale_unit_price_sum", sale_unit_price_sum);
		
		return null;
	}

}
