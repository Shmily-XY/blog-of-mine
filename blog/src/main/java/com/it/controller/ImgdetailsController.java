package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.*;
import com.it.entity.Imgdetails;
import com.it.entity.Photo;
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
public class ImgdetailsController extends BaseController {
	@Resource
    ImgdetailsDAO imgdetailsDAO;
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
    @Resource
    PhotoDAO photoDAO;




	//后台相册详情列表
	@RequestMapping("imgdetailsList")
	public String imgdetailsList(@RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum, HttpServletRequest request) {
        String photoid = request.getParameter("photoid");
        HashMap map = new HashMap();
        map.put("photoid", photoid);
        PageHelper.startPage(pageNum, 10);
		List<Imgdetails> list = imgdetailsDAO.selectAll(map);
        PageInfo<Imgdetails> pageInfo = new PageInfo<Imgdetails>(list);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("photoid", photoid);
        Photo photo = photoDAO.findById(Integer.parseInt(photoid));
        request.setAttribute("photo", photo);
		return "imgdetailslist";
	}

	//新增相册详情
    @ResponseBody
	@RequestMapping("imgdetailsAdd")
	public void imgdetailsAdd(Imgdetails imgdetails, HttpServletRequest request) {
		imgdetailsDAO.add(imgdetails);
	}
	
    //删除相册详情
	@RequestMapping("imgdetailsDel")
	public String imgdetailsDel(int id, String photoid,HttpServletRequest request) {
		imgdetailsDAO.delete(id);
        System.err.println("------------------------------------------------------"+photoid);
		return "redirect:imgdetailsList?photoid="+photoid;
	}


}
