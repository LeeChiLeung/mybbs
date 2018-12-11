package com.onchange.controller;

import com.onchange.service.impl.LoginLogServiceImpl;

import org.springframework.stereotype.Controller;
import javax.annotation.Resource;
/**
 * 登录日志控制类
 */
@Controller
public class LoginLogController {

	@Resource
    public LoginLogServiceImpl loginLogService;


}

