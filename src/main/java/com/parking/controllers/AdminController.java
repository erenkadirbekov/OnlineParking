package com.parking.controllers;

import com.parking.beans.AdminBean;
import com.parking.entities.Parkings;
import org.springframework.beans.factory.NamedBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

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
        ModelAndView mw = new ModelAndView("requestsPage");
        ArrayList<Parkings> parkings = adminBean.getAllNotAddedParkings();
        mw.addObject("parkings", parkings);
        return mw;
    }

    @RequestMapping(value = "/addParking", method = RequestMethod.GET)
    public ModelAndView addParkingPage(@RequestParam(name = "id") Long id) {
        ModelAndView mw = new ModelAndView("/addParking");
        Parkings parking = adminBean.getParkingById(id);
        mw.addObject("parking", parking);
        return mw;
    }

    @RequestMapping(value = "/addParking", method = RequestMethod.POST)
    public String addParking(@RequestParam(name = "latitude") String latitude,
                             @RequestParam(name = "longitude") String longitude,
                             @RequestParam(name = "id") Long id) {
        Parkings parking = adminBean.getParkingById(id);
        parking.setLatitude(Double.parseDouble(latitude));
        parking.setLongitude(Double.parseDouble(longitude));
        parking.setStatus(1);
        adminBean.addParking(parking);

        return "redirect:/adminPage";
    }

    @RequestMapping(value = "/rejectRequest", method = RequestMethod.POST)
    public String rejectRequest(@RequestParam(name = "id") Long id) {
        adminBean.deleteParkingById(id);
        return "redirect:/requests";
    }
}
