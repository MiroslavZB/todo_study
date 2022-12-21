import 'package:flutter/material.dart';

const int selectedUserId = 1;
const String baseUrl = 'https://jsonplaceholder.typicode.com/todos?userId=$selectedUserId';
final Uri uri = Uri.parse(baseUrl);
const Map<String, String> headers = {'Content-type': 'application/json; charset=UTF-8'};

const TextStyle style20 = TextStyle(fontSize: 20, color: Colors.black);
final BoxDecoration boxDecoration = BoxDecoration(
  border: Border.all(),
  color: const Color.fromRGBO(240, 240, 240, 1),
);
