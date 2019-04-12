package com.parking.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
@RequestMapping("/Driver")
public class DriverController {
    @Autowired
    DBBean dbBean;
    @Autowired
    DriverBean driverBean;
    Gson gsonBuilder = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();

    @RequestMapping(value = "/driverPage", method = RequestMethod.GET)
    public ModelAndView driverPage(){
        ArrayList<Parkings> parkings = driverBean.getActiveParkings();
        ModelAndView mw = new ModelAndView("driverPage");
        Users user = dbBean.getUserData();
        mw.addObject("user", user);
        mw.addObject("parkings", parkings);
        return mw;
    }

    @ResponseBody
    @CrossOrigin(allowCredentials = "true")
    @RequestMapping(value = "/getMarkers", method = RequestMethod.GET)
    public String getMarkers(){
        try {
            ArrayList<Parkings> parkings = driverBean.getActiveParkings();

            return gsonBuilder.toJson(parkings);

        } catch (Exception e) {
            System.out.println(e);
            return gsonBuilder.toJson(null);
        }
    }



}
