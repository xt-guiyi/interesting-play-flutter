import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_post.freezed.dart';
part 'public_post.g.dart';

@freezed
abstract class PublicPost with _$PublicPost {
  const factory PublicPost({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _PublicPost;

  factory PublicPost.fromJson(Map<String, dynamic> json) =>
      _$PublicPostFromJson(json);
}
