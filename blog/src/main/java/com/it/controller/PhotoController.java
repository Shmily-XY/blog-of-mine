package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.*;
import com.it.entity.Imgdetails;
import com.it.entity.Member;
import com.it.entity.Photo;
import com.it.util.Info;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class PhotoController extends BaseController {
	@Resource
    PhotoDAO photoDAO;
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
    ImgdetailsDAO imgdetailsDAO;

	//后台相册详情列表
	@RequestMapping("photoList")
	public String photoList(@RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum, HttpServletRequest request) {
        Member member = (Member)request.getSession().getAttribute("member");
        if(member!=null) {
            HashMap map = new HashMap();
            map.put("memberid", member.getId());
            List<Photo> list = photoDAO.selectAll(map);
            for (Photo photo : list) {
                HashMap ppp = new HashMap();
                ppp.put("photoid", photo.getId());
                List<Imgdetails> imgdetailslist = imgdetailsDAO.selectAll(ppp);
                photo.setImgdetailslist(imgdetailslist);
            }
            request.setAttribute("list", list);
            return "photolist";
        }else{
            return "login";
        }
	}

    @RequestMapping("tophotoadd")
    public String tophotoadd(HttpServletRequest request) {
        return "photoadd";
    }

	//新增相册详情
	@RequestMapping("photoAdd")
	public String photoAdd(Photo photo, HttpServletRequest request) {
        Member member = (Member)request.getSession().getAttribute("member");
        photo.setMemberid(String.valueOf(member.getId()));
		photoDAO.add(photo);
		return "redirect:photoList";
	}
	
    //删除相册详情
	@RequestMapping("photoDel")
	public String photoDel(int id, HttpServletRequest request) {
		photoDAO.delete(id);
		return "redirect:photoList";
	}
	
	//ID查找相册详情
	@RequestMapping("photoShow")
	public String photoShow(int id, HttpServletRequest request) {
		Photo photo = photoDAO.findById(id);
		request.setAttribute("photo", photo);
		return "photoedit";
	}
	
	//更新相册详情
	@RequestMapping("photoEdit")
	public String photoDel(Photo photo, HttpServletRequest request) {
		photoDAO.update(photo);
		return "redirect:photoList";
	}
	


}
