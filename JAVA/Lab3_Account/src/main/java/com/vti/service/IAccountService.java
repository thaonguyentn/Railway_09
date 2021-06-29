package com.vti.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.vti.entity.Account;

import com.vti.form.AccountFormForCreating;
import com.vti.form.AccountFormForUpdating;

public interface IAccountService extends UserDetailsService {

	public Page<Account> getAllAccounts(Pageable pageable, String search);

//	public List<Account> getAllAccounts();

	public Account getAccountByUsername(String username);

	public Account getAccountByID(Integer id);

	public Account getAccountByEmail(String email);

	public void createAccount(AccountFormForCreating form);

	public void updateAccount(Integer id, AccountFormForUpdating form);

	public void deleteAccount(Integer id);

//	public boolean isAccountExistsByID(Integer id);

	public boolean isAccountExistsByEmail(String email);
	
	public boolean isAccountExistsByUsername(String username);

}
