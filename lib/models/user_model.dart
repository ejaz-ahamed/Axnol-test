import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class User with _$User {
  factory User({
    required String firstName,
    required String lastName,
    required String address,
    required String email,
    required String mobile,
    required String details,
  }) = _User;
}
