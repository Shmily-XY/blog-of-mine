package com.it.controller;

import javax.annotation.Resource;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import com.it.dao.FansDAO;
import com.it.dao.MemberDAO;
import com.it.entity.Fans;
import com.it.entity.Member;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import java.util.*;

@Controller
public class FansController extends BaseController {
	@Resource
    FansDAO fansDAO;
	@Resource
    MemberDAO memberDAO;
	
	//关注
	@RequestMapping("fansAdd")
	public void fansAdd(HttpServletRequest request,HttpServletResponse response){
		try {
			String memberid = request.getParameter("memberid");
			String gzmemberid = request.getParameter("gzmemberid");
			Fans fans = new Fans();
			fans.setMemberid(Integer.parseInt(memberid));
			fans.setGzmemberid(Integer.parseInt(gzmemberid));
			fansDAO.add(fans);
			PrintWriter out = response.getWriter();
			out.print(0);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//取消关注
	@RequestMapping("fansDel")
	public void fansDel(HttpServletRequest request,HttpServletResponse response){
		try {
			String memberid = request.getParameter("memberid");
			String gzmemberid = request.getParameter("gzmemberid");
			HashMap<String,String> map = new HashMap<String, String>();
			map.put("memberid", memberid);
			map.put("gzmemberid", gzmemberid);
			Fans onefans = fansDAO.selectOne(map).get(0);
			fansDAO.delete(onefans);
			PrintWriter out = response.getWriter();
			out.print(0);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//我的关注
	@RequestMapping("myFollow")
	public String myFollow(HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("member");
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Fans> list = fansDAO.selectMyFans(member.getId());
		for(Fans fans:list){
			Member gzmember = memberDAO.findById(fans.getGzmemberid());
			fans.setGzmember(gzmember);
		}
		request.setAttribute("list", list);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "myfollow";
	}
	
	//取消关注
	@RequestMapping("fsDel")
	public void fsDel(int id, HttpServletRequest request,HttpServletResponse response){
		try {
			fansDAO.deleteFs(id);
			PrintWriter out = response.getWriter();
			out.print(0);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
