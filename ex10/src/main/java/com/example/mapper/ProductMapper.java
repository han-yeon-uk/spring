package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;

public interface ProductMapper {
	public List<ProductVO> list(Criteria cri);
	public void insert(ProductVO vo);
	public int totalCount(Criteria cri);
	public void insertImage(String image);
	// 2020-11-19
	public ProductVO read(int pcode);
	public List<String> getImage(int pcode);
	public void update(ProductVO vo);
	public void deleteImage(int pcode);
	public void updateImage(@Param("pcode")int pcode,@Param("image")String iamge);
	public void delete(int pcode);
}
