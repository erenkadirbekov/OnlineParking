package com.parking.controllers;

import com.parking.beans.DBBean;
import com.parking.beans.DriverBean;
import com.parking.entities.Parkings;
import com.parking.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
@RequestMapping("/Driver")
public class DriverController {
    @Autowired
    DBBean dbBean;
    @Autowired
    DriverBean driverBean;

    @RequestMapping(value = "/driverPage", method = RequestMethod.GET)
    public ModelAndView driverPage(){
        ArrayList<Parkings> parkings = driverBean.getActiveParkings();
        ModelAndView mw = new ModelAndView("driverPage");
        Users user = dbBean.getUserData();
        mw.addObject("user", user);
        mw.addObject("parkings", parkings);
        return mw;
    }
}
