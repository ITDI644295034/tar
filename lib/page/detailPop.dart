import 'package:flutter/material.dart';
import 'package:flutter_application_4/config/approute.dart';
import 'package:flutter_application_4/model/pop_model.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_tts/flutter_tts.dart';


class PopularDetailPage extends StatefulWidget {
  const PopularDetailPage({super.key});

  @override
  State<PopularDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<PopularDetailPage> {
  Result? _movieModel;
  late FlutterTts tts;
  String movieOverview = '';

  @override
  void initState() {
    super.initState();
    tts = FlutterTts();
    tts.setLanguage("en-US");
    tts.setPitch(1.0);
    tts.setSpeechRate(1.0);
    _movieModel = Result();
  }

  @override
  Widget build(BuildContext context) {
    Object? argumrnts = ModalRoute.of(context)!.settings.arguments;
    if (argumrnts is Result) {
      _movieModel = argumrnts;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_movieModel?.name ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500' +
                      (_movieModel?.posterPath ?? ''),
                ),
              ),
              margin: EdgeInsets.all(20),
            ),
            Text(
              'popularity : ' + (_movieModel?.popularity.toString() ?? ''),
              style: TextStyle(fontSize: 18),
            ),
            Container(
              height: 50,
              child: RatingStars(
                valueLabelVisibility: false,
                starSize: 20,
                starCount: 5,
                value: _movieModel!.voteAverage!.toDouble(),
              ),
            ),
            Container(
              child: Card(
                color: Colors.lime,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 5,
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Overview',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        _movieModel?.overview.toString() ?? '',
                        style: TextStyle(fontFamily: 'Inter'),
                      ),
                    ),
                    Row(
                      children: [
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  movieOverview =
                                      _movieModel?.overview.toString() ?? '';
                                  speak(movieOverview);
                                },
                                icon: Icon(
                                  Icons.volume_down,
                                  color: Colors.deepOrange,
                                )),
                            IconButton(
                                onPressed: () {
                                  tts.stop();
                                },
                                icon: Icon(
                                  Icons.volume_off,
                                  color: Colors.deepOrange,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.deepOrange,
                                )),
                            IconButton(
                                onPressed: () {

                                },
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.deepOrange,
                                )),
                          
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Action1',
                                  style: TextStyle(color: Colors.deepOrange),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.clipPopRoute,
              arguments: _movieModel?.id);
        },
        backgroundColor: Colors.deepOrangeAccent,
        child: Text('VDO'),
      ),
    );
  }

  void speak(String text) {
    tts.speak(text);
    print(text);
  }

  void stop() {
    tts.stop();
  }

  
}
