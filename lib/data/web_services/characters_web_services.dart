// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class CharactersWebServices {
  late Dio dio;
  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: AppStrings.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 200 * 1000, //60 seconds
      receiveTimeout: 200 * 1000,
    );

    dio = Dio(options);
  }

  Future<dynamic> getAllCharacters() async {
      Response response = await dio.get('character'); //end points
      print(response.data);
      return response.data;
    
  }
}
