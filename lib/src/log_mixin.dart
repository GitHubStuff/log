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
  static void logContent(
    LogLevel level,
    Object content,
    bool drawBox,
    String tag,
  ) {
    String ts = _consoleTimeStamp;
    List<String> displayLines = [];
    List<dynamic> items = _processContent(content);
    bool buildBox = drawBox || (items.length > 1) || tag.isNotEmpty;
    final String topLine = '$_topLeftCorner'.padRight(3, _doubleDivider) + ' $tag ${level.name} ${level.icon} '.padRight(80, _doubleDivider);

    if (buildBox) {
      displayLines.add('$ts:');
      displayLines.add(topLine);
    }

    for (dynamic item in items) {
      if (buildBox) {
        displayLines.add('$_verticalLine ${item.toString()}');
      } else {
        displayLines.add('$ts: ${level.icon} ${item.toString()}');
      }
    }
    if (buildBox) displayLines.add('$_bottomLeftCorner' + '$_doubleDivider'.padRight(topLine.length - 1, _doubleDivider));
    for (String line in displayLines) debugPrint('$line');
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
    logContent(LogLevel.None, theLines, true, '');
  }

  //---- PRIVATE VALUES/METHODS
  static Set<LogLevel> _logLevels = Set();
  static LogLevel _currentLogLevel = LogLevel.All;
  static List<dynamic> _processContent(Object content) {
    List<dynamic> result = [];
    if (content is List<dynamic>) {
      result.addAll(content);
    }
    if (content is String) {
      result = content.split('\n');
    }
    if (result.isEmpty) result.add(content);
    return result;
  }

  static get _consoleTimeStamp => DateFormat('HH:mm:ss.SSS').format(DateTime.now().toLocal());
}
