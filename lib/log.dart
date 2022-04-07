import 'package:log/src/log_mixin.dart';

import 'src/log_enum.dart';

export 'src/log_enum.dart';

// Log in order
class Log with LogMixin {
  static A(dynamic message, {bool drawBox = false}) => LogMixin.logContent(
        LogLevel.All,
        message,
        drawBox,
      );
  static M(dynamic message, {bool drawBox = false}) => LogMixin.logContent(
        LogLevel.Mark,
        message,
        drawBox,
      );
  static T(dynamic message, {bool drawBox = false}) => LogMixin.logContent(
        LogLevel.Trace,
        message,
        drawBox,
      );
  static V(dynamic message, {bool drawBox = false}) => LogMixin.logContent(
        LogLevel.Verbose,
        message,
        drawBox,
      );
  static O(dynamic message, {bool drawBox = false}) => LogMixin.logContent(
        LogLevel.Observe,
        message,
        drawBox,
      );
  static D(dynamic message, {bool drawBox = false}) => LogMixin.logContent(
        LogLevel.Debug,
        message,
        drawBox,
      );
  static I(dynamic message, {bool drawBox = false}) => LogMixin.logContent(
        LogLevel.Info,
        message,
        drawBox,
      );
  static W(dynamic message, {bool drawBox = false}) => LogMixin.logContent(
        LogLevel.Warning,
        message,
        drawBox,
      );
  static E(dynamic message, {bool drawBox = false}) => LogMixin.logContent(
        LogLevel.Error,
        message,
        drawBox,
      );
  static F(dynamic message, {bool drawBox = true}) => LogMixin.logContent(
        LogLevel.Fix,
        message,
        drawBox,
      );
  static C(dynamic message, {bool drawBox = false}) => LogMixin.logContent(
        LogLevel.Crash,
        message,
        drawBox,
      );

  // ignore: non_constant_identifier_names
  static Assert(bool condition, [String? message]) {
    if (condition) return;
    final String text = message ?? 'Assert';
    E(text, drawBox: true);
  }

  // Any call to Log.*, where '*' is below the set level will ignored.
  static setLoggingLevelTo(LogLevel level) => LogMixin.setLoggingLevel(level);
}
