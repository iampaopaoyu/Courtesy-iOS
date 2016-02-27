# 礼记
礼记之谊，记礼之情。

## 简介
- 一个优雅的项目。
- 一个优雅的应用。
- 一个优雅的礼物二维码卡片分发平台。

## 描述
礼记是一个基于阿里公有云的腾讯互联轻应用。

## 协议 Protocol

### 通用 Common
POST /api/courtesy

- 通用成功 Common Succeed
```json
{
    "error": 0,
    "timestamp": 1456283003
}
```

- 错误的请求 Bad Request (e.g. Not POST)
```json
{
    "error": 400,
    "timestamp": 1456283003
}
```

- 无效的字段或格式 Invalid Field & Invalid Format (e.g. over-length)
```json
{
    "error": 401,
    "field": "email",
    "timestamp": 1456283003
}
```

- 缺少字段 Missing Field
```json
{
    "error": 402,
    "field": "account",
    "timestamp": 1456283003
}
```

- 无权限 Forbidden (e.g. not login)
```json
{
    "error": 403,
    "timestamp": 1456283003
}
```

- 未找到 Not Found (e.g. action not found)
```json
{
    "error": 404,
    "timestamp": 1456283003
}
```

- 服务器错误 Service Error (e.g. MYSQL error)
```json
{
    "error": 503,
    "timestamp": 1456283003
}
```

### 注册 Register
```json
{
    "action": "user_register",
    "account": {
        "email": "i.82@qq.com",
        "pwd": "5f4dcc3b5aa765d61d8327deb882cf99"
    },
    "version": 2
}
```

- 账户冲突 Conflict
```json
{
    "error": 405,
    "field": "email",
    "timestamp": 1456283003
}
```

### 登录 Login
```json
{
    "action": "user_login",
    "account": {
        "email": "i.82@me.com",
        "pwd": "5f4dcc3b5aa765d61d8327deb882cf99"
    },
    "version": 2
}
```

- 认证失败 Account Not Found & Wrong Password
```json
{
    "error": 406,
    "timestamp": 1456283003
}
```

- 账户被禁用 Account Banned
```json
{
    "error": 407,
    "timestamp": 1456283003
}
```

- 登录成功 Login Succeed (SESSION in Cookie)

### 注销 Logout
```json
{
    "action": "user_logout",
    "version": 2
}
```

### 获取用户信息 Get User Info
```json
{
    "action": "user_info",
    "version": 2
}
```

- 获取成功 Succeed
```json
{
    "error": 0,
    "account_info": {
        "user_id": 1,
        "email": "i.82@me.com",
        "registered_at": 1456283003,
        "last_login_at": 1456283003,
        "card_count": 2,
        "has_profile": true,
        "profile": {
            "nick": "\u6211\u53eb i_82",
            "avatar": "\\static\\avatar\\aaca0f5eb4d2d98a6ce6dffa99f8254b_300.png",
            "mobile": "13270593207",
            "birthday": "1996-06-18",
            "gender": 1,
            "province": "\u6c5f\u82cf",
            "city": "\u5357\u4eac",
            "area": "\u9097\u6c5f\u533a",
            "introduction": ""
        }
    },
    "timestamp": 1456283003
}
```

### 修改用户信息 Edit Profile
```json
{
    "action": "user_edit_profile",
    "version": 2,
    "profile": {
        "nick": "\u6211\u53eb i_82",
        "avatar": "\\static\\avatar\\aaca0f5eb4d2d98a6ce6dffa99f8254b_300.png",
        "mobile": "13270593207",
        "birthday": "1996-06-18",
        "gender": 1,
        "province": "\u6c5f\u82cf",
        "city": "\u5357\u4eac",
        "area": "\u9097\u6c5f\u533a",
        "introduction": ""
    }
}
```

### 上传用户头像 Upload Avatar
POST /upload/avatar (Field: file)

- 尺寸不合要求 Size Dismatch
```json
{
    "error": 422,
    "timestamp": 1456283003
}
```

- 上传成功 Upload Succeed
```json
{
    "error": 0,
    "id": "59d632f13aef67deace793df18174dc0",
    "time": 1456503286
}
```
##主体业务逻辑

![flow](http://i11.tietuku.com/2a2298b1fb4a5f4c.png "flow")

### qr_query
```json
{
    "action":"qr_query",
    "qr_id":"xxxx",
}
```

- 成功 Succeed
```json
{
    "error": 0,
    "qr_info":json(QRInfo)
    "card_info":json(CardInfo) //if is_recorded
    "timestamp": 1456283003
}

```

json(QRInfo)
```json
{
    "is_recorded": false,
    "scan_count": 0,
    "created_at": 1456457567,
    "channel": 0,
    "recorded_at": [null],
    "card_token": null,
    "unique_id": "3a0137fbecf5a7bfbc25af10c27c54b4",
    "time": 1456566037,
    "error": 0
}
```

json(CardInfo)
```json
{
    "read_by": "xxx", //or ""
    "is_editable": true,
    "is_public": true,
    "local_template": "you will do it :)",
    "view_count": 0,
    "author": "test004@126.com",
    "created_at": 1456547164,
    "modified_at": 1456547164,
    "first_read_at": null,
    "token": "3a0137fbecf5a7bfbc25af10c27c54b4",
    "edited_count": 0,
    "stars": 0
}

### card_query
```json
{
    "action": "card_query",
    "token": "00b3eed3b733afba6e45cdedf0036801",
}
```

- 成功 Succeed
```json
{
    "error": 0,
    "card_info":json(CardInfo)
    "timestamp": 1456283003
}

```

### card_edit
```
{
    "action": "card_edit",
    "token": "00b3eed3b733afba6e45cdedf0036801",
    "card_info": {
        "local_template": "you will do it :)",
        "is_editable": true,
        "is_public": true,
        "visible_at": "1999-02-02 00:00:00"
    }
}
```

- 成功 Succeed
```json
{
    "error": 0,
    "card_info":json(CardInfo)
    "timestamp": 1456283003
}
```

### card_create
```json
{
    "action": "card_create",
    "qr_id": "3a0137fbecf5a7bfbc25af10c27c54b4",
    "card_info": {
        "local_template": "you will do it :)",
        "is_editable": true,
        "is_public": true,
        "visible_at": "1999-02-02 00:00:00"
    }
}
```
- 成功 Succeed
```json
{
    "error": 0,
    "card_info":json(CardInfo)
    "timestamp": 1456283003
}
```

error
424 已有记录
423 资源不存在
425 修改用户无权限
426 卡片被禁用
