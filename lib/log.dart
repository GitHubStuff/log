import 'package:log/src/log_mixin.dart';

export 'src/dictionary_enum.dart';
export 'src/log_mixin.dart';

// Log in order
class Log with LogMixin {
  static A(dynamic message, {String tag = '', bool showDivider = false}) => LogMixin.verifyLoggingUsingMessageLevel(
        LogLevel.All,
        message,
        tag,
        showDivider,
      );
  static M(dynamic message, {String tag = '', bool showDivider = false}) => LogMixin.verifyLoggingUsingMessageLevel(
        LogLevel.Mark,
        message,
        tag,
        showDivider,
      );
  static T(dynamic message, {String tag = '', bool showDivider = false}) => LogMixin.verifyLoggingUsingMessageLevel(
        LogLevel.Trace,
        message,
        tag,
        showDivider,
      );
  static V(dynamic message, {String tag = '', bool showDivider = false}) => LogMixin.verifyLoggingUsingMessageLevel(
        LogLevel.Verbose,
        message,
        tag,
        showDivider,
      );
  static D(dynamic message, {String tag = '', bool showDivider = false}) => LogMixin.verifyLoggingUsingMessageLevel(
        LogLevel.Debug,
        message,
        tag,
        showDivider,
      );
  static I(dynamic message, {String tag = '', bool showDivider = false}) => LogMixin.verifyLoggingUsingMessageLevel(
        LogLevel.Info,
        message,
        tag,
        showDivider,
      );
  static W(dynamic message, {String tag = '', bool showDivider = false}) => LogMixin.verifyLoggingUsingMessageLevel(
        LogLevel.Warning,
        message,
        tag,
        showDivider,
      );
  static E(dynamic message, {String tag = '', bool showDivider = false}) => LogMixin.verifyLoggingUsingMessageLevel(
        LogLevel.Error,
        message,
        tag,
        showDivider,
      );
  static F(dynamic message, {String tag = '', bool showDivider = false}) => LogMixin.verifyLoggingUsingMessageLevel(
        LogLevel.Fix,
        message,
        tag,
        showDivider,
      );
  static C(dynamic message, {String tag = '', bool showDivider = false}) => LogMixin.verifyLoggingUsingMessageLevel(
        LogLevel.Crash,
        message,
        tag,
        showDivider,
      );

  // Any call to Log.?, where '?' is below the set level will ignored.
  static setLoggingLevelTo(LogLevel level) => LogMixin.setLogginLevel(level);
}
