import 'package:flutter/material.dart';
import '../utils/secure_storage.dart';
import '../widgets/myscaffold.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ProfileScreen();
  }
}
class _ProfileScreen extends State<ProfileScreen> {
  final SecureStorage secureStorage = SecureStorage();
  String firstName = "";
  String lastName = "";

  @override
  void initState() {
    super.initState();
    _loadInformation();
  }

  Future<void> _loadInformation() async {
    final informations = await secureStorage.readInformations();
    setState(() {
      firstName = informations['firstName'].toString();
      lastName = informations['lastName'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
  return MyScaffold(
        name: 'Profile',
        body: Center(child: Text("$firstName $lastName"))
    );
  }
}