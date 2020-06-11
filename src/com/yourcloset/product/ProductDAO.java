package com.yourcloset.product;

import java.util.List;

public interface ProductDAO {

	ProductVO selectProductByProductId(int product_id);
	List<ProductVO> selectProductsByCategory(String category);
	List<ProductVO> selectProductsAll();

	int insertProduct(ProductVO product);
	int deleteProduct(int product_id);

}