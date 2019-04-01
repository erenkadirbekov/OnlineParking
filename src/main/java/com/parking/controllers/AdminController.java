package com.parking.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.parking.beans.AdminBean;
import com.parking.entities.Parkings;
import org.springframework.beans.factory.NamedBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
@RequestMapping("/Admin")
public class AdminController {
    @Autowired
    AdminBean adminBean;
    Gson gsonBuilder = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();

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

    @RequestMapping(value = "/parkingLocation/{id}", method = RequestMethod.GET)
    public ModelAndView parkingsLocationPage(@PathVariable Long id) {
        ModelAndView mw = new ModelAndView("parkingLocationPage");
        Parkings parking = adminBean.getParkingById(id);
        mw.addObject("parking", parking);
        return mw;
    }

    @RequestMapping(value = "/addParking", method = RequestMethod.POST)
    public String addParking(@RequestParam(name = "id") Long id) {
        Parkings parking = adminBean.getParkingById(id);
        parking.setStatus(1);
        adminBean.updateInactiveParking(parking);
        return "redirect:/Admin/adminPage";
    }

    @ResponseBody
    @CrossOrigin(allowCredentials = "true")
    @RequestMapping(value = "/getMarker/{id}", method = RequestMethod.GET)
    public String getMarkers(@PathVariable Long id){
        try {
            Parkings parking = adminBean.getParkingById(id);

            return gsonBuilder.toJson(parking);

        } catch (Exception e) {
            System.out.println(e);
            return gsonBuilder.toJson(null);
        }
    }

    @RequestMapping(value = "/rejectRequest", method = RequestMethod.POST)
    public String rejectRequest(@RequestParam(name = "id") Long id) {
        adminBean.deleteParkingById(id);
        return "redirect:/Admin/requests";
    }
}
