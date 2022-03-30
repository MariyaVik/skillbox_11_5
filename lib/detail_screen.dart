import 'package:flutter/material.dart';
import 'package:skillbox_11_5/space.dart';

class DetailScreen extends StatelessWidget {
  final Space space;
  const DetailScreen({required this.space, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Stack(children: [Image.asset(space.image)]),
      ),
    );
  }
}
