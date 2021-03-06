<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.jeecgframework.core.util.SysThemesUtil,org.jeecgframework.core.enums.SysThemesEnum"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=640, user-scalable=no">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-title" content="">
    <title>录音test</title>
    <style type="text/css">
        @charset "utf-8";
        *{ margin:0px; padding:0px; box-sizing:border-box; -webkit-tap-highlight-color:rgba(0,0,0,0);}
        html{ max-width:640px; margin:0 auto;}
        body{ font-family:"PingFangSC-Regular","sans-serif","STHeitiSC-Light","微软雅黑","Microsoft YaHei"; font-size:24px; line-height:1.5em; color:#000;
            -webkit-user-select:none; user-select:none;
            -webkit-touch-callout:none; touch-callout:none;
        }

        .start_btn , .play_btn , .send_btn{ width:250px; height:60px; line-height:60px; margin:20px auto; text-align:center; border:#eee solid 2px; cursor:pointer;}
        .start_btn_in , .stop_btn{ color:#f00; border:#f00 solid 2px;}
    </style>

</head>
<body style="overflow-y: hidden;overflow-x: hidden">
<div class="start_btn">按住不放即可录音</div>

<div class="play_btn">点我播放</div>

<div class="send_btn">点我保存</div>

<script type="text/javascript" src="${webRoot}/recordMp3/jquery.min.js"></script>
<script type="text/javascript" src="${webRoot}/recordMp3/jweixin-1.2.0.js"></script>

<script type="text/javascript">
    $(document).ready(
            function() {
                $.ajax({
                    debug: true,
                    url: "http://c11164f9.ngrok.io/jeewx/openDataController.do?getSignature1&weixinId=gh_eb138e69e668&url=http://c11164f9.ngrok.io/jeewx/openDataController.do?getSignature1&weixinId=gh_eb138e69e668",
                    type: 'post',
                    cache: false,
                    data: null,
                    success: function (data) {
                        wx.config({
                            debug: false,
                            appId: data.appId,
                            timestamp:data.timestamp,
                            nonceStr:data.nonceStr,
                            signature:data.signature,
                            jsApiList: ['onMenuShareTimeline','onMenuShareAppMessage','startRecord','stopRecord','onVoiceRecordEnd','playVoice','stopVoice','onVoicePlayEnd','uploadVoice']   // 必填，需要使用的JS接口列表
                        });

                    }
                });


                wx.ready(function() {
                    //返回音频的本地ID
                    var localId;
                    //返回音频的服务器端ID
                    var serverId;
                    //录音计时,小于指定秒数(minTime = 10)则设置用户未录音
                    var startTime, endTime, minTime = 2;
                    //***********************************//
                    //开始录音
                    $('.start_btn').on('touchstart', function (e) {
                        e.preventDefault();
                        var $this = $(this);
                        $this.addClass('start_btn_in');
                        startTime = new Date().getTime();
                        //开始录音
                        alert(0);
                        wx.startRecord({
                            success: function (res) {
                                alert(1);
                                localId = res.localId;
                                alert(localId);
                            },
                            fail: function (res) {
                                alert("开始录音失败:"+JSON.stringify(res));
                            }
                        });
                    });
                    //***********************************//
                    //停止录音接口
                    $('.start_btn').on('touchend', function () {
                        alert(2);
                        var $this = $(this);
                        $this.removeClass('start_btn_in');

                        //停止录音接口
                        wx.stopRecord({
                            success: function (res) {
                                alert(3);
                                localId = res.localId;
                                alert(localId);
                            },
                            fail: function (res) {
                                alert("停止录音接口失败:"+JSON.stringify(res));
                            }
                        });
                        alert(3);
                        endTime = new Date().getTime();
                        alert((endTime - startTime) / 1000);
                        if ((endTime - startTime) / 1000 < minTime) {
                            localId = '';
                            alert('录音少于' + minTime + '秒，录音失败，请重新录音');
                        }

                    });
                    //监听录音自动停止接口
                    wx.onVoiceRecordEnd({
                        //录音时间超过一分钟没有停止的时候会执行 complete 回调
                        complete: function (res) {
                            localId = res.localId;
                            alert("a:"+localId);
                            $('.start_btn').removeClass('start_btn_in');
                        }
                    });


                    //***********************************//


                    $('.play_btn').on('click', function () {
                        if (!localId) {
                            alert('您还未录音，请录音后再点击播放');
                            return;
                        }
                        var $this = $(this);
                        if ($this.hasClass('stop_btn')) {
                            $(this).removeClass('stop_btn').text('点我播放');

                            //      //暂停播放接口
                            //      wx.pauseVoice({
                            //          //需要暂停的音频的本地ID，由 stopRecord 或 onVoiceRecordEnd 接口获得
                            //          localId: localId
                            //      });

                            //停止播放接口
                            wx.stopVoice({
                                //需要停止的音频的本地ID，由 stopRecord 或 onVoiceRecordEnd 接口获得
                                localId: localId
                            });
                        } else {
                            $this.addClass('stop_btn').text('点我停止');

                            //播放语音接口
                            wx.playVoice({
                                //需要播放的音频的本地ID，由 stopRecord 或 onVoiceRecordEnd 接口获得
                                localId: localId
                            });
                        }
                    });
                    //监听语音播放完毕接口
                    wx.onVoicePlayEnd({
                        //需要下载的音频的服务器端ID，由uploadVoice接口获得
                        serverId: localId,
                        success: function (res) {
                            $('.play_btn').removeClass('stop_btn').text('点我播放');

                            //返回音频的本地ID
                            //localId = res.localId;
                        }
                    });


                    //***********************************//


                    //上传语音接口
                    $('.send_btn').on('click', function () {
                        if (!localId) {
                            alert('您还未录音，请录音后再保存');
                            return;
                        }

                        alert('上传语音,测试，并未提交保存');
                        return;

                        //上传语音接口
                        wx.uploadVoice({
                            //需要上传的音频的本地ID，由 stopRecord 或 onVoiceRecordEnd 接口获得
                            localId: localId,
                            //默认为1，显示进度提示
                            isShowProgressTips: 1,
                            success: function (res) {
                                //返回音频的服务器端ID
                                serverId = res.serverId;
                            }
                        });
                    });
                });
            }
    );



</script>
</body>

</html>