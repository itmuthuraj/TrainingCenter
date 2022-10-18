package com.smi.trainingcenter.service;



import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.smi.trainingcenter.details.MyUserDetail;
import com.smi.trainingcenter.model.SecurityBean;
import com.smi.trainingcenter.repository.SecurityRepository;



@Service
public class MyUserDetailService implements UserDetailsService {
	
	@Autowired
	SecurityRepository securityrepository;
	

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<SecurityBean> securityBean=securityrepository.findByUserName(username);
		
		securityBean.orElseThrow(()->new UsernameNotFoundException("Not Found :" + username));
		return securityBean.map(MyUserDetail::new).get();
	}

}
