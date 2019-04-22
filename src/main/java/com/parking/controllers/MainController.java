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

    @RequestMapping(value = {"index", "/"})
    public ModelAndView indexPage(){
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/redirectPage", method = RequestMethod.GET)
    public String redirectPage(RedirectAttributes redirectAttributes){
        Users user = dbBean.getUserData();
        if (user != null) {
            Long roleId = user.getRole().getId();
            redirectAttributes.addFlashAttribute("user", user);
            if (roleId == 1L) {
                return "redirect:/Driver/driverPage";
            }
            else if (roleId == 2L) {
                return "redirect:/Employee/employeePage";
            }
            else if (roleId == 3L) {
                return "redirect:/Owner/ownerPage";
            }
            else if (roleId == 4L) {
                return "redirect:/Admin/adminPage";
            }
            else return "redirect:/index";
        }
        else return "redirect:/index";
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

    @RequestMapping(value = "/aboutPage", method = RequestMethod.GET)
    public ModelAndView aboutPage(){
        ModelAndView mw = new ModelAndView("about");
        return mw;
    }

    @RequestMapping(value = "/faqPage", method = RequestMethod.GET)
    public ModelAndView faqPage(){
        ModelAndView mw = new ModelAndView("faq");
        return mw;
    }

    @RequestMapping(value = "/contactPage", method = RequestMethod.GET)
    public ModelAndView contactPage(){
        ModelAndView mw = new ModelAndView("contact");
        return mw;
    }

    @RequestMapping(value = "/forDriversPage", method = RequestMethod.GET)
    public ModelAndView forDriversPage(){
        ModelAndView mw = new ModelAndView("forDrivers");
        return mw;
    }

    @RequestMapping(value = "/forSpaceOwnersPage", method = RequestMethod.GET)
    public ModelAndView forOwnersPage(){
        ModelAndView mw = new ModelAndView("forSpaceOwners");
        return mw;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@RequestParam(name = "email")String email,
                               @RequestParam(name = "password")String password,
                               @RequestParam(name = "surname")String surname,
                               @RequestParam(name = "name")String name,
                               @RequestParam(name = "role")String role){

        Roles roles = dbBean.getRoleByName(role); //get role from database owner

        password = DigestUtils.sha1Hex(password);

        Users user = new Users(roles, name, surname, email, password);

        dbBean.addObject(user);

        return "redirect:/index";
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accessDeniedPage(){
        ModelAndView mw = new ModelAndView("403");
        return mw;
    }

}
