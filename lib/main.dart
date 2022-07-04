import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:mvvm_practice_app/utils/routes/routes.dart';
import 'package:mvvm_practice_app/utils/routes/routes_name.routes.dart';
import 'package:mvvm_practice_app/view_model/auth/auth.view_model.dart';
import 'package:provider/provider.dart';

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
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: RoutesName.login,
            onGenerateRoute: Routes.onGenerateRoutes,
          ),
        );
      },
    );
  }
}
