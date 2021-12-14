import 'package:flutter/material.dart';
import 'package:zmovies/model/ch_movie.dart';
import 'package:zmovies/screens/favorites.dart';
import 'package:zmovies/screens/viewall_screen.dart';

import '../widget/vertical_list_item.dart';
import '../widget/horizontal_list_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('movie cust'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const favoritesscreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Recommended',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 276,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder: (ctx, i) => HorizontalListItem(i),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'Best of 2019',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FlatButton(
                            child: const Text('View All'),
                            onPressed:  () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const viewallscreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 420,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: bestMovieList.length,
                        itemBuilder: (ctx, i) => VerticalListItem(i),
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
