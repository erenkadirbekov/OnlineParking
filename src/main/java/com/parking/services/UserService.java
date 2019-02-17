package com.parking.services;

import com.parking.beans.DBBean;
import com.parking.entities.Roles;
import com.parking.entities.Users;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import java.util.HashSet;
import java.util.Set;
public class UserService implements UserDetailsService {
    private DBBean dbBean;
    public DBBean getDbBean() {
        return dbBean;
    }
    public void setDbBean(DBBean dbBean) {
        this.dbBean = dbBean;
    }
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Users myUser = dbBean.getUser(s);
        Roles roles = myUser.getRole();
        Set<SimpleGrantedAuthority> authorities = new HashSet<SimpleGrantedAuthority>();

        String role = "";

        if(roles.getId()==1L) role = "ROLE_DRIVER";
        else if(roles.getId()==2L) role = "ROLE_EMPLOYEE";
        else if(roles.getId()==3L) role = "ROLE_MANAGER";
        else if(roles.getId()==4L) role = "ROLE_ADMIN";
        authorities.add(new SimpleGrantedAuthority(role));

        User securityUser = new User(myUser.getEmail(), myUser.getPassword(), authorities);
        return securityUser;
    }
}