import 'package:flutter/material.dart';
import 'package:flutter_application_4/config/approute.dart';
import 'package:flutter_application_4/config/network_service.dart';
import 'package:flutter_application_4/model/pop_model.dart';

class PoppularPage extends StatefulWidget {
  const PoppularPage({super.key});

  @override
  State<PoppularPage> createState() => _AiringPageState();
}

class _AiringPageState extends State<PoppularPage> {
  Future<PopModel>? _popularModel;
  @override
  void initState() {
    _popularModel = ServiceNetwork().getPopularDio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopularMovie'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _popularModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.results?.length,
                itemBuilder: (context, index) {
                  var movie = snapshot.data!.results?[index];
                  return Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.detailPopRoute,arguments: movie);
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
