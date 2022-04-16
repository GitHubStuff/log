import 'package:log/src/log_mixin.dart';

import 'src/log_enum.dart';

export 'src/log_enum.dart';

// Log in order
class Log with LogMixin {
  static A(dynamic message, {bool drawBox = false, String tag = ''}) => LogMixin.logContent(
        LogLevel.All,
        message,
        drawBox,
        tag,
      );
  static M(dynamic message, {bool drawBox = false, String tag = ''}) => LogMixin.logContent(
        LogLevel.Mark,
        message,
        drawBox,
        tag,
      );
  static T(dynamic message, {bool drawBox = false, String tag = ''}) => LogMixin.logContent(
        LogLevel.Trace,
        message,
        drawBox,
        tag,
      );
  static V(dynamic message, {bool drawBox = false, String tag = ''}) => LogMixin.logContent(
        LogLevel.Verbose,
        message,
        drawBox,
        tag,
      );
  static O(dynamic message, {bool drawBox = false, String tag = ''}) => LogMixin.logContent(
        LogLevel.Observe,
        message,
        drawBox,
        tag,
      );
  static D(dynamic message, {bool drawBox = false, String tag = ''}) => LogMixin.logContent(
        LogLevel.Debug,
        message,
        drawBox,
        tag,
      );
  static I(dynamic message, {bool drawBox = false, String tag = ''}) => LogMixin.logContent(
        LogLevel.Info,
        message,
        drawBox,
        tag,
      );
  static W(dynamic message, {bool drawBox = false, String tag = ''}) => LogMixin.logContent(
        LogLevel.Warning,
        message,
        drawBox,
        tag,
      );
  static E(dynamic message, {bool drawBox = false, String tag = ''}) => LogMixin.logContent(
        LogLevel.Error,
        message,
        drawBox,
        tag,
      );
  static F(dynamic message, {bool drawBox = false, String tag = ''}) => LogMixin.logContent(
        LogLevel.Fix,
        message,
        drawBox,
        tag,
      );
  static C(dynamic message, {bool drawBox = false, String tag = ''}) => LogMixin.logContent(
        LogLevel.Crash,
        message,
        drawBox,
        tag,
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
