package com.vti.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vti.entity.Department;
import com.vti.form.DepartmentFormForCreating;
import com.vti.form.DepartmentFormForUpdating;
import com.vti.repository.IDepartmentRepository;

@Service
public class DepartmentService implements IDepartmentService {
	
	@Autowired
	private IDepartmentRepository departmentRepository;

	@Override
	public List<Department> getAllDepartments() {
		// TODO Auto-generated method stub
		return departmentRepository.findAll();
	}

	@Override
	public Department getDepartmentByID(short id) {
		// TODO Auto-generated method stub
		return departmentRepository.findById(id).get();
	}

	@Override
	public Department getDepartmentByName(String name) {
		// TODO Auto-generated method stub
		return departmentRepository.findByName(name);
	}

	@Override
	public void deleteDepartment(short id) {
		// TODO Auto-generated method stub
		departmentRepository.deleteById(id);
	}

	@Override
	public boolean isDepartmentExistsByID(short id) {
		// TODO Auto-generated method stub
		return departmentRepository.existsById(id);
	}

	@Override
	public boolean isDepartmentExistsByName(String name) {
		// TODO Auto-generated method stub
		return departmentRepository.existsByName(name);
	}

	@Override
	public void createDepartment(DepartmentFormForCreating form) {

		// convert form --> entity
		// get author
		
		
		Department department = new Department(form.getName());

		departmentRepository.save(department);
	}

	@Override
	public void updateDepartment(short id, DepartmentFormForUpdating form) {
		// TODO Auto-generated method stub
		Department department = getDepartmentByID(id);
		department.setName(form.getName());
	}
}
