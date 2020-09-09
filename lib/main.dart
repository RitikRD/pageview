import 'package:flutter/material.dart';

import 'pages.dart';
import 'pages.dart';
import 'pages.dart';
//import 'package:pageview/pages.dart';
//import 'package:swipedetector/swipedetector.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<Widget> _pages = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];
  int pageId = 1;
  double dx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildHorizontalSwipeWrapper(
        child: _pages[pageId],
      ),
      // Center(
      //   child: Container(
      //     child: Row(
      //       children: <Widget>[
      //         Expanded(
      //           child: Card(
      //             child: Container(
      //               padding: EdgeInsets.only(
      //                 top: 80.0,
      //                 bottom: 80.0,
      //                 left: 16.0,
      //                 right: 16.0,
      //               ),
      //               child: Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 children: <Widget>[
      //                   Text(
      //                     'Swipe Me!',
      //                     style: TextStyle(
      //                       fontSize: 40.0,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget buildHorizontalSwipeWrapper({
    Widget child,
  }) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.decelerate,
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(dx, 0),
            end: Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
      layoutBuilder: (currentChild, _) => currentChild,
      child: Dismissible(
        background: Center(
          child: Text(
            'Primary',
            style: TextStyle(fontSize: 36.0),
          ),
        ),
        secondaryBackground: Center(
          child: Text(
            'Secondary',
            style: TextStyle(fontSize: 36.0),
          ),
        ),
        key: ValueKey(pageId),
        resizeDuration: null,
        onDismissed: (DismissDirection direction) =>
            onHorizontalSwipe(direction), //_onHorizontalSwipe,
        direction: (pageId == 0)
            ? DismissDirection.endToStart
            : (pageId == _pages.length - 1)
                ? DismissDirection.startToEnd
                : DismissDirection.horizontal,
        child: child,
      ),
    );
  }

  void onHorizontalSwipe(DismissDirection direction) {
    if (direction == DismissDirection.startToEnd) {
      setState(() {
        if (pageId > 0) {
          pageId -= 1;
          dx = -1.1;
        } else {
          dx = 0.0;
        }
      });
    } else {
      setState(() {
        if (pageId < _pages.length - 1) {
          pageId += 1;
          dx = 1.1;
        } else {
          dx = 0.0;
        }
      });
    }
  }
}
