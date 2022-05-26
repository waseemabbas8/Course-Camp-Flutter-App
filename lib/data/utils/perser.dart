import 'dart:convert';

class Parser {
  Parser._();

  static List<T> toList<T>(String jsonString, MapperFunc<T> mapper) =>
      jsonDecode(jsonString)
          .cast<Map<String, dynamic>>()
          .map<T>((json) => mapper.call(json))
          .toList();
}

typedef MapperFunc<T> = T Function(Map<String, dynamic>);
