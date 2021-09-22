// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  final String? email, password, title;
  const HomePage({Key? key, this.title, this.email, this.password})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = "https://api.github.com/users";

  List data = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.getUserData();
  }

  Future getUserData() async {
    var response = await http.get(
      Uri.parse(url),
    );
    // print(response.body);
    setState(() {
      data = jsonDecode(response.body);
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    data[index]["login"],
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    data[index]["url"],
                    style: TextStyle(fontSize: 15.0),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
