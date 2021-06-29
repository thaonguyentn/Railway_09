package com.vti.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vti.entity.Position;

import com.vti.repository.IPositionRepository;

@Service
public class PositionService implements IPositionService {

	@Autowired
	private IPositionRepository positionRepository;

	@Override
	public List<Position> getAllPositions() {
		// TODO Auto-generated method stub
		return positionRepository.findAll();
	}

	@Override
	public Position getPositionByID(short id) {
		// TODO Auto-generated method stub
		return positionRepository.findById(id).get();
	}

//	@Override
//	public void createPosition(PositionFormForCreating form) {
//		// TODO Auto-generated method stub
//		Position position = new Position(form.getName());
//
//		positionRepository.save(position);
//	}

//	@Override
//	public void updatePosition(short id, PositionFormForUpdating form) {
//		// TODO Auto-generated method stub
//		Position position = getPositionByID(id);
//		position.setName(form.getName());
//	}
//
//	@Override
//	public void deletePosition(short id) {
//		// TODO Auto-generated method stub
//		positionRepository.deleteById(id);
//	}

}
