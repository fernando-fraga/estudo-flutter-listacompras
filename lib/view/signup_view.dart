// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faça seu cadastro já'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade100,
      ),
    );
  }
}