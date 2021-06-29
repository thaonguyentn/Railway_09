package com.vti.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.vti.entity.Account;
import com.vti.entity.Department;
import com.vti.entity.Position;
import com.vti.form.AccountFormForCreating;
import com.vti.form.AccountFormForUpdating;
import com.vti.repository.IAccountRepository;
import com.vti.repository.IDepartmentRepository;
import com.vti.repository.IPositionRepository;
import com.vti.specification.AccountSpecification;

@Service
public class AccountService implements IAccountService {

	@Autowired
	private IAccountRepository accRepository;
	@Autowired
	private IDepartmentRepository departmentRepository;
	@Autowired
	private IPositionRepository positionRepository;

	@Override
	public Account getAccountByEmail(String email) {
		// TODO Auto-generated method stub
		return accRepository.findByEmail(email);
	}

	@Override
	public Account getAccountByID(Integer id) {
		// TODO Auto-generated method stub
		return accRepository.getById(id);
	}

	@Override
	public Account getAccountByUsername(String username) {
		// TODO Auto-generated method stub
		return accRepository.findByUsername(username);
	}

	@Override
	public void createAccount(AccountFormForCreating form) {
		Account account = new Account();
		Department department = departmentRepository.getById(form.getDepartmentId());
		Position position = positionRepository.getById(form.getPositionId());
		account.setEmail(form.getEmail());
		account.setUsername(form.getUsername());
		account.setFullname(form.getFullname());
		account.setDepartment(department);
		account.setPosition(position);
		accRepository.save(account);
	}

	public void updateAccount(Integer id, AccountFormForUpdating form) {
		Account account = accRepository.getById(id);
		Department department = departmentRepository.getById(form.getDepartmentId());
		Position position = positionRepository.getById(form.getPositionId());
		account.setFullname(form.getFullname());
		account.setDepartment(department);
		account.setPosition(position);
		accRepository.save(account);

	}

	@Override
	public void deleteAccount(Integer id) {
		// TODO Auto-generated method stub
		accRepository.deleteById(id);
	}

	@Override
	public Page<Account> getAllAccounts(Pageable pageable, String search) {
		Specification<Account> where = null;
		if (!StringUtils.isEmpty(search)) {
			AccountSpecification nameSpecification = new AccountSpecification("fullname", "LIKE", search);
			AccountSpecification emailSpecification = new AccountSpecification("email", "LIKE", search);
			AccountSpecification departmentSpecification = new AccountSpecification("department.name", "LIKE", search);
			where = Specification.where(nameSpecification).or(emailSpecification).or(departmentSpecification);
		}
		return accRepository.findAll(where, pageable);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account = accRepository.findByUsername(username);
		if (account == null) {
			throw new UsernameNotFoundException(username);
		}
		return new User(account.getUsername(), account.getPassword(), AuthorityUtils.createAuthorityList("user"));
	}

//	@Override
//	public boolean isAccountExistsByID(Integer id) {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
	@Override
	public boolean isAccountExistsByEmail(String email) {
		// TODO Auto-generated method stub
		return accRepository.existsByEmail(email);
	}

	@Override
	public boolean isAccountExistsByUsername(String username) {
		// TODO Auto-generated method stub
		return accRepository.existsByUsername(username);
	}

//	@Override
//	public boolean isAccountExistsByID(Integer id) {
//		// TODO Auto-generated method stub
//		return false;
//	}

}
