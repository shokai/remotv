var io = new CometIO().connect();

io.on("connect", function(session){
  console.log("connect!! "+session);

  $("#btn_url").click(function(){
    var url = $("#url").val();
    console.log("go "+ url);
    io.push("go", {url: url});
  });
});

io.on("error", function(err){
  console.error(err);
});
