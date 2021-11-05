package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.*;
import com.it.entity.Lab;
import com.it.util.Info;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.awt.*;
import java.util.HashMap;
import java.util.List;

@Controller
public class LabController extends BaseController {
	@Resource
    LabDAO labDAO;
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
	//后台标签列表
	@RequestMapping("admin/labList")
	public String labList(@RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum, HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("key", key);
        PageHelper.startPage(pageNum, 10);
		List<Lab> list = labDAO.selectAll(map);
        PageInfo<Lab> pageInfo = new PageInfo<Lab>(list);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("key", key);
		return "lablist";
	}

	//新增标签
	@RequestMapping("admin/labAdd")
	public String labAdd(Lab lab, HttpServletRequest request) {
        lab.setDelstatus("0");
		labDAO.add(lab);
		return "redirect:labList";
	}
	
    //删除标签
	@RequestMapping("admin/labDel")
	public String labDel(int id, HttpServletRequest request) {
        Lab lab = labDAO.findById(id);
        lab.setDelstatus("1");
        labDAO.update(lab);
		return "redirect:labList";
	}
	
	//ID查找标签
	@RequestMapping("admin/labShow")
	public String labShow(int id, HttpServletRequest request) {
		Lab lab = labDAO.findById(id);
		request.setAttribute("lab", lab);
		return "labedit";
	}
	
	//更新标签
	@RequestMapping("admin/labEdit")
	public String labEdit(Lab lab, HttpServletRequest request) {
		labDAO.update(lab);
		return "redirect:labList";
	}
	

}
