import 'package:flutter/material.dart';
import 'package:flutter_application_4/config/network_service.dart';
import 'package:flutter_application_4/model/vdo_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  Future<VideoModel>? _vdoModel;
  String? _id;

  @override
  Widget build(BuildContext context) {
    Object? argumrnts = ModalRoute.of(context)!.settings.arguments;
    _id = argumrnts.toString();
    _vdoModel = ServiceNetwork().getClipDio(_id ?? '');
    return Scaffold(
      appBar: AppBar(
        title: Text('Youtube'),
      ),
      body: Container(
          child: FutureBuilder(
        future: _vdoModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.results?.length,
              itemBuilder: (context, index) {
                var vdo = snapshot.data?.results?[index];
                YoutubePlayerController _controller = YoutubePlayerController(
                  initialVideoId: vdo?.key ?? '',
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                    mute: true,
                  ),
                );
                return Card(
                  child: Column(
                    children: [
                      Text(vdo?.name ?? ''),
                      YoutubePlayer(
                        controller: _controller,
                        liveUIColor: Colors.amber,
                      )],
                  ),
                );
              },
            );
          } else {
            print('eroore');
            print('');
            return CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
