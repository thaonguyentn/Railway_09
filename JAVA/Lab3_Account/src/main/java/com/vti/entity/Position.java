package com.vti.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.vti.enumurate.PositionName;
import com.vti.enumurate.PositionNameConvert;

@Entity
@Table(name = "Position")
public class Position implements Serializable {

	private static final long serialVersionUID = 1L;
	@Column(name = "PositionID")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private short id;

	@Column(name = "PositionName", nullable = false, unique = true)
	@Convert(converter = PositionNameConvert.class)
	private PositionName name;

	@OneToMany(mappedBy = "position")
	private List<Account> accounts;

	public PositionName getName() {
		return name;
	}

	public void setName(PositionName name) {
		this.name = name;
	}

	public short getId() {
		return id;
	}

	public Position() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Position(short id, PositionName name) {
		super();
		this.id = id;
		this.name = name;
	};

}
