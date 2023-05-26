import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api Testing',
      home: HomePage(),
    );
  }
}

String stringResponse = "";
Map mapResponse = {};
Map dataResponse = {};
List listResponse = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

Future apicall() async {
  http.Response response;
  response = await http.get(Uri.parse("https://swapi.dev/api/people/1/"));
  if (response.statusCode == 200) {
    setState(() {
      mapResponse = json.decode(response.body);
      listResponse = mapResponse['starships'];
    });
  }
}

@override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Testing"),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue),
          child: Center(child: Text(listResponse[0].toString())),
        ),
      ),
    );
  }
}
