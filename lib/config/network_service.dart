import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_application_4/model/airing_model.dart';
import 'package:flutter_application_4/model/pop_model.dart';
import 'package:flutter_application_4/model/vdo_model.dart';

import 'api.dart';

class ServiceNetwork {
  final dio = Dio();

  Future<AiringModel> getAiringDio() async {
    final response = await dio.get(API.AIRING_URL);
    if (response.statusCode == 200) {
      print(response.data);
      return airingModelFromJson(jsonEncode(response.data));
    }
    throw Exception('Network  Failed');
  }


  Future<PopModel> getPopularDio() async {
    final response = await dio.get(API.POPULAR_URL);
    if (response.statusCode == 200) {
      print(response.data);
      return popModelFromJson(jsonEncode(response.data));
    }
    throw Exception('Network  Failed');
  }



  Future<VideoModel> getClipDio(String id) async {
    final response = await dio.get(API.URLBASE + id + API.VDO_URL);
    if (response.statusCode == 200) {
      print(response.data);
      print(response.statusCode);
      return videoModelFromJson(json.encode(response.data));
    }
    throw Exception('Network  Failed');
  }

}
