import 'package:dio/dio.dart';

class PlacesInterceptor extends Interceptor {
  final accessToken =
      'pk.eyJ1Ijoic2FtdWVsY285OSIsImEiOiJjbDU1dGtobDYwdGZ4M2Rwb2FkYjVlc3hsIn0.YqoHNW2HzbDM0h51n9MzkQ';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'access_token': accessToken,
      'language': 'es',
      'limit': 7,
    });
    super.onRequest(options, handler);
  }
}
