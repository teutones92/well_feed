class YogaPosesModel {
  final int? id;
  final String? englishName;
  final String? sanskritNameAdapted;
  final String? sanskritName;
  final String? translationName;
  final String? poseDescription;
  final String? poseBenefits;
  final String? urlSvg;
  final String? urlPng;
  final String? urlSvgAlt;
  const YogaPosesModel(
      {this.id,
      this.englishName,
      this.sanskritNameAdapted,
      this.sanskritName,
      this.translationName,
      this.poseDescription,
      this.poseBenefits,
      this.urlSvg,
      this.urlPng,
      this.urlSvgAlt});
  YogaPosesModel copyWith(
      {int? id,
      String? englishName,
      String? sanskritNameAdapted,
      String? sanskritName,
      String? translationName,
      String? poseDescription,
      String? poseBenefits,
      String? urlSvg,
      String? urlPng,
      String? urlSvgAlt}) {
    return YogaPosesModel(
        id: id ?? this.id,
        englishName: englishName ?? this.englishName,
        sanskritNameAdapted: sanskritNameAdapted ?? this.sanskritNameAdapted,
        sanskritName: sanskritName ?? this.sanskritName,
        translationName: translationName ?? this.translationName,
        poseDescription: poseDescription ?? this.poseDescription,
        poseBenefits: poseBenefits ?? this.poseBenefits,
        urlSvg: urlSvg ?? this.urlSvg,
        urlPng: urlPng ?? this.urlPng,
        urlSvgAlt: urlSvgAlt ?? this.urlSvgAlt);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'english_name': englishName,
      'sanskrit_name_adapted': sanskritNameAdapted,
      'sanskrit_name': sanskritName,
      'translation_name': translationName,
      'pose_description': poseDescription,
      'pose_benefits': poseBenefits,
      'url_svg': urlSvg,
      'url_png': urlPng,
      'url_svg_alt': urlSvgAlt
    };
  }

  static YogaPosesModel fromJson(Map<String, Object?> json) {
    return YogaPosesModel(
        id: json['id'] == null ? null : json['id'] as int,
        englishName: json['english_name'] == null
            ? null
            : json['english_name'] as String,
        sanskritNameAdapted: json['sanskrit_name_adapted'] == null
            ? null
            : json['sanskrit_name_adapted'] as String,
        sanskritName: json['sanskrit_name'] == null
            ? null
            : json['sanskrit_name'] as String,
        translationName: json['translation_name'] == null
            ? null
            : json['translation_name'] as String,
        poseDescription: json['pose_description'] == null
            ? null
            : json['pose_description'] as String,
        poseBenefits: json['pose_benefits'] == null
            ? null
            : json['pose_benefits'] as String,
        urlSvg: json['url_svg'] == null ? null : json['url_svg'] as String,
        urlPng: json['url_png'] == null ? null : json['url_png'] as String,
        urlSvgAlt:
            json['url_svg_alt'] == null ? null : json['url_svg_alt'] as String);
  }
}
