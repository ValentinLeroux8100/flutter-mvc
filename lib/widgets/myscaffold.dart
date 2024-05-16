import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final String name;
  final List<Widget> actions;

  const MyScaffold(
      {Key? key,required this.body,
        required this.name,
        this.actions = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(this.name, style: TextStyle(color: Colors.white)),
        elevation: 10.0,
        centerTitle: true,
        actions: <Widget>[
          if(authProvider.isLoggedIn)
          IconButton(
            icon: Icon(
                Icons.person,
                color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/profile',
              );
            },
          ),
          IconButton(
            icon: Icon(
                authProvider.isLoggedIn ? Icons.logout : Icons.login,
                color: Colors.white),
            onPressed: () {
              if (authProvider.isLoggedIn) {
                authProvider.logout();
              }
              Navigator.pushNamed(
                context,
                '/login',
              );
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(
              Icons.menu,
              color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/users',
            );}
        ),
      ),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: const Icon(Icons.add),
      ),

    );
  }
}