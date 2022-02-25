import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final String sectionTitle;
  const SectionContainer(
<<<<<<< HEAD
      {Key? key, required this.child, required this.sectionTitle})
=======
      {Key key, @required this.child, @required this.sectionTitle})
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
<<<<<<< HEAD
      padding: const EdgeInsets.only(left: 15.0),
=======
      padding: EdgeInsets.only(left: 15.0),
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                sectionTitle,
<<<<<<< HEAD
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
              const SizedBox(width: 15.0),
            ],
          ),
          const SizedBox(
=======
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios),
              SizedBox(width: 15.0),
            ],
          ),
          SizedBox(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
            height: 13,
          ),
          child,
        ],
      ),
    );
  }
}
