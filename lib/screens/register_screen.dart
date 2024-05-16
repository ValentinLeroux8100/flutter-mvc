import 'package:flutter/material.dart';
import 'package:untitled/widgets/myscaffold.dart';
import 'package:untitled/widgets/register_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _RegisterScreen();
  }
}
class _RegisterScreen extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(name: 'Register', body: RegisterForm());
  }
}