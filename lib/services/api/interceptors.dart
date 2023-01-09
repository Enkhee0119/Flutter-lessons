import 'package:dio/dio.dart';

class CustomInterceptors extends InterceptorsWrapper {
  CustomInterceptors()
      : super(onRequest: (options, handler) {
          print("on request");
          if (options.uri.toString() == "https://pub.dev/packages/dio") {
            return handler.reject(
                DioError(requestOptions: options, type: DioErrorType.cancel));
          }
          return handler.next(options);
        }, onResponse: (response, handler) {
          print("on response");
          return handler.next(response);
        }, onError: (DioError e, handler) {
          print("on error");
          return handler.next(e);
        });
}
