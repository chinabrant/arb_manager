/// 一个多语言项目
/// "hello": "Hello {userName}",
/// "@hello": {
///   "description": "A message with a single parameter",
///   "placeholders": {
///     "userName": {
///       "type": "String",
///       "example": "Bob"
///     }
///   }
/// }
class ArbItem {
  final String name;
  final String value;
  final String description;

  ArbItem({
    required this.name,
    required this.value,
    required this.description,
  });

  ArbItem copyWith({
    String? name,
    String? value,
    String? description,
  }) {
    return ArbItem(
      name: name ?? this.name,
      value: value ?? this.value,
      description: description ?? this.description,
    );
  }
}
