import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'log_enum.dart';

const _verticalLine = '│';
const _topLeftCorner = '┌';
const _bottomLeftCorner = '└';
const _doubleDivider = '─';
// const _middleCorner = '├';
// const _singleDivider = '┄';
// final _line = _topLeftCorner.padRight(100, _doubleDivider);

mixin LogMixin {
  //---- PUBLIC METHODS
  static void logContent(LogLevel level, Object content, bool drawBox) {
    String ts = _consoleTimeStamp;
    bool buildBox = drawBox || (content is List<dynamic>);
    List<String> items = [];
    final String topLine = '$_topLeftCorner '.padRight(3, _doubleDivider) + ' ${level.name} '.padLeft(80, _doubleDivider);
    if (buildBox) {
      items.add('$ts:');
      items.add(topLine);
    }
    if (content is List<String>) {
      for (String item in content) items.add('$_verticalLine $item');
      items.add('$_bottomLeftCorner' + '$_doubleDivider'.padRight(topLine.length - 1));
    } else {
      items.add('$ts: ${level.icon} ${content.toString()}');
    }
    for (String line in items) debugPrint('$line');
    if (level == LogLevel.Crash) throw FlutterError('🆘 FORCED CRASH 🆘');
  }

  static setLoggingLevel(LogLevel level) {
    if (_currentLogLevel == level) return;
    _currentLogLevel = level;
    List<String> theLines = ['Log Level set to ${level.icon} ${level.name}'];
    bool match = false;
    _logLevels = Set.from(LogLevel.values);
    for (LogLevel levelItem in LogLevel.values) {
      if (levelItem == level) match = true;
      if (levelItem == LogLevel.None) continue;
      if (!match) _logLevels.remove(levelItem);
      final stateIcon = (match) ? '✅' : '🚫';
      theLines.add('$stateIcon ${levelItem.icon} ${levelItem.name}');
    }
    logContent(LogLevel.None, theLines, true);
  }

  //---- PRIVATE VALUES/METHODS
  static Set<LogLevel> _logLevels = Set();
  static LogLevel _currentLogLevel = LogLevel.All;

  static get _consoleTimeStamp => DateFormat('HH:mm:ss.SSS').format(DateTime.now().toLocal());
}
