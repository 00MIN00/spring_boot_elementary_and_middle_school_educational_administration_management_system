package com.ssm1.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//分页的模型数据
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageModel {
    //每一页显示数据记录多少条
    private int pageSize=3;
    //当前页面的页码
    private int pageNum;
    //总页数
    private int pages;
    //总记录条数
    private int total;
    //上一页
    private int prePage;
    //下一页
    private int nextPage;
    //sql语句查询的起始位置
    private int startIndex;

//    // 0  2  4
//    // 第一页 每页显示多少条记录 每页显示  2 条数据  limit  0,2
//    // 第二页 每页显示多少条记录 每页显示  2 条数据  limit  2,2
//    // 第三页 每页显示多少条记录 每页显示  2 条数据  limit  4,2
    //总页数    总记录数/每页显示的记录条数 (7+3-1)/3=3
    public int getPages() {

        return (total+pageSize-1)/pageSize;
    }
//    //上一页
    public int getPrePage() {
        int pre=this.pageNum-1;
        if (pre<=0){
            return 1;
        }
        return pre;
    }
    //下一页
    public int getNextPage() {
        int next=this.pageNum+1;
        //如果next超出总页数，则就要赋值为总页数
        if (next>this.getPages()){
            return this.getPages();
        }
        return next;
    }
    //起始位置    0   3    6
    public int getStartIndex() {
        int item=(pageNum-1)*pageSize;
        return item;
    }

    //构造器   跳转当前页码、总记录数
    public PageModel(int pageNum, int total) {
        //操作合理化
        this.total=total;
        //如果输入的页码是大于总页数，就要进行赋值为总页数
        if (pageNum > this.getPages()) {
            this.pageNum=this.getPages();
        }//如果输入的页码是小于总页数，就要进行赋值为 1
        else if (pageNum <= 0) {
            this.pageNum=1;
        }//合理情况
        else {
            this.pageNum = pageNum;
        }

    }
}
