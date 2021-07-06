import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_flutter/provider/page_notifier.dart';
import 'package:login_flutter/pages/home.dart';
import 'package:login_flutter/pages/login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>PageNotifier())],
      child: MaterialApp(
        title: 'Flutter Login Example',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: Consumer<PageNotifier>(builder: (context, pageNotifier, child) {
            return Navigator(
              pages: [
                MaterialPage(
                    key: ValueKey(MyHomePage.pageName),
                    child: MyHomePage(title: 'Flutter Login Home')),
                if(pageNotifier.currentPage == LoginPage.pageName) LoginPage(),
              ],
              onPopPage: (route, result) {
                return !route.didPop(result);
              },
            );
          } // builder
        ),
      ),
    );
  }
}

