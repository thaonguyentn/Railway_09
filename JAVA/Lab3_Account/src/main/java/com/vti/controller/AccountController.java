package com.vti.controller;

import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.vti.dto.AccontDto;
import com.vti.entity.Account;
import com.vti.form.AccountFormForCreating;
import com.vti.form.AccountFormForUpdating;
import com.vti.service.IAccountService;

@RestController
@RequestMapping(value = "api/v1/accounts")
@CrossOrigin("*")
public class AccountController {

	@Autowired
	private IAccountService accService;

	@GetMapping()
	public ResponseEntity<?> getAllAccounts(Pageable pageable, @RequestParam(required = false) String search) {
		Page<Account> listAcc = accService.getAllAccounts(pageable, search);
		Page<AccontDto> dtos = listAcc.map(new Function<Account, AccontDto>() {

			@Override
			public AccontDto apply(Account account) {
				// TODO Auto-generated method stub
				AccontDto dto = new AccontDto(account.getId(), account.getEmail(), account.getUsername(),
						account.getFullname(), account.getDepartment().getName(), account.getPosition().getName(),
						account.getCreateDate());
				return dto;
			}
		});

		return new ResponseEntity<>(dtos, HttpStatus.OK);
	}

	@GetMapping(value = "/{id}")
	public ResponseEntity<?> getAccountByID(@PathVariable(name = "id") Integer id) {
		Account account = accService.getAccountByID(id);
		AccontDto dto = new AccontDto(account.getId(), account.getEmail(), account.getUsername(), account.getFullname(),
				account.getDepartment().getName(), account.getPosition().getName(), account.getCreateDate());
		return new ResponseEntity<AccontDto>(dto, HttpStatus.OK);
	}

//
	@PostMapping()
	public ResponseEntity<?> createDepartment(@RequestBody AccountFormForCreating form) {
		accService.createAccount(form);
		return new ResponseEntity<String>("Create successfully!", HttpStatus.CREATED);
	}

//
	@PutMapping(value = "/{id}")
	public ResponseEntity<?> updateDepartment(@PathVariable(name = "id") Integer id,
			@RequestBody AccountFormForUpdating form) {
		accService.updateAccount(id, form);
		return new ResponseEntity<String>("Update successfully!", HttpStatus.OK);
	}

	@DeleteMapping(value = "/{id}")
	public ResponseEntity<?> deleteAccount(@PathVariable(name = "id") Integer id) {
		accService.deleteAccount(id);
		return new ResponseEntity<String>("Delete successfully!", HttpStatus.OK);
	}

	@GetMapping(value = "/UsernameExists/{username}")
	public ResponseEntity<?> existsByName(@PathVariable(name = "username") String username) {

		return new ResponseEntity<>(accService.isAccountExistsByUsername(username), HttpStatus.OK);
	}

	@GetMapping(value = "/EmailExists/{email}")
	public ResponseEntity<?> existsByEmail(@PathVariable(name = "email") String email) {
		return new ResponseEntity<>(accService.isAccountExistsByEmail(email), HttpStatus.OK);
	}
}
