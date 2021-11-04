package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.*;
import com.it.entity.Comment;
import com.it.entity.Member;
import com.it.entity.Photo;
import com.it.util.Info;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

@Controller
public class CommentController extends BaseController {
    @Resource
    CommentDAO commentDAO;
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

    //后台留言列表
    @RequestMapping("commentList")
    public String commentList(@RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum, HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("key", key);
        PageHelper.startPage(pageNum, 10);
        List<Comment> list = commentDAO.selectAll(map);
        for (Comment comment : list) {
            Member member = memberDAO.findById(Integer.parseInt(comment.getMemberid()));
            comment.setMember(member);
        }
        PageInfo<Comment> pageInfo = new PageInfo<Comment>(list);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("key", key);
        return "commentlist";
    }

    //新增留言
    @ResponseBody
    @RequestMapping("commentAdd")
    public HashMap<String, Object> commentAdd(HttpServletRequest request, HttpServletResponse response) {
        HashMap<String, Object> res = new HashMap<String, Object>();
        Member member = (Member) request.getSession().getAttribute("member");
        String photoid = request.getParameter("photoid");
        String content = request.getParameter("content");
        Photo photo = photoDAO.findById(Integer.parseInt(photoid));
        if (Integer.parseInt(photo.getMemberid()) == member.getId()) {
            res.put("data", 400);
        } else {
            Comment comment = new Comment();
            comment.setContent(content);
            comment.setPhotoid(Integer.parseInt(photoid));
            comment.setMemberid(String.valueOf(member.getId()));
            comment.setSavetime(Info.getDateStr());
            commentDAO.add(comment);
            res.put("data", 200);
        }
        return res;
    }

    //删除留言
    @ResponseBody
    @RequestMapping("commentDel")
    public void commentDel(int id, HttpServletRequest request) {
        commentDAO.delete(id);
    }


}
