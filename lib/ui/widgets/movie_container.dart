import 'package:flutter/material.dart';

import '../../global.dart';
import '../../models/featured_movie_model.dart';
import '../screens/movies_details_screen.dart';

class MovieContainer extends StatelessWidget {
  final FeaturedMovieModel snapshot;

  const MovieContainer({
    Key? key,
    required this.snapshot,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => MoviesDetailsScreen(id: snapshot.id!),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
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
                  getPosterImage(snapshot.poster_path!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.black45,
                ),
                child: Text(
                  // "${movieList[id]['title']}",
                  snapshot.original_title!,
                  style: const TextStyle(
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
