import 'package:flutter/material.dart';

import '../../api.dart';
import '../../models/genre_model.dart';

class VerticalCategories extends StatefulWidget {
  @override
  _VerticalCategoriesState createState() => _VerticalCategoriesState();
}

class _VerticalCategoriesState extends State<VerticalCategories> {
  late Future<List<GenreModel>> genreList;
  late Api _api;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _api = Api();
    genreList = _api.getGenreList();
  }

  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GenreModel>>(
      future: genreList,
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (ctx, id) => GestureDetector(
            onTap: () {
              setState(() {
                _active = id;
              });
            },
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 9),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      '${snapshot.data![id].name}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                if (_active == id)
                  const SizedBox(
                    width: 3,
                  ),
                if (_active == id)
                  Container(
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
