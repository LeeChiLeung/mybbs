package com.onchange.controller;

import com.onchange.domain.Tab;
import com.onchange.domain.User;
import com.onchange.impl.ReplyServiceImpl;
import com.onchange.impl.TabServiceImpl;
import com.onchange.impl.TopicServiceImpl;
import com.onchange.impl.UserServiceImpl;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 主控制类
 */
@Controller
public class MainController {

	private static Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource 
    public TopicServiceImpl topicService;
	@Resource 
    public ReplyServiceImpl replyService;
	@Resource 
    public UserServiceImpl userService;
	@Resource 
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
    public String signup(Model model){
      

        //获取统计信息
        int topicsNum=topicService.getTopicsNum();
        int usersNum=userService.getUserCount();

        model.addAttribute("topicsNum",topicsNum);
        model.addAttribute("usersNum",usersNum);
       
        return  "signup";
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
    
        String name = request.getParameter("name");
        
        String string=IOUtils.toString(requestDate,"UTF-8");

        logger.info(string);

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("result","success");
        map.put("max", 160);
        map.put("min", 20);
        return map;
    }


    /**
     * 进入新建主题页面
     */
    @RequestMapping(value = {"/creative_articles"})
    public String newTopic(HttpSession session, Model model)
    {

        String username = (String)session.getAttribute("username");
        if (username == null){
            return "signin";
        }
        User user = userService.getUserByUsername(username);
        List<Tab> tabs=tabService.getAllTabs();
        //获取统计信息
        int topicsNum=topicService.getTopicsNum();
        int usersNum=userService.getUserCount();
        model.addAttribute("tabs",tabs);
        model.addAttribute("topicsNum",topicsNum);
        model.addAttribute("usersNum",usersNum);
        model.addAttribute("user",user);
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
