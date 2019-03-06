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
        Users myUser = dbBean.getUserByEmail(s);
        Roles roles = myUser.getRole();
        Set<SimpleGrantedAuthority> authorities = new HashSet<SimpleGrantedAuthority>();

        authorities.add(new SimpleGrantedAuthority(roles.getName()));

        User securityUser = new User(myUser.getEmail(), myUser.getPassword(), authorities);
        return securityUser;
    }
}