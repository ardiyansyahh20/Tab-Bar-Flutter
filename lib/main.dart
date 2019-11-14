import 'package:flutter/material.dart';
import './hal_headset.dart' as headset;
import './hal_komputer.dart' as komputer;
import 'hal_radio.dart' as radio;
import 'hal_smartphone.dart' as smartphone;

void main() {
  runApp(new MaterialApp(
    title: "Tab Bar",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
TabController controller;

@override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Daftar Elektronik"),
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.computer), text: "komputer",),
            Tab(icon: Icon(Icons.headset),text: "headset"),
            Tab(icon: Icon(Icons.radio),text: "radio"),
            Tab(icon: Icon(Icons.smartphone),text: "smartphone"),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          komputer.Komputer(),
          headset.Headset(),
          radio.Radio(),
          smartphone.Smartphone(),
        ],
      ),

      bottomNavigationBar: Material(
        color: Colors.red,
        child: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.computer),),
            Tab(icon: Icon(Icons.headset),),
            Tab(icon: Icon(Icons.radio),),
            Tab(icon: Icon(Icons.smartphone),),
          ],
        ),
      ),
    );
  }
}
