package com.parking.controllers;

import com.parking.beans.DBBean;
import com.parking.entities.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class MainController {

    @Autowired
    DBBean dbBean;
    DriverController driverController;

    @RequestMapping(value = {"index", "/"})
    public ModelAndView indexPage(){
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/redirectPage", method = RequestMethod.GET)
    public String redirectPage(RedirectAttributes redirectAttributes){
        Users user = getUserData();
        if (user != null) {
            Long roleId = user.getRole().getId();
            if (roleId == 1L) {
                redirectAttributes.addFlashAttribute("user", user);
                return "redirect:/Driver/driverPage";
            }
            else return "redirect:/index";
        }
        else return "redirect:/index";
    }



    @RequestMapping(value = "/employeePage", method = RequestMethod.GET)
    public ModelAndView employeePage(){
        ModelAndView mw = new ModelAndView("employeePage");
        mw.addObject("user", getUserData());
        return mw;
    }

    @RequestMapping(value = "/ownerPage", method = RequestMethod.GET)
    public ModelAndView ownerPage(){
        ModelAndView mw = new ModelAndView("ownerPage");
        mw.addObject("user", getUserData());
        return mw;
    }

    @RequestMapping(value = "/adminPage", method = RequestMethod.GET)
    public ModelAndView adminPage(){
        ModelAndView mw = new ModelAndView("adminPage");
        mw.addObject("user", getUserData());
        return mw;
    }

    @RequestMapping(value = "/registrationPage", method = RequestMethod.GET)
    public ModelAndView registrationPage(){
        ModelAndView mw = new ModelAndView("registration");
        return mw;
    }

    @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
    public ModelAndView loginPage(){
        ModelAndView mw = new ModelAndView("login");
        return mw;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@RequestParam(name = "email")String email, @RequestParam(name = "password")String password, @RequestParam(name = "surname")String surname, @RequestParam(name = "name")String name){

        Roles role = dbBean.getRoleByName("driver"); //get role from database owner

        password = DigestUtils.sha1Hex(password);

        Users user = new Users(role, name, surname, email, password);

        dbBean.addUser(user);

        return "redirect:/index";
    }



    public Users getUserData(){
        Users user = null;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(!(authentication instanceof AnonymousAuthenticationToken)){
            UserDetails ud = (UserDetails) authentication.getPrincipal();
            user = dbBean.getUserByEmail(ud.getUsername());
        }
        return user;
    }


}
