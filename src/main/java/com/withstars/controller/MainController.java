package com.withstars.controller;

import com.withstars.domain.Tab;
import com.withstars.service.impl.ReplyServiceImpl;
import com.withstars.service.impl.TabServiceImpl;
import com.withstars.service.impl.TopicServiceImpl;
import com.withstars.service.impl.UserServiceImpl;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 主控制类
 */
@Controller
public class MainController {

	private static Logger logger = LoggerFactory.getLogger(MainController.class);
	
    @Autowired
    public TopicServiceImpl topicService;
    @Autowired
    public ReplyServiceImpl replyService;
    @Autowired
    public UserServiceImpl userService;
    @Autowired
    public TabServiceImpl tabService;

    /**
     * 进入登录页面.
     */
    @RequestMapping("/signin")
    public String signin(Model model){


        //获取统计信息
        int topicsNum=topicService.getTopicsNum();
        int usersNum=userService.getUserCount();

        model.addAttribute("topicsNum",topicsNum);
        model.addAttribute("usersNum",usersNum);
        return  "signin";
    }

    /**
     * 进入注册页面.
     */
    @RequestMapping("/signup")
    public ModelAndView signup(){
        ModelAndView signupPage=new ModelAndView("signup");

        //获取统计信息
        int topicsNum=topicService.getTopicsNum();
        int usersNum=userService.getUserCount();

        signupPage.addObject("topicsNum",topicsNum);
        signupPage.addObject("usersNum",usersNum);
        return  signupPage;
    }

    @RequestMapping(value = "/slide")
    @ResponseBody
    public Object checkSlide(HttpServletRequest request) throws IOException {

        ServletInputStream requestDate = request.getInputStream();
        String data = request.getQueryString();
        if(data!=null) {
            data = URLDecoder.decode(data, "UTF-8");
            logger.info(data);
        }
        Map requestMap = request.getParameterMap();
        String name = request.getParameter("name");
        
        String string=IOUtils.toString(requestDate,"UTF-8");

        logger.info(string);

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("result","success");
        return map;
    }


    /**
     * 进入新建主题页面
     */
    @RequestMapping(value = {"/creative_articles"})
    public String newTopic(Model model)
    {


        List<Tab> tabs=tabService.getAllTabs();
        //获取统计信息
        int topicsNum=topicService.getTopicsNum();
        int usersNum=userService.getUserCount();
        model.addAttribute("tabs",tabs);
        model.addAttribute("topicsNum",topicsNum);
        model.addAttribute("usersNum",usersNum);
        return  "creative_articles";
    }

    /**
     * 配置404页面
     */
    @RequestMapping("*")
    public String notFind(){
        return "404";
    }
}
