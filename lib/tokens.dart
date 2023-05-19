sealed class Token {
  final int index;
  const Token(this.index);
}

class SkipToken extends Token {
  final int code;
  SkipToken(super.index, this.code);
  @override
  String toString() => '${String.fromCharCode(code)}($code)';
}

class StringToken extends Token {
  final String value;
  StringToken(super.index, this.value);
  @override
  String toString() => value;
}
