
import 'package:dio/dio.dart';
import '../Models/UserDataModel.dart';


Future<List<Model>> fetchAlbum()async{
  var dio = Dio();
  final respons = await dio.get("https://jsonplaceholder.typicode.com/posts");
  if(respons.statusCode ==200){
    print('respons Data ===> ${respons.data}');
    return (respons.data as List).map((e) => Model.fromJson(e)).toList();
  }
  else {
    throw Exception('Failed to load album');
  }
}