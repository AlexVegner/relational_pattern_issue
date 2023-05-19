const $PERIOD = 46;
const $SPACE = 32;

const $EOF = 0;

const $0 = 48;
const $7 = 55;
const $9 = 57;
const $A = 65;
const $E = 69;
const $F = 70;
const $X = 88;
const $Z = 90;
const $CARET = 94;
const $_ = 95;
const $a = 97;
const $b = 98;
const $e = 101;
const $f = 102;
const $n = 110;
const $r = 114;
const $t = 116;
const $u = 117;
const $v = 118;
const $x = 120;
const $z = 122;

bool isStringStart(int code) =>
    ($a <= code && code <= $z) || ($A <= code && code <= $Z);

bool isStringPart(int code) =>
    ($a <= code && code <= $z) ||
    ($A <= code && code <= $Z) ||
    ($0 <= code && code <= $9) ||
    (code == $_) ||
    (code == $PERIOD);
