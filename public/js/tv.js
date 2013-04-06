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
  tv.left = data.left || 0;
  tv.top = data.top || 0;
});

io.on("scroll_left", function(left){
  tv.left = left;
});

io.on("scroll_top", function(top){
  tv.top = top;
});
