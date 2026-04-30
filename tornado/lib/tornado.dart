library tornado;

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class BaseConstants {
  static const ACCESS_TOKEN = "ACCESS_TOKEN";
  static const AUTHORIZATION = "AUTHORIZATION";
  static const END_PROMPT = "";//"已经到底了";
  static const LOADING = "Loading...";//"加载中...";

  /// debug日志
  static var DEBUG = true;
}
