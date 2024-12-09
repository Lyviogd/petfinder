import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => myAppState(),
      child: MaterialApp(
        title: "PetFinder",
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromRGBO(236, 80, 156, 0.849))),
        home: Acceuil(),
      ),
    );
  }
}

class myAppState extends ChangeNotifier {}

class Acceuil extends StatefulWidget {
  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = MapPage();
        break;
      case 2:
        page = CameraPage();
        break;
      default:
        throw UnimplementedError('No Widget Planned for $selectedIndex  :( ');
    }

    return LayoutBuilder(builder: (context, Constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: Constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text("Acceuil"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.map),
                    label: Text("Carte"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.camera),
                    label: Text("Camera"),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(context) {
    var appState = context.watch<myAppState>();

    return Center(
      child: Text("Acceuil"),
    );
  }
}

class MapPage extends StatelessWidget {
  @override
  Widget build(context) {
    var appState = context.watch<myAppState>();

    return Center(
      child: Text("Map"),
    );
  }
}

class CameraPage extends StatelessWidget {
  @override
  Widget build(context) {
    var appState = context.watch<myAppState>();

    return Center(
      child: Text("Camera"),
    );
  }
}
