class LanguageModel {
  const LanguageModel({
    required this.code,
    required this.name,
  });

  final String code;
  final String name;

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        name: json['name'] as String? ?? "",
        code: json['code'] as String? ?? "",
      );
}



