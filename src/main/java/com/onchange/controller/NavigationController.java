package com.onchange.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NavigationController {

    @RequestMapping("/navigation")
    public String navigation(){

        return "navigation";
    }
}
