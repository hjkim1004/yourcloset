package com.yourcloset.product;

import java.util.List;

public interface ProductDAO {

	ProductVO selectProductByPid(int pid);
	List<ProductVO> selectProductsByCategory(String category);
	List<ProductVO> selectProductsAll();

	int insertProduct(ProductVO product);
	int deleteProduct(int pid);

}