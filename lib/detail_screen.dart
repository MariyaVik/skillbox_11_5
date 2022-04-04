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
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Hero(tag: space.id, child: Image.asset(space.image)),
                Positioned(
                  right: 20,
                  bottom: -20,
                  child: Hero(
                    tag: '${space.id}-button',
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.blue,
                      child: Icon(
                        Icons.add,
                        size: 48,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Hero(
                  tag: '${space.id}-text',
                  child: Material(child: Text(space.description))),
            )
          ],
        ),
      ),
    );
  }
}
