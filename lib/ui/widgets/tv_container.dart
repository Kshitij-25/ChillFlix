import 'package:flutter/material.dart';
<<<<<<< HEAD

import '../../global.dart';
import '../../models/featured_tv_model.dart';
import '../screens/tv_details_screen.dart';
=======
import 'package:netflix_redesign/global.dart';
import 'package:netflix_redesign/models/featuredtvmodel.dart';
import 'package:netflix_redesign/ui/screens/tv_details_screen.dart';
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626

class TvContainer extends StatelessWidget {
  final FeaturedTvModel snapshot;

  const TvContainer({
<<<<<<< HEAD
    Key? key,
    required this.snapshot,
=======
    Key key,
    this.snapshot,
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
<<<<<<< HEAD
            builder: (ctx) => TvDetailsScreen(id: snapshot.id!),
=======
            builder: (ctx) => TvDetailsScreen(id: snapshot.id),
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
<<<<<<< HEAD
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
=======
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
            BoxShadow(
              blurRadius: 5.0,
              // color: Colors.grey[400],
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  // movieList[id]['img'],
<<<<<<< HEAD
                  getPosterImage(snapshot.poster_path!),
=======
                  getPosterImage(snapshot.poster_path),
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
<<<<<<< HEAD
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
=======
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.black45,
                ),
                child: Text(
                  // "${movieList[id]['title']}",
<<<<<<< HEAD
                  snapshot.original_title!,
                  style: const TextStyle(
=======
                  snapshot.original_title,
                  style: TextStyle(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                    color: Colors.white,
                    fontSize: 23,
                  ),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
