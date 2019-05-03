package com.parking.controllers;

import com.parking.beans.DBBean;
import com.parking.beans.OwnerBean;
import com.parking.entities.Cities;
import com.parking.entities.Parkings;
import com.parking.entities.Roles;
import com.parking.entities.Users;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
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
        ModelAndView mw = new ModelAndView("ownerPage");
        Users user = dbBean.getUserData();
        ArrayList<Parkings> parkings = ownerBean.getOwnParkings(user);
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

    @RequestMapping(value = "/parkingLocation", method = RequestMethod.GET)
    public ModelAndView parkingLocationPage(HttpSession session) {
        ModelAndView mw = new ModelAndView("setParkingsLocation");
        return mw;
    }

    @RequestMapping(value = "/parkingLocation", method = RequestMethod.POST)
    public String parkingLocationPage(@RequestParam(name = "latitude") Double latitude,
                                      @RequestParam(name = "longitude") Double longitude,
                                      HttpSession session) {
        System.out.println("HERE  " + latitude);
        Parkings parking = (Parkings) session.getAttribute("newParking");
        parking.setLatitude(latitude);
        parking.setLongitude(longitude);
        ownerBean.addNewParking(parking);
        session.removeAttribute("newParking");
        return "redirect:/Owner/ownerPage";
    }

    @RequestMapping(value = "/createParking", method = RequestMethod.POST)
    public String createParking(@RequestParam(name = "slots") int slots,
                                @RequestParam(name = "cost")int cost,
                                @RequestParam(name = "house")String house,
                                @RequestParam(name = "street")String street,
                                @RequestParam(name = "postal")String postal,
                                @RequestParam(name = "city")Long cityId,
                                HttpSession session){
        Parkings parking = new Parkings(slots, dbBean.getUserData(), ownerBean.getCityById(cityId), house, street, postal, cost, 0);
        //ownerBean.addNewParking(parking);

        session.setAttribute("newParking", parking);
        return "redirect:/Owner/parkingLocation";
    }

    @RequestMapping(value = "/ownerParkingPage/{id}", method = RequestMethod.GET)
    public ModelAndView ownerParkingPage(@PathVariable Long id){

        ModelAndView mw = new ModelAndView("ownerParkingPage");

        Parkings parking = dbBean.getParkingById(id);
        ArrayList<Users> employees = ownerBean.getEmployeesByParking(parking);

        mw.addObject("employees", employees);
        mw.addObject("parking", parking);
        return mw;
    }

    @RequestMapping(value = "/createEmployee/{parkingId}", method = RequestMethod.GET)
    public ModelAndView createEmployeePage(@PathVariable Long parkingId) {
        ModelAndView mw = new ModelAndView("createEmployeePage");
        mw.addObject("parkingId", parkingId);
        return mw;
    }

    @RequestMapping(value = "/createEmployee", method = RequestMethod.POST)
    public String createEmployee(@RequestParam(name = "name") String name,
                                 @RequestParam(name = "surname") String surname,
                                 @RequestParam(name = "email") String email,
                                 @RequestParam(name = "password") String password,
                                 @RequestParam(name = "parkingId") Long parkingId) {
        if(name != null && surname != null && password != null && parkingId != null) {
            Roles role = dbBean.getRoleByName("employee");
            Parkings parking = dbBean.getParkingById(parkingId);
            password = DigestUtils.sha1Hex(password);
            Users employee = new Users(role, parking, name, surname, email, password);
            ownerBean.addEmployee(employee);
        }
        return "redirect:/Owner/ownerParkingPage/" + parkingId;
    }

    @RequestMapping(value = "/allEmployees", method = RequestMethod.GET)
    public ModelAndView allEmployeesPage() {
        Users owner = dbBean.getUserData();
        System.out.println(owner.getName());
        ArrayList<Users> employees = (ArrayList<Users>) ownerBean.getAllEmployeesByOwner(owner);
        ModelAndView mw = new ModelAndView("allOwnersEmployeesPage");
        mw.addObject("employees", employees);
        return mw;
    }

    @RequestMapping(value = "/editEmployeePage/{id}", method = RequestMethod.GET)
    public ModelAndView editEmployeePage(@PathVariable Long id) {
        ModelAndView mw = new ModelAndView("editEmployeePage");
        Users owner = dbBean.getUserData();
        Users employee = dbBean.getUserById(id);
        ArrayList<Parkings> parkings = ownerBean.getOwnParkings(owner);
        mw.addObject("parkings", parkings);
        mw.addObject("employee", employee);
        return mw;
    }

    @RequestMapping(value = "/editEmployee", method = RequestMethod.POST)
    public String editEmployee(@RequestParam(name = "parkingId") Long parkingId,
                               @RequestParam(name = "employeeId") Long employeeId,
                               @RequestParam(name = "name") String name,
                               @RequestParam(name = "surname") String surname,
                               @RequestParam(name = "email") String email,
                               @RequestParam(name = "password") String password) {
        Parkings parking = ownerBean.getOwnParkingById(parkingId);
        Users employee = dbBean.getUserById(employeeId);
        employee.setEmployeesParking(parking);
        employee.setName(name);
        employee.setSurname(surname);
        employee.setEmail(email);
        if (!StringUtils.trimAllWhitespace(password).isEmpty()) {
            password = DigestUtils.sha1Hex(password);
            employee.setPassword(password);
        }
        dbBean.updateObject(employee);
        return "redirect:/Owner/allEmployees";
    }
}