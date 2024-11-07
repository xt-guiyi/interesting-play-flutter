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
lib -- 主目录
├── api -- 封装全局可用的网络请求类
├── assets -- 静态文件，图片，字体等
├── constants -- 全局app常量
├── dto -- 数据传输类
├── model -- 接口数据模型类
├── store -- 全局状态管理
├── pages --  所有界面
└── utils -- 通用工具类，如时间工具类，图片加载类等
└── widgets -- 全局自定义widget,可复用
└── main.dart -- 入口文件
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


## 待实现功能

- 视频播放
- 相关视频推荐列表
- 评论列表
- 发送弹幕
- 发送评论