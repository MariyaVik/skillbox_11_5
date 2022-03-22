import 'package:flutter/material.dart';
import 'package:skillbox_11_5/space.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.title),
      ),
      body: ListView(
        children: spaces
            .map((e) => SizedBox(
                  height: 150,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Stack(
                      children: [
                        Column(children: [
                          Expanded(
                            child: Ink.image(
                              image: AssetImage(e.image),
                              height: MediaQuery.of(context).size.height / 4,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                              child: Container(
                                  color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 16, 46, 16),
                                    child: Text(
                                      e.description,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))),
                        ]),
                        Positioned(
                          right: 20,
                          top: 60,
                          child: Container(
                            height: 30,
                            width: 30,
                            color: Colors.yellow,
                            child: Icon(Icons.add),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
