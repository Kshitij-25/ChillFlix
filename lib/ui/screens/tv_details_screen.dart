import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:netflix_redesign/api.dart';
import 'package:netflix_redesign/global.dart';
import 'package:netflix_redesign/models/tvmodel.dart';

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
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            primary: true,
            expandedHeight: MediaQuery.of(context).size.height / 1.4,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                child: FutureBuilder(
                  future: tvModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Stack(
                        fit: StackFit.loose,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 1.4,
                            child: Center(
                              child: Container(
                                height: 64,
                                width: 64,
                                child: OutlineButton(
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(32),
                                    ),
                                  ),
                                  child: Container(
                                    height: 64,
                                    width: 64,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(0, 0, 0, 0.3),
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 48,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    getPosterImage(snapshot.data.poster_path),
                                  ),
                                  fit: BoxFit.fitWidth),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 1.4,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  stops: [0.1, 0.4, 1.0],
                                  colors: [
                                    Colors.black54,
                                    Colors.transparent,
                                    Colors.black
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                  bottom:
                                      MediaQuery.of(context).size.height / 4.6,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "${snapshot.data.original_name}",
                                      maxLines: 3,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height / 2,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
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
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RatingBar(
                                    initialRating: snapshot.data.rating,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 10,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4),
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
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Year',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                          Text(
                                            '${DateTime.parse(snapshot.data.first_air_date).year}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subhead,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Country',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                          Text(
                                            '${snapshot.data.origin_country}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subhead,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${snapshot.data.overview}',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .apply(fontSizeFactor: 1.2),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
