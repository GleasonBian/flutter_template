

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/Dio/interface.dart';
import 'package:flutter_template/pages/four.dart';
import 'package:flutter_template/pages/one.dart';
import 'package:flutter_template/pages/three.dart';
import 'package:flutter_template/pages/two.dart';


class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => new _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  dynamic data;
  // 定义 颜色常量
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  // 当前页面
  int _currentIndex = 0;
  // 页面控制器
  final  PageController _controller = PageController (
    // 初始页面
    initialPage: 0,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold (

      body: PageView(
        controller: _controller,
        onPageChanged: (val) => setState((){
          _currentIndex = val;
        }),
        children: [
          PageOne(),
          PageTwo(),
          PageThree(),
          PageFour()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 当前所在的页面
        currentIndex: _currentIndex,
        // 点击的回调函数 当前页面 的index
        onTap: (index) {
          // 跳转到选择的页面
          _controller.jumpToPage(index);
          // 设置 index
          setState(() {
            _currentIndex = index;
          });
        },
        // bottom navigation bar 的文字 非 选中时 显示
        type: BottomNavigationBarType.fixed,
        items: [
          // 注意 index 从 0 开始
          BottomNavigationBarItem(
            icon: Icon( Icons.home,  color: _defaultColor),
            activeIcon: Icon( Icons.home, color: _activeColor ),
            title: Text('ONE',style: TextStyle(color: _currentIndex != 0 ? _defaultColor : _activeColor )),
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.search,  color: _defaultColor),
            activeIcon: Icon( Icons.search, color: _activeColor ),
            title: Text('TWO',style: TextStyle(color: _currentIndex != 1 ? _defaultColor : _activeColor )),
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.camera_alt,  color: _defaultColor),
            activeIcon: Icon( Icons.camera_alt, color: _activeColor ),
            title: Text('THREE',style: TextStyle(color: _currentIndex != 2 ? _defaultColor : _activeColor )),
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.account_circle,  color: _defaultColor),
            activeIcon: Icon( Icons.account_circle, color: _activeColor ),
            title: Text('FOUR',style: TextStyle(color: _currentIndex != 3 ? _defaultColor : _activeColor )),
          ),
        ],
      ),
    );
  }

  void loadData() async{
    var result = await Fetch.getSingleJoke({'param': {'sid':'28654780'}});
    setState(() {
      data = result.toString();
    });
  }
}