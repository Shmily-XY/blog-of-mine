package com.it.controller;

import com.it.dao.*;
import com.it.entity.*;
import com.it.util.Info;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Component
public class SaveObject {
    @Resource
    YqlinkDAO yqlinkDAO;
    @Resource
    BbstypeDAO bbstypeDAO;
    @Resource
    NewsDAO newsDAO;
    @Resource
    TzinfoDAO tzinfoDAO;
    @Resource
    MemberDAO memberDAO;
    @Resource
    TzhtinfoDAO tzhtinfoDAO;
    @Resource
    LabDAO labDAO;

    public void getYqlink(HttpServletRequest request){
        List<Yqlink> yqlist = yqlinkDAO.selectAll(null);
        request.setAttribute("yqlist",yqlist);
    }

    public void getCategory(HttpServletRequest request){
        HashMap ccc = new HashMap();
        HashMap ddd = new HashMap();
        ccc.put("fatherid","0");
        ddd.put("isfb","是");
        List<Bbstype> ctlist = bbstypeDAO.selectAll(ccc);
		for(Bbstype bbstype:ctlist){
		    ddd.put("fatherid",bbstype.getId());
			List<Bbstype> childlist = bbstypeDAO.selectAll(ddd);
			bbstype.setChildlist(childlist);
            ddd.put("fid",bbstype.getId());
            List<Tzinfo> ftypetzinfolist = tzinfoDAO.selectAll(ddd);
            bbstype.setFtypetzinfolist(ftypetzinfolist);


		}
        request.setAttribute("ctlist",ctlist);
    }

    public void getNews(HttpServletRequest request){
        List<News> newslist = newsDAO.selectAll(null);
        request.setAttribute("newslist",newslist);
    }


    public void getLablist(HttpServletRequest request){
        List<Lab> lablist = labDAO.selectAll(null);
        request.setAttribute("lablist",lablist);
    }

    //今日话题
    public void getNowTzinfo(HttpServletRequest request){
        HashMap zzz = new HashMap();
        HashMap jjj = new HashMap();
        zzz.put("savetime", Info.getDateStr().substring(0,10));
        zzz.put("isfb","是");
        List<Tzinfo> nowtzinfolist = tzinfoDAO.selectAll(zzz);
        for(Tzinfo tzinfo:nowtzinfolist){
            jjj.put("tzid",tzinfo.getId());
            List<Tzhtinfo> tzhtlist = tzhtinfoDAO.selectAll(jjj);
            for(Tzhtinfo tzhtinfo:tzhtlist){
                Member member = memberDAO.findById(tzhtinfo.getAuthor());
                tzhtinfo.setHtmember(member);
            }
            tzinfo.setTophtlist(tzhtlist);
        }
        request.setAttribute("nowtzinfolist",nowtzinfolist);
    }


    //回貼
    public void getTzinfoHt(HttpServletRequest request,String tzid){
        Member sessionmember = (Member)request.getSession().getAttribute("member");
        HashMap ccc = new HashMap();
        ccc.put("tzid",tzid);
        List<Tzhtinfo> tzhtlist = tzhtinfoDAO.selectAll(ccc);
        for(Tzhtinfo tzhtinfo:tzhtlist){
            Member member = memberDAO.findById(tzhtinfo.getAuthor());
            tzhtinfo.setHtmember(member);
        }
        request.setAttribute("tzhtlist",tzhtlist);
    }



    //排行
    public List<Tzinfo> getph(String phstr,HttpServletRequest request){
        HashMap iii = new HashMap();
        iii.put("ph", phstr);
        iii.put("shstatus", "通过");
        List<Tzinfo> list = tzinfoDAO.selectAll(iii);
        return list;
    }


}
