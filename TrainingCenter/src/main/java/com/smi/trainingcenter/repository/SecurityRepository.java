package com.smi.trainingcenter.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smi.trainingcenter.model.SecurityBean;


public interface SecurityRepository extends JpaRepository<SecurityBean,Integer>{
	Optional<SecurityBean> findByUserName(String username);

}
