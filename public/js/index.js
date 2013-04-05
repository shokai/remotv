$(function(){
  $("#btn_create_tv").click(function(){
    var channel = $("#channel_id").val();
    if(channel.length < 1) return;
    var url = app_root+"/tv/"+channel;
    location.href = url;
  });

  $("#btn_create_remote").click(function(){
    var channel = $("#channel_id").val();
    if(channel.length < 1) return;
    var url = app_root+"/remote/"+channel;
    location.href = url;
  });
});
