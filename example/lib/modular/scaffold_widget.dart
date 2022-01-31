import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_management/theme_management.dart';
import 'package:xample/cubit/locale_cubit.dart';

class ScaffoldWidget extends StatefulWidget {
  ScaffoldWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ScaffoldWidget createState() => _ScaffoldWidget();
}

class _ScaffoldWidget extends ObservingStatefulWidget<ScaffoldWidget> {
  String message = 'Tap for Size';
  String instruction = 'Tap + to change the text';
  String instruction2 = 'Tap again';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            //ThemeControlWidget(),
          ],
        ),
        body: _body(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ThemeManagement.toggle(context);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );

  Widget _body(BuildContext context) {
    LocaleCubit localeCubit = Modular.get<LocaleCubit>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            message,
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () => localeCubit.updateLocale(Locale('en', '')), child: Text('English')),
              ElevatedButton(onPressed: () => localeCubit.updateLocale(Locale('es', '')), child: Text('Spanish')),
              ElevatedButton(onPressed: () => localeCubit.updateLocale(Locale('de', '')), child: Text('German')),
            ],
          )
        ],
      ),
    );
  }
}
