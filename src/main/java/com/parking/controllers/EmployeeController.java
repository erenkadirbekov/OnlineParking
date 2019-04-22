package com.parking.controllers;

import com.parking.beans.DBBean;
import com.parking.beans.EmployeeBean;
import com.parking.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Employee")
public class EmployeeController {
    @Autowired
    DBBean dbBean;
    @Autowired
    EmployeeBean employeeBean;

    @RequestMapping(value = "/employeePage", method = RequestMethod.GET)
    public ModelAndView employeePage() {
        ModelAndView mw = new ModelAndView("employeePage");
        Users user = dbBean.getUserData();
        mw.addObject("user", user);
        return mw;
    }


}
