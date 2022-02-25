import 'package:flutter/material.dart';

import '../../global.dart';
import '../../models/featured_movie_model.dart';

class HomePageFeaturedWidget extends StatelessWidget {
  final AsyncSnapshot<List<FeaturedMovieModel>> snapshot;
  const HomePageFeaturedWidget({Key? key, required this.snapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (ctx, id) {
        return Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                // color: Colors.grey[400],
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    getPosterImage(snapshot.data![id].poster_path!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Colors.black45,
                  ),
                  child: Text(
                    '${snapshot.data![id].original_title}',
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
        );
      },
    );
  }
}
