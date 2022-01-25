import 'package:flutter/material.dart';
import './services/remote_database.dart';
import './widgets/launch.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {

  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  // This widget is the root of your application.
  Widget launch() {
    return MaterialApp(
      title: 'Wing Chun Skills',
      home: Launch(),
    );
  
  }
  @override
  Widget build(BuildContext context) {
    return launch();
  }
}
