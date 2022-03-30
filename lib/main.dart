import 'package:flutter/material.dart';
import 'package:skillbox_11_5/detail_screen.dart';
import 'package:skillbox_11_5/home.dart';
import 'package:skillbox_11_5/space.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Space? _selectedSpace;

  void onTabSpace(Space space) {
    setState(() {
      _selectedSpace = space;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Navigator(
          pages: [
            MaterialPage(
                child: HomeView(
              onTab: onTabSpace,
            )),
            if (_selectedSpace != null)
              MaterialPage(child: DetailScreen(space: _selectedSpace!))
          ],
          onPopPage: (route, result) {
            return route.didPop(result);
          },
        ));
  }
}
