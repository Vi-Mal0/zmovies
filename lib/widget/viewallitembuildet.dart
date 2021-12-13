import 'package:flutter/material.dart';

import '../model/movie.dart';
import '../screens/movie_details_screen.dart';

class viewallitembuilder extends StatelessWidget {
  final int index;
  viewallitembuilder(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              MovieDetailsScreen.routeName,
              arguments: {
                'id': topRatedMovieList[index].id,
                'title': topRatedMovieList[index].title,
                'imageUrl': topRatedMovieList[index].imageUrl,
                'description': topRatedMovieList[index].description,
                'rating': topRatedMovieList[index].rating,
                'year': topRatedMovieList[index].year,
                'duration': topRatedMovieList[index].duration,
              },
            );
          },
          child: Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Hero(
                  tag: topRatedMovieList[index].id,
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          topRatedMovieList[index].imageUrl,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        topRatedMovieList[index].title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 240,
                        child: Text(
                          topRatedMovieList[index].description,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
