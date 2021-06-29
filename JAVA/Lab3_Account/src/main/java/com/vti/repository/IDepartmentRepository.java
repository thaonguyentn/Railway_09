package com.vti.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vti.entity.Department;

public interface IDepartmentRepository extends JpaRepository<Department, Short> {

	public Department findByName(String name);

//	public Department deleteById(short id);

	public boolean existsByName(String name);

//	public boolean existsByID(short id);
}
