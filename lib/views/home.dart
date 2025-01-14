import 'package:flutter/material.dart';
import 'package:data_handel/models/user_model.dart';
import 'package:data_handel/service/user_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];
  bool loading = false;
  String errorMessage = '';

  Future<void> fetchUsers() async {
    setState(() {
      loading = true;
      errorMessage = ''; //show error message if failed to fetch data
    });

    try {
      final employeeService = EmployeeService();
      final userResponse = await employeeService.fetchUsers();
      setState(() {
        users = userResponse.users;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load users: $e';
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'User List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: fetchUsers, //to trigger API call
            child: const Text('Fetch Users'),
          ),
          SizedBox(
            height: 10,
          ),
          if (loading)
            const Center(child: CircularProgressIndicator())
          else if (errorMessage.isNotEmpty)
            Center(
              child: Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  final user = users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(user.image), //user's profile image
                    ),
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text('Age: ${user.age}, Email: ${user.email}'),
                    trailing: const Icon(Icons.person),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
