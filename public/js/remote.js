var io = new RocketIO({channel: channel}).connect();

io.on("connect", function(){
  console.log("connect!! "+io.session);
});

$(function(){
  $("#btn_url").click(function(){
    var url = $("#url").val();
    console.log("go "+ url);
    io.push("go", url);
  });

  $("#btn_up").click(function(){
    io.push("scroll_y", -20);
  });
  $("#btn_down").click(function(){
    io.push("scroll_y", 20);
  });
  $("#btn_left").click(function(){
    io.push("scroll_x", -20);
  });
  $("#btn_right").click(function(){
    io.push("scroll_x", 20);
  });
});

io.on("error", function(err){
  console.error(err);
});
