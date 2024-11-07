## 项目介绍

趣玩flutter版是一款追求使用最新技术开发的实践探索型应用，以功能为导向，力求实现最好的用户体验。项目旨在深入学习flutter前沿技术，提升flutter方面的开发能力并积累经验，保存可复用代码，计划持续更新。目前功能包括：视频分类推荐信息流、视频播放、发送弹幕、发送评论和表情、相关视频推荐、附近用户动态、个人信息查看等。

## 项目地址

- 趣玩后端地址：[GitHub](https://github.com/xt-guiyi/interesting-play-service-nest) 
- 趣玩安卓版（持续更新）：[GitHub](https://github.com/xt-guiyi/interesting-play-android)

## 开发环境

- Flutter SDK 3.24.3
- Dart 3.5.3
- android studio IDEA 2024.1
- 谷歌浏览器
- android 编译环境(android sdk 、java sdk)
- ios编译环境（Xcode）


## 项目结构

```
io
 +- github
     +- xxyopen   
        +- novel
            +- NovelApplication.java -- 项目启动类
            |
            +- core -- 项目核心模块，包括各种工具、配置和常量等
            |   +- common -- 业务无关的通用模块
            |   |   +- exception -- 通用异常处理
            |   |   +- constant -- 通用常量   
            |   |   +- req -- 通用请求数据格式封装，例如分页请求数据  
            |   |   +- resp -- 接口响应工具及响应数据格式封装 
            |   |   +- util -- 通用工具   
            |   | 
            |   +- annotation -- 自定义注解类
            |   +- aspect -- Spring AOP 切面
            |   +- auth -- 用户认证授权相关
            |   +- config -- 业务相关配置
            |   +- constant -- 业务相关常量         
            |   +- filter -- 过滤器 
            |   +- interceptor -- 拦截器
            |   +- json -- JSON 相关的包，包括序列化器和反序列化器
            |   +- task -- 定时任务
            |   +- util -- 业务相关工具 
            |   +- wrapper -- 装饰器
            |
            +- dto -- 数据传输对象，包括对各种 Http 请求和响应数据的封装
            |   +- req -- Http 请求数据封装
            |   +- resp -- Http 响应数据封装
            |
            +- dao -- 数据访问层，与底层 MySQL 进行数据交互
            +- manager -- 通用业务处理层，对第三方平台封装、对 Service 层通用能力的下沉以及对多个 DAO 的组合复用 
            +- service -- 相对具体的业务逻辑服务层  
            +- controller -- 主要是处理各种 Http 请求，各类基本参数校验，或者不复用的业务简单处理，返回 JSON 数据等
            |   +- front -- 小说门户相关接口
            |   +- author -- 作家管理后台相关接口
            |   +- admin -- 平台管理后台相关接口
            |   +- app -- app 接口
            |   +- applet -- 小程序接口
            |   +- open -- 开放接口，供第三方调用 
```

## 技术选型

| 技术                  | 说明
|---------------------| ---------------------------
| dio        | 网络请求框架
| fluttertoast    | 吐司框架
| carousel_slider |  轮播图控件
| cupertino_icons          | 苹果icon库
| lottie    | lottie动画库
| GetX    | 状态管理库
| shared_preferences  | 本地数据存储库
| json_annotation   | flutter 序列化库
| intl   | （语言、时间、日期、）本地格式化库
| flutter_staggered_grid_view   | 网格(瀑布流)布局支持

## 项目截图

<div style="display: flex; justify-content: space-around;width: 300px; margin-top: 20px">
  <img src="https://images.cubox.pro/iw3rni/file/2024110713252697611/1730957115091.jpg" alt="Image 4" style="flex: 1;margin: 0 20px">
  <img src="https://images.cubox.pro/iw3rni/file/2024110523473988948/1730821648779.jpg" alt="Image 4" style="flex: 1;margin: 0 20px">
   <img src="https://images.cubox.pro/iw3rni/file/2024110523480277649/1730821674438.jpg" alt="Image 4" style="flex: 1;margin: 0 20px">
</div>

<div style="display: flex; justify-content: space-around;width: 300px; margin-top: 20px">
  <img src="https://images.cubox.pro/iw3rni/file/2024110523481067702/1730821688262.jpg" alt="Image 4" style="flex: 1;margin: 0 20px">
  <img src="https://images.cubox.pro/iw3rni/file/2024110523481694156/1730821695250.jpg" alt="Image 4" style="flex: 1;margin: 0 20px">
   <img src="https://images.cubox.pro/iw3rni/file/2024110523482476219/1730821702933.jpg" alt="Image 4" style="flex: 1;margin: 0 20px">
</div>

<div style="display: flex; justify-content: space-around;width: 300px; margin-top: 20px">
  <img src="https://images.cubox.pro/iw3rni/file/2024110523481694156/1730821695250.jpg" alt="Image 4" style="flex: 1;margin: 0 20px">
  <img src="https://images.cubox.pro/iw3rni/file/2024110523482476219/1730821702933.jpg" alt="Image 4" style="flex: 1;margin: 0 20px">
   <img src="https://images.cubox.pro/iw3rni/file/2024110523483664467/1730821714948.jpg" alt="Image 4" style="flex: 1;margin: 0 20px">
</div>

<div style="display: flex; justify-content: space-around;width: 300px; margin-top: 20px">
  <img src="https://images.cubox.pro/iw3rni/file/2024110523485339191/1730821730767.jpg" alt="Image 4" style="flex: 1;margin: 0 20px">
  <img src="https://images.cubox.pro/iw3rni/file/2024110523490012067/1730821738758.jpg" alt="Image 4" style="flex: 1;margin: 0 20px">
</div>
