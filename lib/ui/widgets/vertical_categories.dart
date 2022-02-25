import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix_redesign/api.dart';
import 'package:netflix_redesign/models/genremodel.dart';

class VerticalCategories extends StatefulWidget {
  @override
  _VerticalCategoriesState createState() => _VerticalCategoriesState();
}

class _VerticalCategoriesState extends State<VerticalCategories> {
  Future<List<GenreModel>> genreList;
  Api _api;

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
          itemCount: snapshot.data.length,
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
                    child: Text('${snapshot.data[id].name}',style: TextStyle(fontSize: 18),),
                  ),
                ),
                if (_active == id)
                  SizedBox(
                    width: 3,
                  ),
                if (_active == id)
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
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
