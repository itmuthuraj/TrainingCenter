package com.smi.trainingcenter.details;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.smi.trainingcenter.model.SecurityBean;





public class MyUserDetail implements UserDetails{
	

	private String userName;
	private String password;
	private boolean active;
	private List<GrantedAuthority> authorities;
	
	public MyUserDetail(SecurityBean securitybean) {
		this.userName=securitybean.getUserName();
		this.password=securitybean.getPassword();
		this.active=securitybean.isActive();
		this.authorities=Arrays.stream(securitybean.getRoles().split(","))
				.map(SimpleGrantedAuthority::new)
				.collect(Collectors.toList() );
	}
	
	
	 @Override
	    public Collection<? extends GrantedAuthority> getAuthorities() {
	        return authorities;
	    }

	    @Override
	    public String getPassword() {
	        return password;
	    }

	    @Override
	    public String getUsername() {
	        return userName;
	    }

	    @Override
	    public boolean isAccountNonExpired() {
	        return true;
	    }

	    @Override
	    public boolean isAccountNonLocked() {
	        return true;
	    }

	    @Override
	    public boolean isCredentialsNonExpired() {
	        return true;
	    }

	    @Override
	    public boolean isEnabled() {
	        return active;
	    }
}
