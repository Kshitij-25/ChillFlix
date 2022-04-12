import 'package:flutter/material.dart';

import '../../api.dart';
import '../../models/featured_movie_model.dart';
import '../../models/featured_tv_model.dart';
import '../widgets/section_container.dart';
import '../widgets/tv_container.dart';

class TVShowsScreen extends StatefulWidget {
  const TVShowsScreen({Key? key}) : super(key: key);

  @override
  State<TVShowsScreen> createState() => _TVShowsScreenState();
}

class _TVShowsScreenState extends State<TVShowsScreen> {
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
          "Tv Shows",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: SectionContainer(
          widget: const Icon(Icons.menu),
          sectionTitle: "",
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<List<FeaturedTvModel>>(
              future: featuredTv,
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
                      return TvContainer(snapshot: snapshot.data![id]);
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
