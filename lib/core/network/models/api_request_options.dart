import 'package:dio/dio.dart';

class ApiRequestOptions extends Options {
  ApiRequestOptions({this.showGlobalErrorToast = true})
    : super(extra: {_showGlobalErrorToastKey: showGlobalErrorToast});

  static const _showGlobalErrorToastKey = 'showGlobalErrorToast';
  final bool showGlobalErrorToast;

  static ApiRequestOptions noGlobalErrorToast() =>
      ApiRequestOptions(showGlobalErrorToast: false);

  static ApiRequestOptions globalErrorToast({bool enabled = true}) =>
      ApiRequestOptions(showGlobalErrorToast: enabled);

  static bool shouldShowGlobalErrorToast(RequestOptions options) =>
      options.extra[_showGlobalErrorToastKey] as bool? ?? true;
}
