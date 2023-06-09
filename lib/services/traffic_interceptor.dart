import 'package:dio/dio.dart';

class TrafficInterceptor extends Interceptor {
  final accessToken =
      'pk.eyJ1Ijoic2FtdWVsY285OSIsImEiOiJjbDU1dGtobDYwdGZ4M2Rwb2FkYjVlc3hsIn0.YqoHNW2HzbDM0h51n9MzkQ';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': accessToken,
    });
    super.onRequest(options, handler);
  }
}
