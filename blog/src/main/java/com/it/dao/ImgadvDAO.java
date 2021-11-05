package com.it.dao;

import com.it.entity.Imgadv;
import com.it.entity.News;

import java.util.HashMap;
import java.util.List;

public interface ImgadvDAO {
	List<Imgadv> selectAll(HashMap map);
	void add(Imgadv imgadv);
	void delete(int id);
    Imgadv findById(int id);
    void update(Imgadv imgadv);
}
