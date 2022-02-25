import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../api.dart';
import '../../global.dart';
import '../../models/movie_model.dart';
import '../widgets/hero.dart';

class MoviesDetailsScreen extends StatefulWidget {
  final int id;

  const MoviesDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  _MoviesDetailsScreenState createState() => _MoviesDetailsScreenState();
}

class _MoviesDetailsScreenState extends State<MoviesDetailsScreen> {
  late Api _api;
  late Future<MovieModel> movieModel;

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
                      imgUrl: getPosterImage(snapshot.data!.poster_path!),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: <Widget>[
                          Text(
                            '${snapshot.data!.original_title}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          RichText(
                            text: TextSpan(
                              children: List.generate(
                                snapshot.data!.genre!.length,
                                (i) {
                                  return TextSpan(
                                      text:
                                          '${snapshot.data!.genre![i]['name']}');
                                },
                              ),
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          RatingBar.builder(
                            initialRating: snapshot.data!.rating!,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 10,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemSize: 25,
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          const SizedBox(
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
                                    '${DateTime.parse(snapshot.data!.release_date!).year}',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
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
                                    '${snapshot.data!.country}',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
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
                                    '${snapshot.data!.runtime} min',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                            height: 13,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
