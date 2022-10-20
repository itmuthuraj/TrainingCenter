package com.smi.trainingcenter.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smi.trainingcenter.model.CourseBean;
import com.smi.trainingcenter.repository.CourseRepository;



public interface CourseService {

	List<CourseBean>viewCourse();
	
	void insertCourse(CourseBean coursebean);

	
}
