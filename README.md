# log

Provides logging to the console for different log levels

## Install

```text
dependencies:
  log:
    git:
      url: https://github.com/GitHubStuff/log.git
```

***- OR -***

```text
dependencies:
  log:
    git:
      url: https://github.com/RAE-Health/log.git
```

## Import

```dart
import 'package:log/log.dart';
```

## Usage

This list of logging levels that are accessed through special Log class static methods:

```dart
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
}
```

These values are used in specialized wrappers for making calls that will log messages (where messages are : objects, arrays, int, String, ...)

```dart
Log.A(dynamic message, {String tag = '', bool showDivider = false}); // All
Log.M(dynamic message, {String tag = '', bool showDivider = false}); // Mark
Log.T(dynamic message, {String tag = '', bool showDivider = false}); // Trace
Log.V(dynamic message, {String tag = '', bool showDivider = false}); // Verbose
Log.D(dynamic message, {String tag = '', bool showDivider = false}); // Debug
Log.I(dynamic message, {String tag = '', bool showDivider = false}); // Info
Log.W(dynamic message, {String tag = '', bool showDivider = false}); // Warning
Log.E(dynamic message, {String tag = '', bool showDivider = false}); // Error
Log.F(dynamic message, {String tag = '', bool showDivider = false}); // Fix
Log.C(dynamic message, {String tag = '', bool showDivider = false}); // Crash {will throw flutter error}
```

### Parameters

1) ```dynamic message``` any flutter object, array, int, string, etc...
2) ```String tag``` optional text that is displayed as a prefix to the ```message``` item. It is useful when doing filters/searches of the console messages (to avoid clutter limit to 1, 2, or 3 {at most} characters)
3) ```showDivider``` if an ***array*** is passed as a ```message``` the contents of ```message``` is typically written as a series of entries with no divider (horizontal line) between. Setting ```showDivider``` to true adds a divider.

### Examples

CALLS:

```dart

  Log.I(['Floof', 'of several', 'critters'], tag: 'IF');
  Log.setLoggingLevelTo(LogLevel.Debug);  // Console show ✅ for levels logged, 🚫 for levels not logged
  Log.T(['This', 'should be ignored'], tag: 'HM');
  Log.F(['Fix', 'of several', 'fixes'], showDivider: true);
  Log.E('Oh my gawd, we are crashing!');
  Log.I([Container(), 'Mark of', 10, 'and a', 44.0, 'a double'], tag: '😎');
  Log.W(11);
```

PRODUCES CONSOLE TEXT:

```dart
flutter: 🔴 ┌─────────────────────────────────────────────────────────────────────────────────
flutter: 🔴 │ Log Level set to 🔗 All
flutter: 🔴 │ ✅ 🔗 All
flutter: 🔴 │ ✅ ✅ Mark
flutter: 🔴 │ ✅ 🧭 Trace
flutter: 🔴 │ ✅ 📣 Verbose
flutter: 🔴 │ ✅ 🐞 Debug
flutter: 🔴 │ ✅ 📝 Info
flutter: 🔴 │ ✅ 🚸 Warning
flutter: 🔴 │ ✅ ❌ Error
flutter: 🔴 │ ✅ 🚧 Fix
flutter: 🔴 │ ✅ 🆘 Crash
flutter: 🔴 └─────────────────────────────────────────────────────────────────────────────────
flutter: 00:21:31.815: 📝 Info <IF>
flutter: IF ┌─────────────────────────────────────────────────────────────────────────────────
flutter: IF │ Floof
flutter: IF │ of several
flutter: IF │ critters
flutter: IF └─────────────────────────────────────────────────────────────────────────────────
flutter: 🔴 ┌─────────────────────────────────────────────────────────────────────────────────
flutter: 🔴 │ Log Level set to 🐞 Debug
flutter: 🔴 │ 🚫 🔗 All
flutter: 🔴 │ 🚫 ✅ Mark
flutter: 🔴 │ 🚫 🧭 Trace
flutter: 🔴 │ 🚫 📣 Verbose
flutter: 🔴 │ ✅ 🐞 Debug
flutter: 🔴 │ ✅ 📝 Info
flutter: 🔴 │ ✅ 🚸 Warning
flutter: 🔴 │ ✅ ❌ Error
flutter: 🔴 │ ✅ 🚧 Fix
flutter: 🔴 │ ✅ 🆘 Crash
flutter: 🔴 └─────────────────────────────────────────────────────────────────────────────────
flutter: 00:21:31.823: 🚧 Fix
flutter: ┌─────────────────────────────────────────────────────────────────────────────────────────
flutter: │ Fix
flutter: ├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
flutter: │ of several
flutter: ├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
flutter: │ fixes
flutter: └─────────────────────────────────────────────────────────────────────────────────────────
flutter: 00:21:31.824: ❌ Error
flutter: ┌─────────────────────────────────────────────────────────────────────────────────────────
flutter: │ Oh my gawd, we are crashing!
flutter: └─────────────────────────────────────────────────────────────────────────────────────────
flutter: 00:21:31.826: 📝 Info <😎>
flutter: 😎 ┌──────────────────────────────────────────────────────────────────────────────────────
flutter: 😎 │ Container
flutter: 😎 │ Mark of
flutter: 😎 │ 10
flutter: 😎 │ and a
flutter: 😎 │ 44.0
flutter: 😎 │ a double
flutter: 😎 └─────────────────────────────────────────────────────────────────────────────────────────────
flutter: 00:21:31.835: 🚸 Warning
flutter: ┌────────────────────────────────────────────────────────────────────────────────────────────────
flutter: │ 11
flutter: └────────────────────────────────────────────────────────────────────────────────────────────────
```

***NOTICE:*** ```Log.T(['This', 'should be ignored'], tag: 'HM');``` didn't appear on the console as ```Log.setLoggingLevelTo(LogLevel.Debug);``` masked logging of anything below ```LogLevel.Debug```.

## Setting Log Level

It is possible to set the logging level {see example above} by calling ```Log.setLoggingLevelTo(...)``` and passing ```enum LogLevel```, any level below that parameter will not be logged to the console.

### Example

```dart
Log.setLoggingLevelTo(LogLevel.Debug);

// Stops logging of:
//   LogLevel.All
//   LogLevel.Mark
//   LogLevel.Trace
//   LogLevel.Verbose
```

## Final Note

Be kind to each other
