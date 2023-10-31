import '../../components/extensions/string_ext.dart';

extension CloudinaryExt on String {
  String get optimizeSize1200 => contains('http') ? _convertUrl(1200) : this;

  String get optimizeSize999 => contains('http') ? _convertUrl(999) : this;

  String get optimizeSize600 => contains('http') ? _convertUrl(600) : this;

  String get optimizeSize400 => contains('http') ? _convertUrl(400) : this;

  String get optimizeSize200 => contains('http') ? _convertUrl(200) : this;

  String? get thumnailVideo {
    if (isPathVideo) {
      final indexLast = lastIndexOf('.');
      final url = '${substring(0, indexLast)}.jpg';
      return url;
    }
    return null;
  }

  String _convertUrl(int sizeWidth) {
    if (!contains('http')) {
      return this;
    }

    const format = 'image/upload/';
    final slips = split(format);
    return '${slips.first}${format}w_$sizeWidth,c_scale/${slips.last}';
  }
}
