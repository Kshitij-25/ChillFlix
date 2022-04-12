import 'package:chillflix/ui/widgets/movie_container.dart';
import 'package:flutter/material.dart';

import '../../api.dart';
import '../../models/featured_movie_model.dart';
import '../../models/featured_tv_model.dart';
import '../widgets/section_container.dart';
import '../widgets/tv_container.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late Future<List<FeaturedMovieModel>> featuredMovies;
  late Future<List<FeaturedTvModel>> featuredTv;
  late Api _api;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _api = Api();
    featuredMovies = _api.getFeaturedMovies();
    featuredTv = _api.getFeaturedTv();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Movies",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: SectionContainer(
          widget: const Icon(Icons.menu),
          sectionTitle: "",
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<List<FeaturedMovieModel>>(
              future: featuredMovies,
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  // return ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemCount: snapshot.data!.length,
                  //   itemBuilder: (ctx, id) {
                  //     return TvContainer(snapshot: snapshot.data![id]);
                  //   },
                  // );
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .6,
                    ),
                    itemBuilder: (ctx, id) {
                      return MovieContainer(snapshot: snapshot.data![id]);
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
