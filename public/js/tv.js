var io = new RocketIO({channel: channel}).connect();
var tv = null;

$(function(){
  tv = new XFrame("div#tv");
});

io.on("connect", function(){
  console.log("connect!! "+io.session);
});

io.on("error", function(err){
  console.error(err);
});

io.on("go", function(data){
  console.log("load "+data.url);
  tv.load(data.url)
});

io.on("scroll", function(data){
  if(data.y) tv.scrollY(data.y);
  if(data.x) tv.scrollX(data.x);
});
