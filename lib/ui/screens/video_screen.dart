import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  static const route = '/videoapp';
<<<<<<< HEAD

  const VideoApp({Key? key}) : super(key: key);
=======
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
<<<<<<< HEAD
  late VideoPlayerController _controller;
=======
  VideoPlayerController _controller;
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );
    _controller = VideoPlayerController.network(
        "http://techslides.com/demos/sample-videos/small.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
<<<<<<< HEAD
            child: _controller.value.isInitialized
=======
            child: _controller.value.initialized
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton(
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                }),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
<<<<<<< HEAD
                icon: const Icon(
=======
                icon: Icon(
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _controller.dispose();
  }
}
