import 'package:flutter/material.dart';
import 'package:netflix_redesign/global.dart';
import 'package:netflix_redesign/models/featuredtvmodel.dart';
import 'package:netflix_redesign/ui/screens/tv_details_screen.dart';

class TvContainer extends StatelessWidget {
  final FeaturedTvModel snapshot;

  const TvContainer({
    Key key,
    this.snapshot,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => TvDetailsScreen(id: snapshot.id),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
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
                  getPosterImage(snapshot.poster_path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.black45,
                ),
                child: Text(
                  // "${movieList[id]['title']}",
                  snapshot.original_title,
                  style: TextStyle(
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
