//修改个人中心邮箱验证码
function sendCodeChangeEmail($btn){
    var verify = verifyDialogSubmit(
        [
          {id: '#jsChangeEmail', tips: Dml.Msg.epMail, errorTips: Dml.Msg.erMail, regName: 'email', require: true}
        ]
    );
    if(!verify){
       return;
    }
    $.ajax({
        cache: false,
        type: "get",
        dataType:'json',
        url:"/user/sendemailcode/",
        data:$('#jsChangeEmailForm').serialize(),
        async: true,
        beforeSend:function(XMLHttpRequest){
            $btn.val("发送中...");
            $btn.attr('disabled',true);
        },
        success: function(data){
            if(data.email){
                Dml.fun.showValidateError($('#jsChangeEmail'), data.email);
            }else if(data.status == 'success'){
                Dml.fun.showErrorTips($('#jsChangeEmailTips'), "邮箱验证码已发送");
            }else if(data.status == 'fail'){
                 Dml.fun.showValidateError($('#jsChangeEmail'), "邮箱验证码发送失败");
            }else if(data.status == 'success'){
            }
        },
        complete: function(XMLHttpRequest){
            $btn.val("获取验证码");
            $btn.removeAttr("disabled");
        }
    });
}
//个人资料邮箱修改
function changeEmailSubmit($btn){
    var verify = verifyDialogSubmit(
        [
          {id: '#jsChangeEmail', tips: Dml.Msg.epMail, errorTips: Dml.Msg.erMail, regName: 'email', require: true},
        ]
    );
    if(!verify){
       return;
    }
    $.ajax({
        cache: false,
        type: 'post',
        dataType:'json',
        url:"/user/resetemail/",
        data:$('#jsChangeEmailForm').serialize(),
        async: true,
        beforeSend:function(XMLHttpRequest){
            $btn.val("发送中...");
            $btn.attr('disabled',true);
            $("#jsChangeEmailTips").html("验证中...").show(500);
        },
        success: function(data) {
            if(data.email){
                Dml.fun.showValidateError($('#jsChangeEmail'), data.email);
            }else if(data.status == "success"){
                Dml.fun.showErrorTips($('#jsChangePhoneTips'), "邮箱信息更新成功");
                setTimeout(function(){location.reload();},2500);
            }else{
                 Dml.fun.showValidateError($('#jsChangeEmail'), "邮箱信息更新失败");
            }
        },
        complete: function(XMLHttpRequest){
            $btn.val("完成");
            $btn.removeAttr("disabled");
        }
    });
}

$(function(){
    //个人资料修改密码
    $('#jsUserResetPwd').on('click', function(){
        Dml.fun.showDialog('#jsResetDialog', '#jsResetPwdTips');
    });

    $('#jsResetPwdBtn').click(function(){
        $.ajax({
            cache: false,
            type: "POST",
            dataType:'json',
            url:"/user/modifypwd/",
            data:$('#jsResetPwdForm').serialize(),
            async: true,
            success: function(data) {
                if(data.password1){
                    Dml.fun.showValidateError($("#pwd"), data.password1);
                }else if(data.password2){
                    Dml.fun.showValidateError($("#repwd"), data.password2);
                }else if(data.status == "success"){
                    Dml.fun.showTipsDialog({
                        title:'提交成功',
                        h2:'修改密码成功，请重新登录!',
                    });
                    Dml.fun.winReload();
                }else if(data.msg){
                    Dml.fun.showValidateError($("#pwd"), data.msg);
                    Dml.fun.showValidateError($("#repwd"), data.msg);
                }
            }
        });
    });

    //个人资料头像
    $('.js-img-up').uploadPreview({ Img: ".js-img-show", Width: 94, Height: 94 ,Callback:function(){
        $('#jsAvatarForm').submit();
        setTimeout(function(){window.location.href = window.location.href;},3000);
    }});


    $('.changeemai_btn').click(function(){
        Dml.fun.showDialog('#jsChangeEmailDialog', '#jsChangePhoneTips' ,'jsChangeEmailTips');
    });
    $('#jsChangeEmailCodeBtn').on('click', function(){
        sendCodeChangeEmail($(this));
    });
    $('#jsChangeEmailBtn').on('click', function(){
        changeEmailSubmit($(this));
    });


    //input获得焦点样式
    $('.perinform input[type=text]').focus(function(){
        $(this).parent('li').addClass('focus');
    });
    $('.perinform input[type=text]').blur(function(){
        $(this).parent('li').removeClass('focus');
    });

    laydate({
        elem: '#birthday',
        format: 'YYYY-MM-DD',
        max: laydate.now()
    });

    verify(
        [
            {id: '#nickname', tips: Dml.Msg.epNickName, require: true}
        ]
    );
    //保存个人资料
    $('#jsEditUserBtn').on('click', function(){
        var _self = $(this),
            $jsEditUserForm = $('#jsEditUserForm');
        verify = verifySubmit(
            [
                {id: '#nickname', tips: Dml.Msg.epNickName, require: true},
                {id: '#address', tips: Dml.Msg.epAddress, require: true}
            ]
        );
        if(!verify){
           return;
        }
        $.ajax({
            cache: false,
            type: 'post',
            dataType:'json',
            url:"/user/userinfo/",
            data:$jsEditUserForm.serialize(),
            async: true,
            beforeSend:function(XMLHttpRequest){
                _self.val("保存中...");
                _self.attr('disabled',true);
            },
            success: function(data) {
                if(data.nickname){
                    _showValidateError($('#nickname'), data.nickname);
                }else if(data.birthday){
                   _showValidateError($('#birthday'), data.birthday);
                }else if(data.address){
                   _showValidateError($('#address'), data.address);
                }else if(data.status == "fail"){
                    //  Dml.fun.showTipsDialog({
                    //     title: '保存失败',
                    //     h2: '该昵称已经被使用，请更换一个！'
                    // });
                    _showValidateError($('#nickname'), '该昵称已经被使用！');
                    // setTimeout(function(){window.location.href = window.location.href;},1500);
                }else if(data.status == "success"){
                    Dml.fun.showTipsDialog({
                        title: '保存成功',
                        h2: '个人信息修改成功！'
                    });
                    setTimeout(function(){window.location.href = window.location.href;},1500);
                }
            },
            complete: function(XMLHttpRequest){
                _self.val("保存");
                _self.removeAttr("disabled");
            }
        });
    });
});

// 用户登录注册、忘记密码发送邮件
$(function(){
    // 用户登录
    $('#jslogin').click(function(){
        $.ajax({
            cache: false,
            type: "POST",
            dataType:'json',
            url:"/user/login/",
            data:$('#jsloginform').serialize(),
            async: true,
            beforeSend:function(XMLHttpRequest){
                $btn.val("发送中...");
                $btn.attr('disabled',true);
                $("#jsChangeEmailTips").html("验证中...").show(500);
            },
            success: function(json, textStatus){
                var is_success = json['success'];
                if(is_success){


                    //跳转回原来的页面
                    var reback_url = $('#reback_url').val();
                    if(!reback_url){reback_url='/';}
                    window.location.href = reback_url;
                }else{
                    tip.text('邮箱或者密码错误，请重试');
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                tip.text("登录出错，请重试 "+errorThrown);
            }
        });
        return false;
    });
});
