import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network_api_2/cotroller/fetch_Api.dart';
import 'package:network_api_2/model/movies_model.dart';

class InfoScreen extends StatefulWidget {
  final MoviesModel _moviesModel;
  InfoScreen(this._moviesModel);
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  FetchAPI _fetchAPI = new FetchAPI();
  MoviesModel moviesModel = new MoviesModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: _fetchAPI.getInfoMovie(),
            builder: (context, snapshot) {
              List<MoviesModel> movieList = snapshot.data;
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ///Background  Image / Title / IconButton

                          Stack(
                            // alignment: Alignment.bottomCenter,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "https://image.tmdb.org/t/p/original${widget._moviesModel.backdrop_path}",
                                fit: BoxFit.cover,
                                height: 350,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                  alignment: Alignment.topLeft,
                                  height: 350,
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 280, 0, 10),
                                    child: Text(
                                      widget._moviesModel.title,
                                      style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  )),
                              Container(
                                height: 350,
                                width: MediaQuery.of(context).size.width,
                                child: IconButton(
                                  padding: EdgeInsets.all(20),
                                  alignment: Alignment.bottomRight,
                                  icon: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      color: Colors.green,
                                    ),
                                    child: Icon(
                                      Icons.favorite_border,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 2,
                            color: Colors.black26,
                          ),
                          SizedBox(height: 10),

                          /// Hint Info
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              // height: 400,

                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(15)),

                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://image.tmdb.org/t/p/original${widget._moviesModel.poster_path}",
                                      fit: BoxFit.cover,
                                      height: 250,
                                      width: 150,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topCenter,
                                    width:
                                        MediaQuery.of(context).size.width / 1.7,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            widget._moviesModel.title,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            widget._moviesModel.release_date,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              children: [
                                                Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Container(
                                                        // alignment: Alignment.bottomLeft,
                                                        width: 60,
                                                        height: 60,
                                                        decoration: BoxDecoration(
                                                            color: Colors.pink,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40)),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 70,
                                                      height: 70,
                                                      child: Text(
                                                        "${widget._moviesModel.vote_count}",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'votes',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Container(
                                                        // alignment: Alignment.bottomLeft,
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            color: Colors.pink,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40)),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 80,
                                                      height: 80,
                                                      child: Text(
                                                        "${widget._moviesModel.popularity}",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Text(
                                                    'Popularity',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Stack(
                                                  // alignment: Alignment.bottomLeft,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Container(
                                                        // alignment: Alignment.bottomLeft,
                                                        width: 60,
                                                        height: 60,
                                                        decoration: BoxDecoration(
                                                            color: Colors.pink,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40)),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 70,
                                                      height: 70,
                                                      child: Text(
                                                        "${widget._moviesModel.original_language}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'Language',
                                                  style:
                                                      TextStyle(fontSize: 17),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /// overview
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 2,
                            color: Colors.black26,
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                widget._moviesModel.overview,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text('error in api'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
