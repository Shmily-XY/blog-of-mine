package com.it.entity;


import java.util.List;

public class Photo {

    private int id;
    private String memberid;
    private String title;

    private List<Comment> commentlist;

    private List<Imgdetails> imgdetailslist;

    public List<Comment> getCommentlist() {
        return commentlist;
    }

    public void setCommentlist(List<Comment> commentlist) {
        this.commentlist = commentlist;
    }

    public List<Imgdetails> getImgdetailslist() {
        return imgdetailslist;
    }

    public void setImgdetailslist(List<Imgdetails> imgdetailslist) {
        this.imgdetailslist = imgdetailslist;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}
