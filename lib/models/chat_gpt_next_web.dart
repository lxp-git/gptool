import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_gpt_next_web.freezed.dart';
part 'chat_gpt_next_web.g.dart';

@freezed
class ChatGPTNextWeb with _$ChatGPTNextWeb {
  factory ChatGPTNextWeb(
      {required String domain,
      required String path,
      required String accessCode}) = _ChatGPTNextWeb;

  factory ChatGPTNextWeb.fromJson(Map<String, Object?> json) =>
      _$ChatGPTNextWebFromJson(json);
}
