package com.vti.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.vti.entity.Account;

public interface IAccountRepository extends JpaRepository<Account, Integer>, JpaSpecificationExecutor<Account> {

	public Account findByUsername(String username);

	public Account findByEmail(String email);

//	public boolean existsById(Integer id);

	public boolean existsByEmail(String email);

	public boolean existsByUsername(String username);

}
