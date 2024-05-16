import 'package:flutter/material.dart';
import 'package:untitled/api/user.dart';
import '../model/user_model.dart';
import '../widgets/myscaffold.dart';
import 'dart:developer' as developer;

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UserScreen();
  }
}
class _UserScreen extends State<UserScreen> {
  late Future<UserModel> futureUser;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        final args = ModalRoute.of(context)?.settings.arguments;
        final id = args.toString();
        futureUser = getUserById(id);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final id = args.toString();
    developer.log(id, name: 'my.app.category');

    return MyScaffold(
        name: 'User',
        body: FutureBuilder<UserModel>(
          future: futureUser,
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erreur: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('Aucun message trouvé.'));
            } else {
              UserModel user = snapshot.data!;
              return Center(
                  child:Column(
                    children: <Widget>[
                      Text("nom : ${user.lastName}"),
                      Text("prenom : ${user.firstName}"),
                      Text("email : ${user.email}"),
                      Text("créer le ${user.createdAt.toLocal().toString()}"),
                      Text("mis à jour : ${user.updatedAt.toLocal().toString()}")
                    ],
                  )
              );
            }
          },
        )
    );
  }
}