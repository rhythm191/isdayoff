# DayOff? API

休日かどうかを返すAPI.

https://dayoff.herokuapp.com

## API


* 今日が休日かどうかを返す.


    GET /today[?country=:country]

レスポンス例

    # GET /today
    {"time":"2017-02-25T10:12:57.564+09:00","country":"japanese","reason":"土曜日","day_off":true}
     
    # GET /today?country=usa
    {"time":"2017-02-25T10:16:30.141+09:00","country":"usa","reason":"土曜日","day_off":true}


* 指定日時が休日かどうかを返す.(ただし、現時刻から1年前後のみ取得可能)


    GET /:date[?country=:country]  # ex. GET /2017-02-14

レスポンス例

    # GET /2017-02-14
    {"time":"2017-02-14T00:00:00.000+09:00","country":"japanese","reason":"","day_off":false}



* 利用できる国とロケールの情報を返す.


    GET /countries
