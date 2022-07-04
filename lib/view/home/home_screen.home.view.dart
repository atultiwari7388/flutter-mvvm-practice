import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_practice_app/utils/routes/routes_name.routes.dart';
import 'package:mvvm_practice_app/view_model/user/user.view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {
              showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return CupertinoActionSheet(
                      title: Text('Are you sure?'),
                      actions: [
                        CupertinoActionSheetAction(
                          child: Text('Logout'),
                          onPressed: () {
                            userData.logoutUser().then((value) {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                RoutesName.login,
                                (route) => false,
                              );
                            });
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
