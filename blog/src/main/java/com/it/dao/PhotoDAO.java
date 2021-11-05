package com.it.dao;

import com.it.entity.Photo;

import java.util.HashMap;
import java.util.List;

public interface PhotoDAO {
	List<Photo> selectAll(HashMap map);
	void add(Photo photo);
	void delete(int id);
    Photo findById(int id);
	void update(Photo photo);
}
