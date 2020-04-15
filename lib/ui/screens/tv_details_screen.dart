import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:netflix_redesign/api.dart';
import 'package:netflix_redesign/global.dart';
import 'package:netflix_redesign/models/moviemodel.dart';
import 'package:netflix_redesign/models/tvmodel.dart';
import 'package:netflix_redesign/ui/widgets/hero.dart';

class TvDetailsScreen extends StatefulWidget {
  final int id;

  const TvDetailsScreen({Key key, this.id}) : super(key: key);

  @override
  _TvDetailsScreenState createState() => _TvDetailsScreenState();
}

class _TvDetailsScreenState extends State<TvDetailsScreen> {
  Api _api;
  Future<TvModel> tvModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _api = Api();
    tvModel = _api.getTvInfo(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: FutureBuilder<TvModel>(
          future: tvModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    MyHero(
                      imgUrl: getPosterImage(snapshot.data.poster_path),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: <Widget>[
                          Text(
                            '${snapshot.data.original_name}',
                            style: Theme.of(context).textTheme.headline,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          RichText(
                            text: TextSpan(
                              children: List.generate(
                                snapshot.data.genre.length,
                                (i) {
                                  return TextSpan(
                                      text:
                                          '${snapshot.data.genre[i]['name']}');
                                },
                              ),
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          RatingBar(
                            initialRating: snapshot.data.rating,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 10,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemSize: 25,
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Year',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(
                                    '${DateTime.parse(snapshot.data.first_air_date).year}',
                                    style: Theme.of(context).textTheme.subhead,
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
                                    '${snapshot.data.origin_country}',
                                    style: Theme.of(context).textTheme.subhead,
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                            height: 13,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
