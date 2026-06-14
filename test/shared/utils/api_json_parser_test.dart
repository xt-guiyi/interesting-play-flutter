import 'package:flutter_test/flutter_test.dart';
import 'package:interesting_play_flutter/shared/utils/api_json_parser.dart';

class TestItem {
  const TestItem({required this.id, required this.name});

  final int id;
  final String name;

  factory TestItem.fromJson(Map<String, dynamic> json) {
    return TestItem(id: json['id'] as int, name: json['name'] as String);
  }
}

void main() {
  test('parseApiObjectResponse parses object data', () {
    final response = parseApiObjectResponse({
      'code': 200,
      'message': 'ok',
      'data': {'id': 1, 'name': 'Flutter'},
    }, TestItem.fromJson);

    expect(response.code, 200);
    expect(response.data?.id, 1);
    expect(response.data?.name, 'Flutter');
  });

  test('parseApiObjectListResponse parses list data', () {
    final response = parseApiObjectListResponse({
      'code': 200,
      'data': [
        {'id': 1, 'name': 'Flutter'},
        {'id': 2, 'name': 'Riverpod'},
      ],
    }, TestItem.fromJson);

    expect(response.data, hasLength(2));
    expect(response.data?[1].name, 'Riverpod');
  });

  test('parseApiPageObjectListResponse parses paged list data', () {
    final response = parseApiPageObjectListResponse({
      'code': 200,
      'data': {
        'page': 1,
        'pageSize': 10,
        'total': 2,
        'data': [
          {'id': 1, 'name': 'Flutter'},
          {'id': 2, 'name': 'Riverpod'},
        ],
      },
    }, TestItem.fromJson);

    expect(response.data?.page, 1);
    expect(response.data?.pageSize, 10);
    expect(response.data?.total, 2);
    expect(response.data?.data[0].name, 'Flutter');
  });
}
