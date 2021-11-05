package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.*;
import com.it.entity.Imgadv;
import com.it.util.Info;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class ImgadvController extends BaseController {
	@Resource
    ImgadvDAO imgadvDAO;
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
	//后台焦点图列表
	@RequestMapping("admin/imgadvList")
	public String imgadvList(@RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum, HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("key", key);
        PageHelper.startPage(pageNum, 10);
		List<Imgadv> list = imgadvDAO.selectAll(map);
        PageInfo<Imgadv> pageInfo = new PageInfo<Imgadv>(list);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("key", key);
		return "imgadvlist";
	}

	//新增焦点图
	@RequestMapping("admin/imgadvAdd")
	public String imgadvAdd(Imgadv imgadv, HttpServletRequest request) {
		imgadvDAO.add(imgadv);
		return "redirect:imgadvList";
	}
	
    //删除焦点图
	@RequestMapping("admin/imgadvDel")
	public String imgadvDel(int id, HttpServletRequest request) {
		imgadvDAO.delete(id);
		return "redirect:imgadvList";
	}


    //ID查找焦点图
    @RequestMapping("admin/imgadvShow")
    public String imgadvShow(int id, HttpServletRequest request) {
        Imgadv imgadv = imgadvDAO.findById(id);
        request.setAttribute("imgadv", imgadv);
        return "imgadvedit";
    }

    //更新焦点图
    @RequestMapping("admin/imgadvEdit")
    public String imgadvDel(Imgadv imgadv, HttpServletRequest request) {
        imgadvDAO.update(imgadv);
        return "redirect:imgadvList";
    }

}
