import 'package:flutter/material.dart';
import 'package:netflix_redesign/api.dart';
import 'package:netflix_redesign/models/featuredmoviemodel.dart';
import 'package:netflix_redesign/models/featuredtvmodel.dart';
import 'package:netflix_redesign/models/genremodel.dart';
import 'package:netflix_redesign/ui/widgets/homepagefeaturedwidget.dart';
import 'package:netflix_redesign/ui/widgets/movie_container.dart';
import 'package:netflix_redesign/ui/widgets/section_container.dart';
import 'package:netflix_redesign/ui/widgets/tv_container.dart';

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
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Text(
          'ChillFlix',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
            Container(
              padding: EdgeInsets.only(left: 5.0),
              height: 61,
              child: FutureBuilder<List<GenreModel>>(
                future: genreList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, id) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red,
                                blurRadius: 2.5,
                              )
                            ],
                          ),
                          // width: MediaQuery.of(context).size.width / 2.5,
                          constraints: BoxConstraints(minWidth: 150),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 5.0,
                          ),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            "${snapshot.data[id].name}",
                            style: Theme.of(context)
                                .textTheme
                                .headline
                                .apply(color: Colors.white),
                          ),
                        );
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
                          return TvContainer(snapshot: snapshot.data[id]);
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
                          return MovieContainer(snapshot: snapshot.data[id]);
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
    );
  }
}
