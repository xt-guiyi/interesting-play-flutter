import 'package:flutter_test/flutter_test.dart';
import 'package:interesting_play_flutter/shared/models/public_post.dart';

void main() {
  test('PublicPost parses JSONPlaceholder post json', () {
    final post = PublicPost.fromJson({
      'userId': 1,
      'id': 1,
      'title': 'sunt aut facere',
      'body': 'quia et suscipit',
    });

    expect(post.userId, 1);
    expect(post.id, 1);
    expect(post.title, 'sunt aut facere');
    expect(post.body, 'quia et suscipit');
  });
}
