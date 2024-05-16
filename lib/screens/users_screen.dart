import 'package:flutter/material.dart';
import 'package:untitled/api/user.dart';
import 'package:untitled/model/user_model.dart';
import '../utils/secure_storage.dart';
import '../widgets/myscaffold.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _UsersScreen();
  }
}
class _UsersScreen extends State<UsersScreen> {
  final SecureStorage secureStorage = SecureStorage();
  late Future<List<UserModel>> futureUsers;
  String firstName = "";
  String lastName = "";

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        name: 'Users',
      body: FutureBuilder<List<UserModel>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun message trouvé.'));
          } else {
            List<UserModel> users = snapshot.data!;
            return ListView.builder(itemCount: users.length,
              itemBuilder: (context, index) {
                UserModel userModel = users[index];
                return ListTile(
                  title: Text("${userModel.lastName} ${userModel.firstName}"),
                  onTap: () {
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}