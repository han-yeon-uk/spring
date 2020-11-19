package com.example.controller;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.BoardVO;
import com.example.mapper.BoardMapper;

@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardTest {
    @Autowired
    private BoardMapper mapper;
    
    //@Test
    //public void list() { mapper.list(); }
    
    @Test
    public void read() { mapper.read(5); }
    
    @Test
    public void insert() {
    	BoardVO vo1=new BoardVO();
    	vo1.setTitle("제목");
    	vo1.setContent("내용");
    	vo1.setWriter("저자");
    	mapper.insert(vo1);
    //	mapper.list();
    }
    
    @Test
    public void update() {
    	BoardVO vo1=new BoardVO();
    	vo1.setTitle("제목 수정");
    	vo1.setContent("내용 수정");
    	vo1.setWriter("저자 수정");
    	vo1.setBno(11);
    	mapper.update(vo1);
    	mapper.read(11);
    }
    
    @Test
    public void delete() { mapper.delete(11); }
    
    //@Test
    //public void totalCount() { mapper.totalCount(cri);}
}
