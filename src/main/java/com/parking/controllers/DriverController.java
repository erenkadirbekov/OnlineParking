package com.parking.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.parking.beans.DBBean;
import com.parking.beans.DriverBean;
import com.parking.entities.Parkings;
import com.parking.entities.Reservations;
import com.parking.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

@Controller
@RequestMapping("/Driver")
public class DriverController {
    @Autowired
    DBBean dbBean;
    @Autowired
    DriverBean driverBean;
    Gson gsonBuilder = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();

    private static final int statusActive = 1;
    private static final int statusDenied = 2;
    private static final int statusNonActive = 0;

    @RequestMapping(value = "/driverPage", method = RequestMethod.GET)
    public ModelAndView driverPage(){
        ModelAndView mw = new ModelAndView("driverPage");
        Users user = dbBean.getUserData();
        ArrayList<Reservations> reservations = driverBean.getReservationsByDriver(user);
        mw.addObject("user", user);
        mw.addObject("reservations", reservations);
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

    @RequestMapping(value = "/chosenParking", method = RequestMethod.GET)
    public ModelAndView chosenParking(@RequestParam(name = "id") Long id){
        Parkings parking = dbBean.getParkingById(id);
        ModelAndView mw = new ModelAndView("chosenParking");
        Users user = dbBean.getUserData();
        mw.addObject("user", user);
        mw.addObject("parking", parking);
        return mw;
    }


    @RequestMapping(value = "/checkTime", method = RequestMethod.POST)
    public String checkTime(@RequestParam(name = "date") String date,
                            @RequestParam(name = "time")int time,
                            @RequestParam(name = "hours")int hours,
                            @RequestParam(name = "id") Long id){

        Parkings parking = dbBean.getParkingById(id);
        ArrayList<Reservations> reservations = driverBean.getReservationsByParkId(parking);
        Timestamp startTime = driverBean.createTimestamp(date, time);
        if(time+hours>24){
            //error
            return "redirect:/Driver/chosenParking?id="+id+"&error=1";
        }

        Calendar rightNow = Calendar.getInstance();
        int hour = rightNow.get(Calendar.HOUR_OF_DAY);

        if(hour >= time){
            return "redirect:/Driver/chosenParking?id="+id+"&error=1";
        }

        int counter = 0;

        for(Reservations r : reservations){

            if((r.getStartTime() < time) && (r.getStartTime()+r.getParkHours() > time)){
                counter++;
            }else if((r.getStartTime() < time + hours) && (r.getStartTime()+r.getParkHours() > time + hours)){
                counter++;
            }

        }

        if(counter>=parking.getSlots()){
            //error
            return "redirect:/Driver/chosenParking?id="+id+"&error=2";
        }

        Reservations reservation = new Reservations(dbBean.getUserData(), parking, new Timestamp(new Date().getTime()), time, hours, parking.getCost()*hours, statusActive);

        dbBean.addObject(reservation);


        return "redirect:/Driver/driverPage";
    }



    @RequestMapping(value = "/deactivateReservation", method = RequestMethod.POST)
    public String deactivateReservation(@RequestParam(name = "id") Long id){

        Reservations reservations = driverBean.getReservationById(id);

        reservations.setStatus(statusDenied);

        dbBean.updateObject(reservations);

        return "redirect:/Driver/driverPage";
    }




}
