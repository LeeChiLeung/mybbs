package com.onchange.controller;

import com.github.pagehelper.PageHelper;
import com.onchange.domain.Reply;
import com.onchange.domain.Tab;
import com.onchange.domain.Topic;
import com.onchange.domain.User;
import com.onchange.impl.ReplyServiceImpl;
import com.onchange.impl.TabServiceImpl;
import com.onchange.impl.TopicServiceImpl;
import com.onchange.impl.UserServiceImpl;
import com.onchange.intercepter.ContextInterceptor;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;




/**
 * 主题相关控制类
 */
@Controller
public class TopicController {

	@Resource 
    public TopicServiceImpl topicService;
	@Resource 
    public ReplyServiceImpl replyService;
	@Resource 
    public UserServiceImpl userService;
	@Resource 
    public TabServiceImpl tabService;

    //log4j对象
     private final Log log = LogFactory.getLog(getClass());





    /**
     * 渲染首页
     * @param session
     * @return
     */
    @RequestMapping("/index")
    public String toMain(HttpSession session, Model model){
       
        //logger.info("访问成功2244");

        //全部主题
    	 PageHelper.offsetPage(0, 15);
        List<Topic> topics=topicService.listTopicsAndUsers();
        //获取统计信息
        int topicsNum=topicService.getTopicsNum();
        int usersNum=userService.getUserCount();
        //获取用户信息
        Integer uid=(Integer) session.getAttribute("userId");
        User user=userService.getUserById(uid);
        //最热主题
       
        List<Topic> hotestTopics=topicService.listMostCommentsTopics();

        model.addAttribute("topics",topics);
        model.addAttribute("hotestTopics",hotestTopics);
        model.addAttribute("topicsNum",topicsNum);
        model.addAttribute("usersNum",usersNum);
        model.addAttribute("user",user);
        return  "index";
    }
    
    @RequestMapping("/index/{num}")
    @ResponseBody
    public Object topicsList(@PathVariable("num") Integer num) {
    	if(num == null) {
    		return null;
    	}
    	PageHelper.offsetPage(num, 15);
    	List<Topic> topics=topicService.listTopicsAndUsers();
    	
    	return topics;
    }
    
    
    
    /**
     * 渲染主题详细页面
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/t/{id}")
    public String toTopic(@PathVariable("id")Integer id,HttpSession session,Model model){
        //点击量加一
        boolean ifSucc=topicService.clickAddOne(id);
        //获取主题信息
        Topic topic=topicService.selectById(id);
        //获取主题全部评论
        List<Reply> replies=replyService.getRepliesOfTopic(id);
        //获取评论数
        int repliesNum=replyService.repliesNum(id);
        //获取统计信息
        int topicsNum=topicService.getTopicsNum();
        int usersNum=userService.getUserCount();
        //获取用户信息
        Integer uid=(Integer) session.getAttribute("userId");
        User user=userService.getUserById(uid);
        //最热主题
        List<Topic> hotestTopics=topicService.listMostCommentsTopics();

        //渲染视图
        //ModelAndView topicPage=new ModelAndView("detailed");

         model.addAttribute("topic",topic);
         model.addAttribute("replies",replies);
         model.addAttribute("repliesNum",repliesNum);
         model.addAttribute("topicsNum",topicsNum);
         model.addAttribute("usersNum",usersNum);
         model.addAttribute("user",user);
         model.addAttribute("hotestTopics",hotestTopics);
        return "detailed";
    }

    /**
     * 渲染指定板块页面
     */
    @RequestMapping("/tab/{tabNameEn}")
    public ModelAndView toTabPage(@PathVariable("tabNameEn")String tabNameEn,HttpSession session){
        Tab tab=tabService.getByTabNameEn(tabNameEn);
        if (tab==null){
            return new ModelAndView("cate");
        }
        Integer tabId=tab.getId();

        ModelAndView indexPage=new ModelAndView("cate");
        //全部主题
        List<Topic> topics=topicService.listTopicsAndUsersOfTab(tabId);

        //获取统计信息
        int topicsNum=topicService.getTopicsNum();
        int usersNum=userService.getUserCount();

        //获取用户信息
        Integer uid=(Integer) session.getAttribute("userId");
        User user=userService.getUserById(uid);
        //最热主题
        List<Topic> hotestTopics=topicService.listMostCommentsTopics();

        indexPage.addObject("topics",topics);
        indexPage.addObject("topicsNum",topicsNum);
        indexPage.addObject("usersNum",usersNum);
        indexPage.addObject("tab",tab);
        indexPage.addObject("user",user);
        indexPage.addObject("hotestTopics",hotestTopics);
        return  indexPage;
    }

    /**
     * 发表主题
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/topic/add", method = RequestMethod.POST)
    @ResponseBody
    public Object addTopic(HttpServletRequest request,HttpSession session){
        ModelAndView indexPage;
        //未登陆
        if(session.getAttribute("userId")==null){
            indexPage=new ModelAndView("redirect:/signin");
           // return  indexPage;
        }
        //处理参数
        Integer userId=(Integer) session.getAttribute("userId");
        String title=request.getParameter("title");
        String content=request.getParameter("content");
        Byte tabId=Byte.parseByte(request.getParameter("tab"));
        //新建Topic
        Topic topic=new Topic();
        topic.setUserId(userId);
        topic.setTitle(title);
        topic.setContent(content);
        topic.setTabId(tabId);
        topic.setCreateTime(new Date());
        topic.setUpdateTime(new Date());
        //添加topic
        boolean ifSucc=topicService.addTopic(topic);
        boolean ifSuccAddCredit=userService.addCredit(1,userId);
        if (ifSucc){
//            if (log.isInfoEnabled()){
//                log.info("添加主题成功!");
//            }
        }

        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("code",0);
        resultMap.put("msg","success");
       return  resultMap;
    }

}
