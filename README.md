# DayOff? API

休日かどうかを返すAPI.

## API


今日が休日かどうかを返す.

    GET /today

レスポンス例

    {"time":"2017-02-19T11:15:48.264+09:00","reason":"Sunday","day_off":true}



指定日時が休日かどうかを返す.(ただし、現時刻から1年前後のみ取得可能)

    GET /[:date]  # ex. GET /2017-02-14

レスポンス例

    {"time":"2017-02-14T00:00:00.000+09:00","reason":"","day_off":false}


