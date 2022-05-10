# OnlineTest接口文档

<font color="red">该文档为旧版本的接口文档，新的接口文档请移步： 链接: https://www.apifox.cn/apidoc/shared-6da5dfc8-3950-4e90-bec8-e298bd077fb9  访问密码 : syl6PD1a </font>

OnlineTest的接口文档

注意：除了登录注册和退出登录接口外，其他的接口均需要登录后才能访问（需要在请求头中添加token）

参数名：`Authorization`

参数值：登录后返回的token

示例：

Authorization:eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmVUZXN0IiwiY2xhaW1zIjp7InR5cGUiOiJhZG1pbiIsInVzZXJuYW1lIjoiYWRtaW4ifSwiZXhwIjoyMDgzNTY3OTQyLCJpYXQiOjE2NTE1Njc5NDJ9.QFadjSPvbFW8EhnIgD6GER1GIwqhAtQKvfoB-uybHGs

## 系统

### ping测试

请求方式：`GET`

请求路径：`/OnlineTest/api/v1/test`

Query参数

| 参数名 | 参数值 |
| ------ | ------ |
| action | ping   |

返回示例

```json
{
    "code": 0,
    "message": "操作成功",
    "data": "pong"
}
```

### 验证码

请求方式：`GET`

请求路径：`/OnlineTest/kaptcha.jpg`

返回验证码图片

## 管理员

### 管理员登陆

请求方式：`GET`

请求路径：`/OnlineTest/api/v1/admin`

Query参数

| 参数名   | 参数值     |
| -------- | ---------- |
| action   | loginAdmin |
| username | admin      |
| password | admin      |

返回示例

```json
{
    "code": 0,
    "message": "操作成功",
    "data": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmVUZXN0IiwiY2xhaW1zIjp7InR5cGUiOiJhZG1pbiIsInVzZXJuYW1lIjoiYWRtaW4ifSwiZXhwIjoyMDgzNTY1NzA1LCJpYXQiOjE2NTE1NjU3MDV9.TkzYdbZ5yLqEvSt-fQpdk5N-J78pMEKzOummn3mJ2yw"
}
```

登录成功后，会返回token

### 退出

请求方式：`GET`

请求路径：`/OnlineTest/api/v1/admin`

Query参数

| 参数名 | 参数值 |
| ------ | ------ |
| action | logout |

返回示例

```json
{
    "code": 0,
    "message": "操作成功"
}
```

前端移除保存的token



## 学生

### 学生登录

请求方式：`GET`

请求路径：`/OnlineTest/api/v1/student`

Query参数

| 参数名   | 参数值       |
| -------- | ------------ |
| action   | loginStudent |
| username | zixiangfei   |
| password | 123456       |

返回示例

```json
{
    "code": 0,
    "message": "操作成功",
    "data": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmVUZXN0IiwiY2xhaW1zIjp7InR5cGUiOiJhZG1pbiIsInVzZXJuYW1lIjoieml4aWFuZ2ZlaSJ9LCJleHAiOjIwODM1NjY4NzUsImlhdCI6MTY1MTU2Njg3NX0.6p0P4Jv_xpis1giqVKwUtE1cR0WJSEnlBPrUHimgOCw"
}
```

登录成功后，返回token

### 学生注册

请求方式：`POST`

请求路径：`/OnlineTest/api/v1/student`

Query参数

| 参数名   | 参数值            |
| -------- | ----------------- |
| action   | registStudent     |
| username | lyh               |
| password | liuyuhe           |
| email    | 1046818625@qq.com |
| code     | 8a76a             |

返回示例

```json
{
    "code": 0,
    "message": "操作成功"
}
```



### 查询所有学生

请求方式：`GET`

请求路径：`/OnlineTest/api/v1/student`

Query参数

| 参数名 | 参数值        |
| ------ | ------------- |
| action | getAllStudent |

返回示例

```json
{
    "code": 0,
    "message": "操作成功",
    "data": {
        "students": [
            {
                "id": 7,
                "username": "zixiangfei",
                "password": "123456",
                "email": "zxf@163.com"
            },
            {
                "id": 8,
                "username": "student1",
                "password": "123456",
                "email": "student1@qq.com",
                "nikename": "student1"
            },
            {
                "id": 209,
                "username": "student2",
                "password": "123456",
                "email": "student2@qq.com",
                "nikename": "student2"
            }
        ],
        "type": "student"
    }
}
```

### 查询学生（分页）

请求方式：`GET`

请求路径：`/OnlineTest/api/v1/student`

Query参数

| 参数名   | 参数值      |
| -------- | ----------- |
| action   | pageStudent |
| pageNo   | 1           |
| pageSize | 10          |

返回示例

```json
{
    "code": 0,
    "message": "操作成功",
    "data": {
        "pageNo": 1,
        "pageTotal": 10,
        "pageSize": 10,
        "pageTotalCount": 99,
        "items": [
            {
                "id": 7,
                "username": "zixiangfei",
                "password": "123456",
                "email": "zxf@163.com"
            },
            {
                "id": 8,
                "username": "student1",
                "password": "123456",
                "email": "student1@qq.com",
                "nikename": "student1"
            },
            {
                "id": 209,
                "username": "student2",
                "password": "123456",
                "email": "student2@qq.com",
                "nikename": "student2"
            },
            {
                "id": 210,
                "username": "student3",
                "password": "123456",
                "email": "student3@qq.com",
                "nikename": "student3"
            },
            {
                "id": 211,
                "username": "student4",
                "password": "123456",
                "email": "student4@qq.com",
                "nikename": "student4"
            },
            {
                "id": 212,
                "username": "student5",
                "password": "123456",
                "email": "student5@qq.com",
                "nikename": "student5"
            },
            {
                "id": 213,
                "username": "student6",
                "password": "123456",
                "email": "student6@qq.com",
                "nikename": "student6"
            },
            {
                "id": 214,
                "username": "student9",
                "password": "123456",
                "email": "student9@qq.com",
                "nikename": "student9"
            },
            {
                "id": 215,
                "username": "student10",
                "password": "123456",
                "email": "student10@qq.com",
                "nikename": "student10"
            },
            {
                "id": 216,
                "username": "student11",
                "password": "123456",
                "email": "student11@qq.com",
                "nikename": "student11"
            }
        ],
        "url": "studentServlet?action=pageStudent",
        "type": "student"
    }
}
```



## 教师

### 教师登录

请求方式：`GET`

请求路径：`/OnlineTest/api/v1/teacher`

Query参数

| 参数名   | 参数值       |
| -------- | ------------ |
| action   | loginTeacher |
| username | teacher      |
| password | 123456       |

返回示例

```json
{
    "code": 0,
    "message": "操作成功",
    "data": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmVUZXN0IiwiY2xhaW1zIjp7InR5cGUiOiJhZG1pbiIsInVzZXJuYW1lIjoidGVhY2hlciJ9LCJleHAiOjIwODM1Njc2NDEsImlhdCI6MTY1MTU2NzY0MX0.I5x2huGHnyOeMPhTuKMcCYCMq5EAO0mF_tansd6hylE"
}
```

登录成功，返回token

### 教师注册

请求方式：`POST`

请求路径：`/OnlineTest/api/v1/teacher`

Query参数

| 参数名   | 参数值            |
| -------- | ----------------- |
| action   | registTeacher     |
| username | liu               |
| password | 123456            |
| email    | 1046818625@qq.com |
| code     | e4p8e             |

返回示例

```json
{
    "code": 0,
    "message": "操作成功"
}
```



### 查询教师（分页）

请求方式：`GET`

请求路径：`/OnlineTest/api/v1/teacher`

Query参数

| 参数名   | 参数值      |
| -------- | ----------- |
| action   | pageTeacher |
| pageNo   | 1           |
| pageSize | 10          |

返回示例

```json
{
    "code": 0,
    "message": "操作成功",
    "data": {
        "pageNo": 1,
        "pageTotal": 1,
        "pageSize": 10,
        "pageTotalCount": 2,
        "items": [
            {
                "id": 1,
                "username": "teacher",
                "password": "123456",
                "email": "tea@qq.com"
            },
            {
                "id": 2,
                "username": "teacher2",
                "password": "123456",
                "email": "teacher2@qq.com",
                "nikename": "teacher2"
            }
        ],
        "url": "teacherServlet?action=pageTeacher",
        "type": "teacher"
    }
}
```



## 课程

### 查询课程（分页）

请求方式：`GET`

请求路径：`/OnlineTest/api/v1/subject`

Query参数

| 参数名   | 参数值      |
| -------- | ----------- |
| action   | pageSubject |
| pageNo   | 1           |
| pageSize | 10          |

返回示例

```json
{
    "code": 0,
    "message": "操作成功",
    "data": {
        "pageNo": 1,
        "pageTotal": 1,
        "pageSize": 10,
        "pageTotalCount": 5,
        "items": [
            {
                "id": 10,
                "name": "数据结构"
            },
            {
                "id": 11,
                "name": "操作系统"
            },
            {
                "id": 12,
                "name": "计算机网络"
            },
            {
                "id": 13,
                "name": "计算机组成原理"
            },
            {
                "id": 14,
                "name": "编译原理"
            }
        ],
        "url": "subjectServlet?action=pageSubject",
        "type": "subject"
    }
}
```

### 添加课程

请求方式：`POST`

请求路径：`/OnlineTest/api/v1/subject`

Query参数

| 参数名      | 参数值   |
| ----------- | -------- |
| action      | add      |
| pageNo      | 1        |
| pageSize    | 10       |
| insert-name | 编译原理 |

请求示例

```json
{
    "code": -1,
    "message": "该课程已存在！",
    "data": {
        "pageNo": 1,
        "pageTotal": 1,
        "pageSize": 10,
        "pageTotalCount": 5,
        "items": [
            {
                "id": 10,
                "name": "数据结构"
            },
            {
                "id": 11,
                "name": "操作系统"
            },
            {
                "id": 12,
                "name": "计算机网络"
            },
            {
                "id": 13,
                "name": "计算机组成原理"
            },
            {
                "id": 14,
                "name": "编译原理"
            }
        ],
        "url": "subjectServlet?action=pageSubject",
        "type": "subject"
    }
}
```

### 课程是否存在

请求方式：`GET`

请求路径：`/OnlineTest/api/v1/subject`

Query参数

| 参数名 | 参数值            |
| ------ | ----------------- |
| action | existsSubjectName |
| name   | 编译原理          |

返回示例

```json
{
    "code": 0,
    "message": "操作成功",
    "data": {
        "existsSubjectName": true
    }
}
```



## 班级

### 查询班级（分页）

请求方式：`GET`

请求路径：`/OnlineTest/api/v1/class`

Query参数

| 参数名   | 参数值    |
| -------- | --------- |
| action   | pageClass |
| pageNo   | 1         |
| pageSize | 10        |

返回示例

```json
{
    "code": 0,
    "message": "操作成功",
    "data": {
        "pageNo": 1,
        "pageTotal": 0,
        "pageSize": 10,
        "pageTotalCount": 0,
        "items": [],
        "url": "classServlet?action=pageClass",
        "type": "class"
    }
}
```

### 添加班级

请求方式：`POST`

请求路径：`/OnlineTest/api/v1/class`

Query参数

| 参数名      | 参数值                   |
| ----------- | ------------------------ |
| action      | add                      |
| insert-name | 计算机科学与技术2018-5班 |

返回示例

```json
{
    "code": 0,
    "message": "操作成功",
    "data": {
        "pageNo": 1,
        "pageTotal": 1,
        "pageSize": 20,
        "pageTotalCount": 3,
        "items": [
            {
                "name": "计算机一班",
                "id": 1,
                "teacherId": 1
            },
            {
                "name": "计算机二班",
                "id": 2,
                "teacherId": 2
            },
            {
                "name": "计算机三班",
                "id": 3,
                "teacherId": 1
            }
        ],
        "url": "classServlet?action=pageClass",
        "type": "class"
    }
}
```
