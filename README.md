## AutoRegion Django REST Framework

This website provides an API to search a vehicle registration plate region code from Postgres database. 
The API have two endpoints: `codes` and `code`. The first endpoint expects 3 GET parameters (country ID, code for search, land ID) 
and the second one expects only code ID as part of URL. See Usage section.\

The main database table looks like this:

| id  | code |   name    | orig_name |                        cities                        | country_id | lang_id |
| --- | --- | --- | --- | --- | --- | --- |
| 180 | ĐA   | Đakovica  |           | {Dečani,Đakovica}                                    |          1 |       2 |
| 181 | ZA   | Zaječar   |           | {Boljevac,Sokobanja,Zaječar}                         |          1 |       2 |
| 182 | ZR   | Zrenjanin |           | {Žitište,"Novi Bečej","Nova Crnja",Sečanj,Zrenjanin} |          1 |       2 |
| 183 | IN   | Inđija    |           | {Inđija}                                             |          1 |       2 |
| 184 | IC   | Ivanjica  |           | {Ivanjica}                                           |          1 |       2 |

And a typical response from the API is in json format:

```json
{
    "id": 388,
    "code": "TT",
    "name": "Тутин",
    "orig_name": "Tutin",
    "cities": [
        "Тутин"
    ],
    "country": 1,
    "lang": 3
}
```

For now it supports only serbian region codes (see [wiki](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Serbia)), 
both Latin and Cyrillic, and Serbian and Russian languages.

This API is used by AutoRegion Telegram bot. Source code is available [here](https://github.com/LuberLinder/telegram-autoregion-bot).

I use Docker to deploy a product version of this project to Digital Ocean VPS. See this cool [video tutorial](https://www.youtube.com/watch?v=3cRT1RmCyKg&t=1138s) by **Christian Kreuzberger**. 

## Usage

1. To find a region code you should make a GET request to `codes` endpoint:

```
http://209.97.149.9:3000/api/codes/?country_id=<COUNTRY_ID>&code=<CODE>&land_id<LANG_ID>
```

- COUNTRY_ID: for now only **1** is avaliable and default value. It's means Serbia.
- CODE: may be a full two-letter region code like ĐA, ZA, ZR..., or just first letter of the code: Đ, Z, I...\
  CODE may be both in upper and lower case, Latin and Cyrillic: đ, z, i... ђ, з, и...
- LANG_ID: **1** - for Serbian Cyrillic, **2** - for Serbian Latin, **3** - for Russian (default value).

For example, this will send the above json response back to you:

```
http://209.97.149.9:3000/api/codes/?code=tt
```

2. To get info about particulary region code you should make a request to `code` endpoint with the code ID:

```
http://209.97.149.9:3000/api/code/<CODE_ID>
```

For example, for Tutin town in Russian:

```
http://209.97.149.9:3000/api/code/388
```
