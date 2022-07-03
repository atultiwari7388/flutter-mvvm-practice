import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:mvvm_practice_app/utils/routes/routes.dart';
import 'package:mvvm_practice_app/utils/routes/routes_name.routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
      builder: (context, orientation, screentype) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: RoutesName.login,
          onGenerateRoute: Routes.onGenerateRoutes,
        );
      },
    );
  }
}
