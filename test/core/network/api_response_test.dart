import 'package:flutter_test/flutter_test.dart';
import 'package:interesting_play_flutter/core/network/api_exception.dart';
import 'package:interesting_play_flutter/core/network/api_response.dart';

void main() {
  test('unwrapApiResponse returns data for successful business response', () {
    final response = ApiResponse(code: 200, data: 'token');

    expect(unwrapApiResponse(response, '登录失败'), 'token');
  });

  test(
    'unwrapApiResponse throws ApiException for failed business response',
    () {
      final response = ApiResponse<String>(code: 10001, message: '业务失败');

      expect(
        () => unwrapApiResponse(response, '默认失败'),
        throwsA(
          isA<ApiException>()
              .having((error) => error.message, 'message', '业务失败')
              .having((error) => error.statusCode, 'statusCode', 10001),
        ),
      );
    },
  );
}
