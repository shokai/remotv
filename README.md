RemoTV
======

* http://remotv.herokuapp.com/
* https://github.com/shokai/remotv


Install Dependencies
--------------------
Ruby 1.8.7+ or 1.9.2+ required.

    % gem install bundler foreman
    % bundle install


Run
---

    % foreman start

=> http://localhost:5000


options

    % rackup config.ru -p 5000
    % WS_PORT=18080 rackup config.ru -p 5000
    % WS=disable rackup config.ru -p 5000


Deploy
------

    % heroku create --stack cedar
    % git push heroku master
    % heroku open

disable websocket

    % heroku config:set WS=disable

set cache expire (sec)

    % heroku config:set CACHE_EXPIRE=3600

restart

    % heroku restart