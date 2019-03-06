package com.parking.controllers;

import com.parking.beans.DBBean;
import com.parking.beans.DriverBean;
import com.parking.beans.OwnerBean;
import com.parking.entities.Cities;
import com.parking.entities.Parkings;
import com.parking.entities.Users;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
@RequestMapping("/Owner")
public class OwnerController {
    @Autowired
    DBBean dbBean;
    @Autowired
    OwnerBean ownerBean;

    @RequestMapping(value = "/ownerPage", method = RequestMethod.GET)
    public ModelAndView ownerPage(){
        ArrayList<Parkings> parkings = ownerBean.getOwnParkings();
        ModelAndView mw = new ModelAndView("driverPage");
        Users user = dbBean.getUserData();
        mw.addObject("user", user);
        mw.addObject("parkings", parkings);
        return mw;
    }


    @RequestMapping(value = "/createParkingPage", method = RequestMethod.GET)
    public ModelAndView createParkingPage(){
        ModelAndView mw = new ModelAndView("createParkingPage");
        ArrayList<Cities> cities = ownerBean.getAllCities();
        mw.addObject("cities", cities);

        return mw;
    }

    @RequestMapping(value = "/createParking", method = RequestMethod.POST)
    public String createParking(@RequestParam(name = "slots") int slots, @RequestParam(name = "cost")int cost, @RequestParam(name = "house")String house, @RequestParam(name = "street")String street, @RequestParam(name = "postal")String postal, @RequestParam(name = "city")Long cityId){


        Parkings parkings = new Parkings(slots, dbBean.getUserData(), ownerBean.getCityById(cityId), house, street, postal, cost, 0);
        ownerBean.addNewParking(parkings);


        return "redirect:/ownerPage";
    }
}