import 'arb_item.dart';

class ArbFile {
  // "@@locale": "en_US",
  final String locale;

  // final List<ArbItem> items;
  final Map<String, ArbItem> items;

  ArbFile({
    required this.locale,
    required this.items,
  });

  static ArbFile fromJson(Map<String, dynamic> json) {
    final locale = json['@@locale'] ?? '';
    final keys =
        json.keys.where((element) => !element.startsWith("@")).toList();
    Map<String, ArbItem> items = {};
    for (var key in keys) {
      String desc = '';
      final explain = Map<String, dynamic>.from(json['@$key'] ?? {});
      if (explain.isNotEmpty) {
        desc = explain['description'] ?? '';
      }

      ArbItem item = ArbItem(
        name: key,
        value: json[key] ?? '',
        description: desc,
      );

      items[item.name] = item;
    }

    return ArbFile(locale: locale, items: items);
  }
}
