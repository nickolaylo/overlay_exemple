import 'package:flutter/material.dart';
import 'package:flutter_overlay_apps/flutter_overlay_apps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MyApp(),
  );
}

// overlay entry point
@pragma("vm:entry-point")
void showOverlay() async {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp2(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () async {
                // Open overlay
                await FlutterOverlayApps.showOverlay(
                    height: 900,
                    width: 600,
                    alignment: OverlayAlignment.center);
              },
              child: const Text("showOverlay")),
        ),
      ),
    );
  }
}

class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overlay AppBar'),
      ),
      backgroundColor: Colors.amberAccent,
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: const Icon(
          Icons.add,
          size: 15,
        ),
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
            decoration: InputDecoration(
              hintText: "Name:",
              contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            maxLines: 1),
      ),
    );
  }
}
