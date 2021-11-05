package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.*;
import com.it.entity.Music;
import com.it.util.Info;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class MusicController extends BaseController {
	@Resource
    MusicDAO musicDAO;
	@Resource
    MemberDAO memberDAO;
	@Resource
    BbstypeDAO bbstypeDAO;
	@Resource
    YqlinkDAO yqlinkDAO;
	@Resource
    TzinfoDAO tzinfoDAO;
    @Resource
    SaveObject saveObject;
	//后台音乐列表
	@RequestMapping("admin/musicList")
	public String musicList(@RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum, HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("key", key);
        PageHelper.startPage(pageNum, 10);
		List<Music> list = musicDAO.selectAll(map);
        PageInfo<Music> pageInfo = new PageInfo<Music>(list);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("key", key);
		return "musiclist";
	}

	//新增音乐
	@RequestMapping("admin/musicAdd")
	public String musicAdd(Music music, HttpServletRequest request) {
		musicDAO.add(music);
		return "redirect:musicList";
	}
	
    //删除音乐
	@RequestMapping("admin/musicDel")
	public String musicDel(int id, HttpServletRequest request) {
		musicDAO.delete(id);
		return "redirect:musicList";
	}
	
	//ID查找音乐
	@RequestMapping("admin/musicShow")
	public String musicShow(int id, HttpServletRequest request) {
        Music music = musicDAO.findById(id);
		request.setAttribute("music", music);
		return "musicedit";
	}
	
	//更新音乐
	@RequestMapping("admin/musicEdit")
	public String musicDel(Music music, HttpServletRequest request) {
		musicDAO.update(music);
		return "redirect:musicList";
	}
	

	//首页随机音乐
    @ResponseBody
    @RequestMapping("randommusic")
    public HashMap<String,Object> randommusic(HttpServletRequest request) {
        HashMap<String,Object> res = new HashMap<String,Object>();
        List<Music> list = musicDAO.selectRandom();
        if(list.size()!=0){
            Music music = list.get(0);
            res.put("music", music);
            res.put("data", 200);
        }else{
            res.put("data", 400);
        }
        return res;
    }

}
