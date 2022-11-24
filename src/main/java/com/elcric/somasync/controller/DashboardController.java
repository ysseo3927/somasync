package com.elcric.somasync.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @GetMapping("/dashboard")
    public String login() {
        return "dashboard";
    }

    @GetMapping("/report")
    public String report() {
        return "report";
    }

}
