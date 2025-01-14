import 'package:flutter/material.dart';
import 'package:data_handel/models/user_model.dart';
import 'package:data_handel/service/user_service.dart';

import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];
  bool loading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchUsers(); //to fetch users when the page is initialized
  }

  Future<void> fetchUsers() async {
    try {
      final employeeService = EmployeeService();
      final userResponse = await employeeService.fetchUsers();

      setState(() {
        users = userResponse.users;
        loading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load users: $e';
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
          'Employees List',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage)) //to show error message
              : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.image),
                      ),
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text('Age: ${user.age}, Email: ${user.email}'),
                      onTap: () {
                        //to navigate to details page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(user: user),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
