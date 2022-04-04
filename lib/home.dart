import 'package:flutter/material.dart';
import 'package:skillbox_11_5/detail_screen.dart';
import 'package:skillbox_11_5/space.dart';

class HomeView extends StatelessWidget {
  final ValueChanged<Space> onTab;
  HomeView({Key? key, required this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('Animations'),
      ),
      body: ListView(
        children: spaces
            .map((e) => MyCardWidget(
                  space: e,
                  onTab: onTab,
                ))
            .toList(),
      ),
    );
  }
}

class MyCardWidget extends StatelessWidget {
  final Space space;
  final ValueChanged<Space> onTab;
  const MyCardWidget({
    required this.space,
    required this.onTab,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTab(space),
      child: SizedBox(
        height: 150,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Column(children: [
                Expanded(
                  child: Hero(
                    tag: space.id,
                    child: Ink.image(
                      image: AssetImage(space.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        width: double.infinity,
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 46, 16),
                          child: Hero(
                            tag: '${space.id}-text',
                            child: Text(
                              space.description,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ))),
              ]),
              Positioned(
                right: 20,
                top: 60,
                child: Hero(
                  tag: '${space.id}-button',
                  child: Container(
                    height: 30,
                    width: 30,
                    color: Colors.yellow,
                    child: Icon(Icons.add),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
