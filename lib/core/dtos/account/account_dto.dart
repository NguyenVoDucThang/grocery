import 'package:json_annotation/json_annotation.dart';

part 'account_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountDto {
  final String username;
  final String password;
  final String email;

  AccountDto({
    required this.username,
    required this.password,
    required this.email,
  });

  factory AccountDto.fromJson(Map<String, dynamic> json) => _$AccountDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AccountDtoToJson(this);
}
