import 'dart:io';

import 'package:bloc_pettern/Bloc/ApiBloc/ApiBloc.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../Models/UserDataModel.dart';
var url = 'https://onehappy.eastus.cloudapp.azure.com/api.yardlabs.onehappy/api/users/Login';


Future<bool>? fetchAlbum({String? email, String? password})async{
  var dio = Dio();
  var Url = 'https://onehappy.eastus.cloudapp.azure.com/api.yardlabs.onehappy/api/users/Login?';
  final uri = Uri.parse(Url).replace(queryParameters: {
  'UserId': email,
    'Password': password,
  });
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient dioClient) {
    dioClient.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);
    return dioClient;
  };  final respons = await dio.post("$uri");
  if(respons.statusCode ==200){
    print('respons statusCode ===> ${respons.statusCode}');
    print('respons Data ===> ${respons.data}');
    return true;
  }
  else {
    print('Bad respons');
    print('respons statusCode ===> ${respons.statusCode}');
    throw false;
  }
}