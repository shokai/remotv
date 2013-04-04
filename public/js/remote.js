var io = new RocketIO().connect();

io.on("connect", function(){
  console.log("connect!! "+io.session);

  $("#btn_url").click(function(){
    var url = $("#url").val();
    console.log("go "+ url);
    io.push("go", {url: url});
  });

  $("#btn_up").click(function(){
    io.push("scroll", {y : -20});
  });
  $("#btn_down").click(function(){
    io.push("scroll", {y : 20});
  });
  $("#btn_left").click(function(){
    io.push("scroll", {x : -20});
  });
  $("#btn_right").click(function(){
    io.push("scroll", {x : 20});
  });
});

io.on("error", function(err){
  console.error(err);
});
