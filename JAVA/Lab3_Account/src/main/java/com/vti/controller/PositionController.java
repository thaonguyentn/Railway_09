package com.vti.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vti.entity.Position;
import com.vti.service.IPositionService;

@RestController
@RequestMapping(value = "api/v1/positions")
@CrossOrigin("*")
public class PositionController {
	
	@Autowired
	private IPositionService service;

	@GetMapping()
	public ResponseEntity<?> getAllPositions() {
		List<Position> listPos = service.getAllPositions();
		return new ResponseEntity<>(listPos, HttpStatus.OK);
	}

	@GetMapping(value = "/{id}")
	public ResponseEntity<?> getPositionByID(@PathVariable(name = "id") short id) {
		return new ResponseEntity<Position>(service.getPositionByID(id), HttpStatus.OK);
	}

}
