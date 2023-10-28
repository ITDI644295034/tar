import 'package:flutter/material.dart';
import 'package:flutter_application_4/config/approute.dart';
import 'package:flutter_application_4/config/network_service.dart';
import 'package:flutter_application_4/model/airing_model.dart';

class AiringPage extends StatefulWidget {
  const AiringPage({super.key});

  @override
  State<AiringPage> createState() => _AiringPageState();
}

class _AiringPageState extends State<AiringPage> {
  Future<AiringModel>? _airingModel;
  @override
  void initState() {
    _airingModel = ServiceNetwork().getAiringDio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AiringMovie'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _airingModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.results?.length,
                itemBuilder: (context, index) {
                  var movie = snapshot.data!.results?[index];
                  return Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.detailAiringRoute,arguments: movie);
                      },
                      title: Text(movie?.name ?? ''),
                      leading: Image.network(
                        'https://image.tmdb.org/t/p/w500' +
                            (movie?.posterPath ?? ''),
                      ),
                      subtitle: movie?.overview != ''?Text(movie?.overview ?? '',maxLines: 3,):Text('Nohing Overview')
                    ),
                  );
                },
              );
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
