var io = new CometIO().connect();
var tv = null;

$(function(){
  tv = new XFrame("div#tv");
});

io.on("connect", function(session){
  console.log("connect!! "+session);
});

io.on("error", function(err){
  console.error(err);
});

io.on("go", function(data){
  console.log("load "+data.url);
  tv.load(data.url)
});

io.on("scroll", function(data){
  console.log(data);
});
