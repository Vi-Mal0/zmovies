import 'package:flutter/material.dart';
import 'package:zmovies/screens/viewall_screen.dart';
import 'package:zmovies/widget/viewallitembuildet.dart';

import '../model/movie.dart';

import '../widget/vertical_list_item.dart';
import '../widget/horizontal_list_item.dart';

class viewallscreen extends StatelessWidget {
  const viewallscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('favorites'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 767,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: topRatedMovieList.length,
                        itemBuilder: (ctx, i) => viewallitembuilder(i),
                      ),
                    ),
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}
