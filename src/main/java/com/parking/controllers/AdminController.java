package com.parking.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.parking.beans.AdminBean;
import com.parking.beans.DBBean;
import com.parking.entities.CarBrands;
import com.parking.entities.CarModels;
import com.parking.entities.Parkings;
import com.parking.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
@RequestMapping("/Admin")
public class AdminController {
    @Autowired
    DBBean dbBean;
    @Autowired
    AdminBean adminBean;
    Gson gsonBuilder = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();

    private static final String errorName = "Name";
    private static final String errorBrand = "Brand";
    private static final String errorExist = "exists";

    private static final String roleOwner = "owner";

    @RequestMapping(value = "/adminPage", method = RequestMethod.GET)
    public ModelAndView adminPage() {
        ModelAndView mw = new ModelAndView("adminPage");
        Users user = dbBean.getUserData();
        mw.addObject("user", user);
        return mw;
    }

    @RequestMapping(value = "/requests", method = RequestMethod.GET)
    public ModelAndView requestsPage() {
        ModelAndView mw = new ModelAndView("requestsPage");
        ArrayList<Parkings> parkings = adminBean.getAllNotAddedParkings();
        Users user = dbBean.getUserData();
        mw.addObject("user", user);
        mw.addObject("parkings", parkings);
        return mw;
    }

    @RequestMapping(value = "/parkingLocation/{id}", method = RequestMethod.GET)
    public ModelAndView parkingsLocationPage(@PathVariable Long id) {
        ModelAndView mw = new ModelAndView("parkingLocationPage");
        Users user = dbBean.getUserData();
        mw.addObject("user", user);
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

    @RequestMapping(value = "/newCarModel", method = RequestMethod.GET)
    public ModelAndView newCarModelPage() {
        ModelAndView mw = new ModelAndView("addNewCarModelPage");
        Users user = dbBean.getUserData();
        mw.addObject("user", user);
        mw.addObject("brands", dbBean.getAllCarBrands());
        return mw;
    }

    @RequestMapping(value = "/newCarModel/{error}", method = RequestMethod.GET)
    public ModelAndView NewCarModelWithErrorPage(@PathVariable String error) {
        ModelAndView mw = new ModelAndView("addNewCarModelPage");
        Users user = dbBean.getUserData();
        mw.addObject("user", user);
        mw.addObject("brands", dbBean.getAllCarBrands());
        mw.addObject("error", error);
        return mw;
    }

    @RequestMapping(value = "/addNewCarBrand", method = RequestMethod.POST)
    public String addNewCarBrand(@RequestParam(name = "name") String name) {
        if (name == null || name == "") return "redirect:/Admin/newCarModel/" + errorBrand;
        CarBrands brand = new CarBrands(name);
        boolean isBrandExist = adminBean.isCarBrandExists(brand);
        if (isBrandExist) return "redirect:/Admin/newCarModel/" + errorExist;
        adminBean.addNewCarBrand(brand);
        return "redirect:/Admin/adminPage";
    }

    @RequestMapping(value = "/addNewCarModel", method = RequestMethod.POST)
    public String addNewCarModel(@RequestParam(name = "name") String name,
                                 @RequestParam(name = "brandId") Long brandId) {
        if (name == null || name == "") return "redirect:/Admin/newCarModel/" + errorName;
        if (brandId == null || brandId == 0) return "redirect:/Admin/newCarModel/" + errorBrand;
        CarModels model = new CarModels(name, dbBean.getCarBrandById(brandId));
        boolean isModelExist = adminBean.isCarModelExists(model);
        if (isModelExist) return "redirect:/Admin/newCarModel/" + errorExist;
        adminBean.addNewCarModel(model);
        return "redirect:/Admin/adminPage";
    }

    @RequestMapping(value = "activeParkings", method = RequestMethod.GET)
    public ModelAndView activeParkingsPage() {
        ModelAndView mw = new ModelAndView("allActiveParkingsPage");
        Users user = dbBean.getUserData();
        mw.addObject("user", user);
        mw.addObject("parkings", adminBean.getActiveParkings());
        return mw;
    }

    @RequestMapping(value = "deactivateParking", method = RequestMethod.POST)
    public String deactivateParking(@RequestParam(name = "parkingId") Long parkingId) {
        Parkings parking = adminBean.getParkingById(parkingId);
        dbBean.deactivateParking(parking);
        Users user = dbBean.getUserData();
        if (user.getRole().getName().equals(roleOwner)) return "redirect:/Owner/ownerPage";
        return "redirect:/Admin/activeParkings";
    }
}
