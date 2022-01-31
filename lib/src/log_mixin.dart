import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum LogLevel {
  All,
  Mark,
  Trace,
  Verbose,
  Debug,
  Info,
  Warning,
  Error,
  Fix,
  Crash,
  None,
}

extension _LogLevel on LogLevel {
  static Map<LogLevel, String> _icon = {
    LogLevel.All: '🔗',
    LogLevel.Mark: '✅',
    LogLevel.Trace: '🧭',
    LogLevel.Verbose: '📣',
    LogLevel.Debug: '🐞',
    LogLevel.Info: '📝',
    LogLevel.Fix: '🚧',
    LogLevel.Warning: '🚸',
    LogLevel.Error: '❌',
    LogLevel.Crash: '🆘',
    LogLevel.None: '',
  };
  String get icon => _icon[this] ?? '';
}

mixin LogMixin {
  //---- PUBLIC METHODS
  static setLogginLevel(LogLevel level) {
    _logLevels = Set.from(LogLevel.values);
    List<String> theLines = ['Log Level set to ${level.icon} ${level.name}'];
    for (LogLevel levelItem in LogLevel.values) {
      if (levelItem == level) {
        bool include = false;
        for (LogLevel skipPoint in LogLevel.values) {
          if (skipPoint == level) include = true;
          if (include && skipPoint != LogLevel.None) {
            theLines.add('✅ ${skipPoint.icon} ${skipPoint.name}');
          }
        }
        _buildLines(theLines, '🔴', false);
        return;
      }
      theLines.add('🚫 ${levelItem.icon} ${levelItem.name}');
      _logLevels.remove(levelItem);
    }
    throw FlutterError('Impossible logging state: level = ${level.name}');
  }

  static verifyLoggingUsingMessageLevel(LogLevel level, Object message, String tag, bool showDivider) {
    if (_logLevels.isEmpty) setLogginLevel(LogLevel.All);
    if (!_logLevels.contains(level) || level == LogLevel.None) return;
    final addTag = tag.isNotEmpty ? ' <$tag> ' : '';
    final icon = level.icon;
    final String text = '$_consoleTimeStamp: $icon ${level.name}$addTag';
    if (!(message is List<dynamic>)) {
      debugPrint('$text: $message');
    } else {
      debugPrint(text);
      _buildLines(message, tag, showDivider);
    }
    if (level == LogLevel.Crash) {
      throw FlutterError('🆘 FORCED CRASH 🆘');
    }
  }

  //---- PRIVATE VALUES/METHODS
  static Set<LogLevel> _logLevels = Set();

  static get _consoleTimeStamp => DateFormat('HH:mm:ss.SSS').format(DateTime.now().toLocal());

  static void _buildLines(dynamic message, String tag, bool showDivider) {
    const topLeftCorner = '┌';
    const bottomLeftCorner = '└';
    const verticalLine = '│';
    const doubleDivider = '─';
    const middleCorner = '├';
    const singleDivider = '┄';
    tag = tag.isNotEmpty ? '$tag ' : tag;
    final line = topLeftCorner.padRight(100, doubleDivider);
    debugPrint('$tag$line');
    if (message is List<dynamic>) {
      bool first = true;
      for (dynamic line in message) {
        if (first) {
          first = false;
        } else {
          if (showDivider) debugPrint('$tag${middleCorner.padRight(100, singleDivider)}');
        }
        debugPrint('$tag$verticalLine ${line.toString()}');
      }
    } else {
      debugPrint('$tag$verticalLine ${message.toString()}');
    }
    debugPrint('$tag${bottomLeftCorner.padRight(100, doubleDivider)}');
  }
}
