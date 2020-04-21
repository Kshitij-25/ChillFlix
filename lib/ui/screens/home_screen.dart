import 'package:flutter/material.dart';
import 'package:netflix_redesign/api.dart';
import 'package:netflix_redesign/models/featuredmoviemodel.dart';
import 'package:netflix_redesign/models/featuredtvmodel.dart';
import 'package:netflix_redesign/models/genremodel.dart';
import 'package:netflix_redesign/ui/widgets/homepagefeaturedwidget.dart';
import 'package:netflix_redesign/ui/widgets/movie_container.dart';
import 'package:netflix_redesign/ui/widgets/section_container.dart';
import 'package:netflix_redesign/ui/widgets/tv_container.dart';
import 'package:netflix_redesign/ui/widgets/vertical_categories.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<FeaturedMovieModel>> featuredMovies;
  Future<List<GenreModel>> genreList;
  Future<List<FeaturedTvModel>> featuredTv;
  Api _api;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _api = Api();
    featuredMovies = _api.getFeaturedMovies();
    featuredTv = _api.getFeaturedTv();
    genreList = _api.getGenreList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   // backgroundColor: Colors.white,
      //   elevation: 0,
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(
      //         Icons.search,
      //         color: Colors.white,
      //       ),
      //       onPressed: () {},
      //     ),
      //   ],
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.menu,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {},
      //   ),
      //   title: Text(
      //     'ChillFlix',
      //     style: TextStyle(
      //       color: Colors.red,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 45,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 11.0),
                        child: VerticalCategories(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'ChillFlix',
                        style: TextStyle(
                          fontSize: 27,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: FutureBuilder<List<FeaturedMovieModel>>(
                        future: featuredMovies,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return HomePageFeaturedWidget(snapshot: snapshot);
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SectionContainer(
                      sectionTitle: "My List",
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: FutureBuilder<List<FeaturedTvModel>>(
                          future: featuredTv,
                          builder: (ctx, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (ctx, id) {
                                  return TvContainer(
                                      snapshot: snapshot.data[id]);
                                },
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SectionContainer(
                      sectionTitle: "Popular on ChillFlix",
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: FutureBuilder<List<FeaturedMovieModel>>(
                          future: featuredMovies,
                          builder: (ctx, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (ctx, id) {
                                  return MovieContainer(
                                      snapshot: snapshot.data[id]);
                                },
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
