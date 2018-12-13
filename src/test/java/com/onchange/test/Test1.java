package com.onchange.test;



import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.onchange.domain.Topic;
import com.onchange.service.TopicService;
import com.onchange.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml","classpath:mybatis-config.xml","classpath:log4j.xml"})
public class Test1 {
    
	@Resource
	private UserService userService;
	@Resource
	private TopicService topicService;
	@Test
	public void test() {
	  PageHelper.startPage(1, 10);
		List<Topic> list = topicService.listTopicsAndUsers();
	
				System.out.println(JSON.toJSONString(list, true));
		
		PageInfo<Topic> page = new PageInfo<Topic>(list);
		System.out.println("当前第:"+page.getStartRow()+"页");
		System.out.println("共:"+page.getPages()+"页");//当前第几页
		System.out.println("当前页条数:"+page.getSize());
		System.out.println("共"+page.getTotal()+"条");
	}

}
