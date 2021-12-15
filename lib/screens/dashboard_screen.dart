import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zmovies/generated/l10n.dart';
import 'package:zmovies/model/ch_movie.dart';
import 'package:zmovies/screens/viewall_screen.dart';
import 'package:zmovies/widget/horizontal_list_item.dart';
import 'package:zmovies/widget/vertical_list_item.dart';

import '../LanguageChangeProvider.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({Key? key}) : super(key: key);

  @override
  _DashboardscreenState createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  bool changelang = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('movie cust'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.translate),
            onPressed: () {
              setState(() {
                if(changelang == true){
                  context.read<LanguageChangeProvider>().changeLocale("zh");

              }else{
                  context.read<LanguageChangeProvider>().changeLocale("en");

                }
                });
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
                Text(S.of(context).recommended,
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
                          Text(
                            S.of(context).best_of,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FlatButton(
                            child: Text(S.of(context).viewall),
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
                      height: 416,
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

