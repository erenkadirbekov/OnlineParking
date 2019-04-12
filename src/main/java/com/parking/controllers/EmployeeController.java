package com.parking.controllers;

import com.parking.beans.DBBean;
import com.parking.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Employee")
public class EmployeeController {
    @Autowired
    DBBean dbBean;

    @RequestMapping(value = "/employeePage")
    public ModelAndView employeePage() {
        ModelAndView mw = new ModelAndView("employeePage");
        Users user = dbBean.getUserData();
        return mw;
    }
}
