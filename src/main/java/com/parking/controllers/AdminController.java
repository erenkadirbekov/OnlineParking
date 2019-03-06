package com.parking.controllers;

import com.parking.beans.AdminBean;
import com.parking.entities.Parkings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Admin")
public class AdminController {
    @Autowired
    AdminBean adminBean;

    @RequestMapping(value = "/adminPage", method = RequestMethod.GET)
    public ModelAndView adminPage() {
        ModelAndView mw = new ModelAndView("adminPage");
        return mw;
    }

    @RequestMapping(value = "/requests", method = RequestMethod.GET)
    public ModelAndView requestsPage() {
        ModelAndView mw = new ModelAndView("requests");
        return mw;
    }

    @RequestMapping(value = "/addParking", method = RequestMethod.GET)
    public ModelAndView addParkingPage() {
        ModelAndView mw = new ModelAndView("/addParking");
        return mw;
    }

    @RequestMapping(value = "/addParking", method = RequestMethod.POST)
    public String addParking(@RequestParam(name = "latitude") String latitude,
                             @RequestParam(name = "longitude") String longitude) {
        Parkings parking = new Parkings(Double.parseDouble(latitude), Double.parseDouble(longitude));
        adminBean.addParking(parking);

        return "redirect:/adminPage";
    }
}
