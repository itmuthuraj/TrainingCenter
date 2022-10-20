package com.smi.trainingcenter.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smi.trainingcenter.model.CourseBean;
import com.smi.trainingcenter.repository.CourseRepository;
import com.smi.trainingcenter.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {
	
	
	@Autowired
	public CourseRepository courseRepository;
	
	@Override
	public List<CourseBean> viewCourse() {
		// TODO Auto-generated method stub
		return courseRepository.findAll();
	}

	@Override
	public void insertCourse(CourseBean coursebean) {
		// TODO Auto-generated method stub
		this.courseRepository.save(coursebean);
	}

}
