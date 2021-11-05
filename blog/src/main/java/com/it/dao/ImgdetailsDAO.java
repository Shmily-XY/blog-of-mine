package com.it.dao;


import com.it.entity.Imgdetails;

import java.util.HashMap;
import java.util.List;

public interface ImgdetailsDAO {
	List<Imgdetails> selectAll(HashMap map);
	void add(Imgdetails imgdetails);
	void delete(int id);
}
