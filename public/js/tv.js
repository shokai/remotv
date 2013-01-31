var io = new CometIO().connect();

io.on("connect", function(session){
  console.log("connect!! "+session);
});

io.on("error", function(err){
  console.error(err);
});

io.on("go", function(data){
  $("iframe#tv").attr("src", data.url);
});
