package com.smi.trainingcenter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.smi.trainingcenter.model.CourseBean;
@Repository
public interface CourseRepository extends JpaRepository<CourseBean, Integer>{


	
}
