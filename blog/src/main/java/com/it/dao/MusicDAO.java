package com.it.dao;

import com.it.entity.Music;

import java.util.HashMap;
import java.util.List;

public interface MusicDAO {
	List<Music> selectAll(HashMap map);
	void add(Music music);
	void delete(int id);
    Music findById(int id);
	void update(Music music);
    List<Music> selectRandom();
}
