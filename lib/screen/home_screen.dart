import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:network_api_2/cotroller/fetch_Api.dart';
import 'package:network_api_2/model/movies_model.dart';
import 'package:network_api_2/screen/info_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FetchAPI _api = new FetchAPI();
  MoviesModel moviesModel = new MoviesModel();
  List<MoviesModel> movieList = [];
  String value = 'popular';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resultData();
  }

  Future<void> resultData() async {
    print('resultData $value');
    await _api.getMovie(value);
    movieList = _api.movieList;
    return movieList;
  }

  var _loading;

  // setState(() => _api.getMovie(value));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0.0,
        // centerTitle: true,

        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Most $value',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          popupMenuButton(),
        ],
      ),
      body: buildFutureBuilder(),
    );
  }

  FutureBuilder buildFutureBuilder() {
    return FutureBuilder(
      // setState(() => _api.getMovie(value))

      future: resultData(),
      builder: (context, snapshot) {
        print("data is" + snapshot.data.toString());
        if (snapshot.hasData) {
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InfoScreen(movieList[index])));
                },
                child: Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://image.tmdb.org/t/p/original${movieList[index].poster_path}",
                          fit: BoxFit.fill,
                          // height: 300,
                        ),
                      ),
                      Container(
                          height: 50,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            movieList[index].title,
                            style: TextStyle(fontSize: 18),
                          )),
                    ],
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) => StaggeredTile.extent(1, 400),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          );

          //   GridView.builder(
          //   itemCount: movieList.length,
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       title: Column(
          //         children: [
          //           Container(
          //             child: Expanded(
          //               child: CachedNetworkImage(
          //                 imageUrl:
          //                     "https://image.tmdb.org/t/p/original${movieList[index].poster_path}",
          //                 fit: BoxFit.cover,
          //                 height: 300,
          //               ),
          //             ),
          //           ),
          //           Text(movieList[index].title),
          //         ],
          //       ),
          //     );
          //
          //     //   Container(
          //     //   decoration: BoxDecoration(
          //     //       color: Colors.grey,
          //     //       borderRadius: BorderRadius.circular(10)),
          //     //   // height: 300,
          //     //   child: Column(
          //     //     children: [
          //     //       Expanded(
          //     //         child: CachedNetworkImage(
          //     //           imageUrl:
          //     //               "https://image.tmdb.org/t/p/original${movieList[index].poster_path}",
          //     //           fit: BoxFit.cover,
          //     //         ),
          //     //       ),
          //     //     ],
          //     //   ),
          //     // );
          //   },
          // );
        } else if (snapshot.hasError) {
          print("errorr" + snapshot.error);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget getmostwidget() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InfoScreen(movieList[index])));
          },
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://image.tmdb.org/t/p/original${movieList[index].poster_path}",
                    fit: BoxFit.fill,
                    // height: 300,
                  ),
                ),
                Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      movieList[index].title,
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
          ),
        );
      },
      staggeredTileBuilder: (index) => StaggeredTile.extent(1, 400),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
    );
  }

  Widget popupMenuButton() {
    return PopupMenuButton<String>(onSelected: (item) {
      value = item;
      print(value);

      setState((){
        value = item;
       // await _api.getMovie(value);
        resultData();
      });
    }, itemBuilder: (context) {
      return <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: "popular",
          child: Text("Popular"),
        ),
        PopupMenuItem<String>(
          value: "top_rated",
          child: Text("Top Rated"),
        ),
        PopupMenuItem<String>(
          value: "upcoming",
          child: Text('Upcoming'),
        ),
      ];
    });
  }
}
