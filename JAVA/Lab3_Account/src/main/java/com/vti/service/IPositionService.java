package com.vti.service;

import java.util.List;

import com.vti.entity.Position;

public interface IPositionService {

	public List<Position> getAllPositions();

	public Position getPositionByID(short id);

//	public Position getPositionByName(String name);

//	public void createPosition(PositionFormForCreating form);
//
//	public void updatePosition(short id, PositionFormForUpdating form);
//
//	public void deletePosition(short id);

//	public boolean isPositionExistsByID(short id);
//
//	public boolean isPositionExistsByName(String name);

}
