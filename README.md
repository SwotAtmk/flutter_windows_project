# zaojiangchong_project

    Flutter windows开发论文写作助手，后期考虑移植mac、linux

## 开发成员：
    - Jarming

## 开始：
   请在本项目目录下执行来拉取项目中用到的插件
`flutter pug get`

## 运行项目：（在windows端）
`flutter run -d windows` 
项目运行时执行热加载或局部刷新时需要保持windows窗体在屏幕中显示，不然有可能此次操作不生效，页面不生效的情况请再次摁下R。

## 构建windows执行文件：
`flutter build windows`
文件将构建到项目目录：/build/windows/runner/Release
将此目录中的文件提取出来，用开源打包工具Inno打包。 .iss配置文件后续会添加到项目中方便构建时使用

## 项目用到的插件说明
    1. dio    
        网络请求库，用于基本http网络请求UDP及TCP连接，主要功能网络数据交互、异步数据请求、文件上传等……
    2. flutter_swiper 
        轮播图插件，暂时没有功能用到该插件，主要做轮播图这块。
    3. url_launcher
        url发射器，用于跳转外部链接、跳转外部应用等。
    4. get （即：GetX）
        非常优秀的一款插件，集成状态管理、路由管理、依赖管理，主要用于对状态的控制，服务的初始化操作类似服务容器，页面路由管理带参传递无需携带上下文context即可完成页面跳转操作，就很nice。
    5. shared_preferences
        数据持久化到本地，通过键值对的形式对数据进行持久化，目前支持存储值的类型Sting、StringList、Value等……。如需像管理数据库一样做数据持久化操作，推荐使用database这个插件自行去< https://pub.flutter-io.cn/ > 上搜索。
    6. desktop_window
        这个可以设置windows、linux、MacOS的窗口大小，暂时用不上该插件，下面这个插件可以替代该插件
    7. bitsdojo_window
        这个插件用来隐藏默认窗口标题栏及重新实现了窗口最小化、最大化及关闭窗口的事件，同时能设置窗体的默认大小。发现应用启动时会出现透明框闪烁，暂不考虑解决后期再做优化。
    8. file_chooser
        文件选择器
    9. kumi_popup_window
        windows弹窗插件
    10. flutter_menu
        设置windows菜单栏
    
## 项目目录结构说明
    /android -> 这个目录主要是开发安卓用的，现在暂时用不上，可以说是可有可无，强行将项目运行在安卓上会出现意想不到的异常。
    /assets -> 静态文件存放目录，其中用到的文件需在pubspec.yaml注册使用
    /build -> flutter build生成目录，为flutter程序运行时构建的临时目录
    /iod -> 同上所述
    /integration_test -> 测试生成目录
    /lib -> 主要核心代码目录
    /lib/main.dart -> 项目执行入口文件
    /lib/binding -> GetX捆绑类目录
    /lib/controller -> 控制器目录（即：状态管理），用于页面上数据控制管理。
    /lib/pages -> 页面编写目录，以下的子目录即为页面中抽离的组件
    /lib/routes -> 路由管理及页面管理，每新建一个页面请到该目录下的pages_register.dart文件中注册该页面
    /lib/service -> 服务存放位置
    /lib/test -> 测试文件及临时文件目录自己随便命名的
    /test -> flutter 单元测试目录
    /windows -> flutter windows 底层依赖目录，其中包含c++窗口程序及flutter相关注入。
    /pubspec.yaml -> 配置文件
    /README.md -> 项目说明文档
    
# 注意：
C++代码中最好不要出现中文注释，不然可能会出现Unicode编码错误。
Dart与C++交互通过MethodChannel对象进行互相调用。
项目中有许多测试用的代码，虽然没有都用上，但希望以后能用得上。
