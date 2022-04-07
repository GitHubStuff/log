enum LogLevel {
  All,
  Mark,
  Trace,
  Verbose,
  Observe,
  Debug,
  Info,
  Warning,
  Error,
  Fix,
  Crash,
  None,
}

extension LogLevelExtension on LogLevel {
  String get icon {
    switch (this) {
      case LogLevel.All:
        return '🔗';
      case LogLevel.Mark:
        return '✅';
      case LogLevel.Trace:
        return '🧭';
      case LogLevel.Verbose:
        return '📣';
      case LogLevel.Observe:
        return '👀';
      case LogLevel.Debug:
        return '🐞';
      case LogLevel.Info:
        return '📝';
      case LogLevel.Fix:
        return '🚧';
      case LogLevel.Warning:
        return '🚸';
      case LogLevel.Error:
        return '❌';
      case LogLevel.Crash:
        return '🆘';
      case LogLevel.None:
        return '';
    }
  }
}
