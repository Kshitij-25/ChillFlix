import 'package:flutter/material.dart';
<<<<<<< HEAD

import '../../api.dart';
import '../../models/featured_movie_model.dart';
import '../../models/featured_tv_model.dart';
import '../../models/genre_model.dart';
import '../widgets/homepage_featured_widget.dart';
import '../widgets/movie_container.dart';
import '../widgets/section_container.dart';
import '../widgets/tv_container.dart';
import '../widgets/vertical_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

=======
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
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
<<<<<<< HEAD
  late Future<List<FeaturedMovieModel>> featuredMovies;
  late Future<List<GenreModel>> genreList;
  late Future<List<FeaturedTvModel>> featuredTv;
  late Api _api;
=======
  Future<List<FeaturedMovieModel>> featuredMovies;
  Future<List<GenreModel>> genreList;
  Future<List<FeaturedTvModel>> featuredTv;
  Api _api;
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626

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
<<<<<<< HEAD
                decoration: const BoxDecoration(
=======
                decoration: BoxDecoration(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    IconButton(
<<<<<<< HEAD
                      icon: const Icon(Icons.home),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
=======
                      icon: Icon(Icons.home),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
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
<<<<<<< HEAD
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
=======
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                      child: Text(
                        'ChillFlix',
                        style: TextStyle(
                          fontSize: 27,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
<<<<<<< HEAD
                    SizedBox(
=======
                    Container(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                      height: MediaQuery.of(context).size.height / 3,
                      child: FutureBuilder<List<FeaturedMovieModel>>(
                        future: featuredMovies,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return HomePageFeaturedWidget(snapshot: snapshot);
                          } else {
<<<<<<< HEAD
                            return const Center(
=======
                            return Center(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
<<<<<<< HEAD
                    const SizedBox(
=======
                    SizedBox(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                      height: 15,
                    ),
                    SectionContainer(
                      sectionTitle: "My List",
<<<<<<< HEAD
                      child: SizedBox(
=======
                      child: Container(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                        height: MediaQuery.of(context).size.height / 3,
                        child: FutureBuilder<List<FeaturedTvModel>>(
                          future: featuredTv,
                          builder: (ctx, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
<<<<<<< HEAD
                                itemCount: snapshot.data!.length,
                                itemBuilder: (ctx, id) {
                                  return TvContainer(
                                      snapshot: snapshot.data![id]);
                                },
                              );
                            } else {
                              return const Center(
=======
                                itemCount: snapshot.data.length,
                                itemBuilder: (ctx, id) {
                                  return TvContainer(
                                      snapshot: snapshot.data[id]);
                                },
                              );
                            } else {
                              return Center(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                    ),
<<<<<<< HEAD
                    const SizedBox(
=======
                    SizedBox(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                      height: 15,
                    ),
                    SectionContainer(
                      sectionTitle: "Popular on ChillFlix",
<<<<<<< HEAD
                      child: SizedBox(
=======
                      child: Container(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                        height: MediaQuery.of(context).size.height / 3,
                        child: FutureBuilder<List<FeaturedMovieModel>>(
                          future: featuredMovies,
                          builder: (ctx, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
<<<<<<< HEAD
                                itemCount: snapshot.data!.length,
                                itemBuilder: (ctx, id) {
                                  return MovieContainer(
                                      snapshot: snapshot.data![id]);
                                },
                              );
                            } else {
                              return const Center(
=======
                                itemCount: snapshot.data.length,
                                itemBuilder: (ctx, id) {
                                  return MovieContainer(
                                      snapshot: snapshot.data[id]);
                                },
                              );
                            } else {
                              return Center(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
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
