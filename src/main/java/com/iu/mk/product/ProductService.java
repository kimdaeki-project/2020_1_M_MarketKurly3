package com.iu.mk.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	public List<ProductVO> productList() throws Exception{
		return productDAO.productList();
	}
}
