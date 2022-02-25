<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../api.dart';
import '../../global.dart';
import '../../models/movie_model.dart';
import '../widgets/hero.dart';
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:netflix_redesign/api.dart';
import 'package:netflix_redesign/global.dart';
import 'package:netflix_redesign/models/moviemodel.dart';
import 'package:netflix_redesign/ui/widgets/hero.dart';
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626

class MoviesDetailsScreen extends StatefulWidget {
  final int id;

<<<<<<< HEAD
  const MoviesDetailsScreen({Key? key, required this.id}) : super(key: key);
=======
  const MoviesDetailsScreen({Key key, this.id}) : super(key: key);
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626

  @override
  _MoviesDetailsScreenState createState() => _MoviesDetailsScreenState();
}

class _MoviesDetailsScreenState extends State<MoviesDetailsScreen> {
<<<<<<< HEAD
  late Api _api;
  late Future<MovieModel> movieModel;
=======
  Api _api;
  Future<MovieModel> movieModel;
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _api = Api();
    movieModel = _api.getMovieInfo(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder<MovieModel>(
          future: movieModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    MyHero(
<<<<<<< HEAD
                      imgUrl: getPosterImage(snapshot.data!.poster_path!),
                    ),
                    const SizedBox(
=======
                      imgUrl: getPosterImage(snapshot.data.poster_path),
                    ),
                    SizedBox(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                      height: 11,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: <Widget>[
                          Text(
<<<<<<< HEAD
                            '${snapshot.data!.original_title}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          const SizedBox(
=======
                            '${snapshot.data.original_title}',
                            style: Theme.of(context).textTheme.headline,
                          ),
                          SizedBox(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                            height: 7,
                          ),
                          RichText(
                            text: TextSpan(
                              children: List.generate(
<<<<<<< HEAD
                                snapshot.data!.genre!.length,
                                (i) {
                                  return TextSpan(
                                      text:
                                          '${snapshot.data!.genre![i]['name']}');
=======
                                snapshot.data.genre.length,
                                (i) {
                                  return TextSpan(
                                      text:
                                          '${snapshot.data.genre[i]['name']}');
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                                },
                              ),
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
<<<<<<< HEAD
                          const SizedBox(
                            height: 9,
                          ),
                          RatingBar.builder(
                            initialRating: snapshot.data!.rating!,
=======
                          SizedBox(
                            height: 9,
                          ),
                          RatingBar(
                            initialRating: snapshot.data.rating,
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 10,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
<<<<<<< HEAD
                            itemBuilder: (context, _) => const Icon(
=======
                            itemBuilder: (context, _) => Icon(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemSize: 25,
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
<<<<<<< HEAD
                          const SizedBox(
=======
                          SizedBox(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                            height: 13,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Year',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(
<<<<<<< HEAD
                                    '${DateTime.parse(snapshot.data!.release_date!).year}',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
=======
                                    '${DateTime.parse(snapshot.data.release_date).year}',
                                    style: Theme.of(context).textTheme.subhead,
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Country',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(
<<<<<<< HEAD
                                    '${snapshot.data!.country}',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
=======
                                    '${snapshot.data.country}',
                                    style: Theme.of(context).textTheme.subhead,
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Length',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(
<<<<<<< HEAD
                                    '${snapshot.data!.runtime} min',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
=======
                                    '${snapshot.data.runtime} min',
                                    style: Theme.of(context).textTheme.subhead,
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                                  ),
                                ],
                              ),
                            ],
                          ),
<<<<<<< HEAD
                          const SizedBox(
                            height: 13,
                          ),
                          Text(
                            '${snapshot.data!.overview}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .apply(fontSizeFactor: 1.2),
                          ),
                          const SizedBox(
=======
                          SizedBox(
                            height: 13,
                          ),
                          Text(
                            '${snapshot.data.overview}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .apply(fontSizeFactor: 1.2),
                          ),
                          SizedBox(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                            height: 13,
                          ),
                        ],
                      ),
                    ),
<<<<<<< HEAD
                    const SizedBox(
=======
                    SizedBox(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                      height: 13,
                    ),
                  ],
                ),
              );
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
    );
  }
}
