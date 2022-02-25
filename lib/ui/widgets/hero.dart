import 'package:flutter/material.dart';
<<<<<<< HEAD

import '../screens/video_screen.dart';
=======
import 'package:netflix_redesign/ui/screens/video_screen.dart';
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626

class MyHero extends StatelessWidget {
  final String imgUrl;

<<<<<<< HEAD
  const MyHero({Key? key, required this.imgUrl}) : super(key: key);
=======
  const MyHero({Key key, this.imgUrl}) : super(key: key);
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 3),
      height: MediaQuery.of(context).size.height / 1.7,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 23,
            left: 0,
            right: 0,
            top: 0,
            child: ClipPath(
              clipper: CustomClip(),
              child: Image.network(
                '$imgUrl',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            child: Container(
              color: Colors.black.withOpacity(.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
<<<<<<< HEAD
                    icon: const Icon(
=======
                    icon: Icon(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'ChillFlix',
                    style: Theme.of(context)
                        .textTheme
<<<<<<< HEAD
                        .headline6!
                        .apply(color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(
=======
                        .title
                        .apply(color: Colors.white),
                  ),
                  IconButton(
                    icon: Icon(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, VideoApp.route);
              },
              child: Container(
<<<<<<< HEAD
                decoration: const BoxDecoration(
=======
                decoration: BoxDecoration(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(15),
<<<<<<< HEAD
                child: const Icon(
=======
                child: Icon(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                  Icons.play_arrow,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 5,
            right: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
<<<<<<< HEAD
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.share),
=======
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.share),
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 31);
    path.quadraticBezierTo(
        size.width / 2, size.height + 31, size.width, size.height - 31);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
