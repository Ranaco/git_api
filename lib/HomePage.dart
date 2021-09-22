// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final String? title;
  const HomePage({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data = [];

  String url = "https://api.github.com/users";

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future getUserData() async {
    var response = await http.get(Uri.parse(url));
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
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              leading: Icon(Icons.person),
              title: Text(data[index]["login"],
                  style: TextStyle(
                    fontSize: 20,
                  )),
              subtitle: Text(
                data[index]["url"],
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            );
          }),
    );
  }
}
