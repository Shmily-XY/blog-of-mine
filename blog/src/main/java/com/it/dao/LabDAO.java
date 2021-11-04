package com.it.dao;

import com.it.entity.Lab;

import java.util.HashMap;
import java.util.List;

public interface LabDAO {
	List<Lab> selectAll(HashMap map);
	void add(Lab lab);
	void delete(int id);
    Lab findById(int id);
	void update(Lab lab);
}
