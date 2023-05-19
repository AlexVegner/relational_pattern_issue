import 'package:relational_pattern_issue/tokens.dart';

import 'charts.dart';

class Lexer {
  List<Token> call(String text) {
    _Scanner scanner = _Scanner(text);
    List<Token> tokens = [];
    Token? token = scanner.scanToken();
    while (token != null) {
      tokens.add(token);
      token = scanner.scanToken();
    }
    return tokens;
  }
}

class _Scanner {
  final String input;
  final int length;

  int peek = 0;
  int index = -1;

  _Scanner(this.input) : length = input.length {
    advance();
  }

  void advance() {
    peek = ++index >= length ? $EOF : input.codeUnitAt(index);
  }

  Token? scanToken() {
    // Skip whitespace.
    while (peek <= $SPACE) {
      if (++index >= length) {
        peek = $EOF;
        return null;
      } else {
        peek = input.codeUnitAt(index);
      }
    }

    int start = index;
    final token = switch (peek) {
      // ...
      (>= $a && <= $z) ||
      (>= $A && <= $Z) ||
      (>= $0 && <= $9) =>
        scanString(start),
      _ => SkipToken(start, peek),
    };
    if (start == index) {
      advance();
    }
    return token;
  }

  Token scanString(int start) {
    advance(); // Skip initial digit.
    while (isStringPart(peek)) {
      advance();
    }
    return StringToken(start, input.substring(start, index));
  }
}
