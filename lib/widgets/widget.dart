import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 231, 40, 238), width: 2),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 72, 34, 240), width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 240, 36, 9), width: 2),
  ),
);
void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (ctx) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => page));
}

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
    message,
    style: const TextStyle(fontSize: 14),
  ),
  backgroundColor: color,
  duration: const Duration(seconds: 2),
  action: SnackBarAction(label: "Ok", onPressed: (){}, textColor: Colors.white,),
  ),
  );
}
