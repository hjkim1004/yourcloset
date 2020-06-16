package com.yourcloset.product.dao;

import java.util.List;

import com.yourcloset.product.vo.ProductVO;

public interface ProductDAO {

	ProductVO selectProductByProductId(int product_id);
	List<ProductVO> selectProductsByCategory(String category);
	List<ProductVO> selectProductsAll();

	int insertProduct(ProductVO product);
	int deleteProduct(int product_id);

}