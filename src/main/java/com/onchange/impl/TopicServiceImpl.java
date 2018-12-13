package com.onchange.impl;

import com.github.pagehelper.PageInfo;
import com.onchange.dao.TopicMapper;
import com.onchange.domain.Topic;
import com.onchange.service.TopicService;

import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;

@Service
public class TopicServiceImpl implements TopicService {

	@Resource 
    public TopicMapper topicDao;

    //获取全部主题
    public List<Topic> getAllTopics() {
        return topicDao.getAllTopics();
    }

    //获取指定id主题
    public Topic selectById(Integer id) {
        Topic topic=topicDao.selectById(id);
        return topic;
    }

    public List<Topic> listMostCommentsTopics() {
        return topicDao.listMostCommentsTopics();
    }

    public boolean addTopic(Topic topic) {
        return topicDao.insert(topic)>0;
    }

    public boolean clickAddOne(Integer id) {
        return topicDao.clickAddOne(id)>0;
    }

    public int getTopicsNum() {
        return topicDao.getTopicsNum();
    }

    public List<Topic> listTopicsAndUsers() {
    	try {
    	    return topicDao.listTopicsAndUsers();
    	}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
    
    }

    public List<Topic> listTopicsAndUsersOfTab(Integer tabId) {
        return topicDao.listTopicsAndUsersOfTab(tabId);
    }

	public PageInfo<Topic> listTopicsAndUser() {
		// TODO Auto-generated method stub
		return null;
	}
    
    
}
