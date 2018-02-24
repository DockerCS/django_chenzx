/**
 * Created by chenzhixiang on 2017/9/21.
 */

//设置凸显选中的博客分类
$(function(){
    $(".category-list li a").click(function(){
        $(this).parent().addClass("current");
        $(this).parent().siblings().removeClass("current");
    });
});

//设置凸显当前页码
$(".page li a").each(function(){
    //首页中
    if($(this).text()=="{{ article_list.number }}"){
        $(this).parent().addClass("active");
    }
    //博客分类页面中
    if($(this).text() == "{{ article_category_list.number }}"){
        $(this).parent().addClass("active");
    }
});

//页码跳转处理
function page_goto(page){
    var page = $("#page_goto input")[0].value;
    window.location.href = '?page=' + page;  //重定向
    return false;
}

// 点赞
$('.likebtn').click(function(){
    var like_type = $(this).attr('data-type');
    var like_id = $(this).attr('data-id');
    add_like($(this), like_type, like_id);
});
function add_like(current_elem, like_type, like_id){
    $.ajax({
        cache: false,
        type: 'POST',
        url: '/tools/favorite/',
        data: {'like_type':like_type, 'like_id':like_id},
        dataType: 'json',
        async: true,
        beforeSend: function(xhr, settings){
            xhr.setRequestHeader("X-CSRFToken", "{{ csrf_token }}");
        },
        success: function(data) {
            if(data.status == "fail"){
                if(data.msg == "用户未登录"){
                    alert("请您登陆后再点赞吧！")
                }else{
                    alert(data.msg)
                }
            }else if(data.status == "success"){
                if(data.msg == "您已取消点赞"){
                    current_elem.text(data.like_num);
                    alert(data.msg)
                }else if(data.msg == "您已点赞"){
                    current_elem.text(data.like_num);
                    alert(data.msg)
                }
            }
        },
    });
}