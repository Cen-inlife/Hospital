
layui.use(['form','jquery','table','laydate'],function () {
    var layer=layui.layer;
    var $=layui.jquery;
    var form=layui.form;
    var table=layui.table;
    var laydate=layui.laydate;  //时间选择控件
    var nowTime=new Date().valueOf();//valueOf() 方法返回 Date 对象的原始值 如：1576645321921
    var max=null;


    table.render({
        id:'doctorResList',
        elem:'#doctorResList',
        url:ctx+ "/reservation/getDoctorResList",
        limit:10,
        limits:[10,20,30,40],
        cols:[[
            {field:'res_id',title:'预约编号',align:'center',width:150},
            {field:'photo_path',title:'医生头像',align:'center',width:180,templet:'#imgtmp'},
            {field:'realname',title:'患者姓名',align:'center',width:110,templet: '<div>{{d.user.realname}}</div>'},
            {field:'levelId',title:'级别',align:'center',width:120,templet:'#levelId'},
            {field:'gender',title:'性别',align:'center',width:120,templet:'#sexTpl'},
            {field:'order_time',title:'预约时间',align:'center',width:160,
                templet:'<div>{{ formatTime(d.order_time,"yyyy-MM-dd hh:mm:ss")}}</div>'},
            {title:'接诊',align:'center',width:180,toolbar:"#barDemo"}  //注意！！！！
            // 宽度设置大一点 否则 删除图标显示不出来 然后会出现下拉符号 显示
            // 删除符号 但此时点击就不会有效果了 所以windth设大一点 都显示出来
        ]],
        page:true,
        loading:true

    });





    table.on('tool(doctorResList)',function (obj) {
        var data=obj.data;
        if(obj.event==='accept')
        {
            layer.confirm('确定要接诊'+data.user.realname+'预约么？',function (index) {
                $.ajax({
                    url:ctx+"/reservation/acceptRes",
                    type:"POST",
                    data:{"res_id":data.res_id},
                    success:function (d) {
                        if(d.code==0)
                        {
                            layer.msg("已成功接诊",{icon:1});
                            table.reload('doctorResList'); //重新加载表格

                        }
                        else
                        {
                            layer.msg("权限不足，接诊失败",{icon:5});
                        }
                    },
                    error:function () {
                        layer.msg("接诊失败，检查sql及输出",{icon:5});
                    }
                })


                layer.close(index);
            });
        }
    })
});

// 格式化时间
function formatTime(datetime, fmt) {
    if (datetime == null || datetime == 0) {
        return "";
    }
    if (parseInt(datetime) == datetime) {
        if (datetime.length == 10) {
            datetime = parseInt(datetime) * 1000;
        } else if (datetime.length == 13) {
            datetime = parseInt(datetime);
        }
    }
    datetime = new Date(datetime);
    var o = {
        "M+" : datetime.getMonth() + 1, // 月份
        "d+" : datetime.getDate(), // 日
        "h+" : datetime.getHours(), // 小时
        "m+" : datetime.getMinutes(), // 分
        "s+" : datetime.getSeconds(), // 秒
        "q+" : Math.floor((datetime.getMonth() + 3) / 3), // 季度
        "S" : datetime.getMilliseconds()
        // 毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (datetime.getFullYear() + "")
            .substr(4 - RegExp.$1.length));
    for ( var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1,
                (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
                    .substr(("" + o[k]).length)));
    return fmt;
}
