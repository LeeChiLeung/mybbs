package com.onchange.controller;

import com.onchange.domain.Reply;
import com.onchange.impl.ReplyServiceImpl;
import com.onchange.impl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * 回复相关控制类
 */
@Controller
public class ReplyController {

	@Resource 
    public ReplyServiceImpl replyService;
	@Resource 
    public UserServiceImpl userService;

    /**
     * 添加评论
     */
    @RequestMapping(value = "/reply/add",method = RequestMethod.POST)
    public ModelAndView addReply(HttpServletRequest request, HttpSession session){
        //处理参数
        Integer topicId=Integer.parseInt(request.getParameter("topicId"));
        Integer replyUserId=Integer.parseInt(request.getParameter("replyUserId"));
        String content=request.getParameter("content");
        //创建reply
        Reply reply=new Reply();
        reply.setTopicId(topicId);
        reply.setReplyUserId(replyUserId);
        reply.setContent(content);
        reply.setCreateTime(new Date());
        reply.setUpdateTime(new Date());
        //执行添加
        boolean ifSucc=replyService.addReply(reply);
        //添加积分
        boolean ifSuccAddCredit=userService.addCredit(1,replyUserId);

        //新建视图
        ModelAndView view=new ModelAndView("redirect:/t/"+topicId);
        return view;
    }


}
