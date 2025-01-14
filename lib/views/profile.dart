import 'package:data_handel/service/cach_helper.dart';
import 'package:data_handel/views/details.dart';
import 'package:flutter/material.dart';
import 'package:data_handel/models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<User> viewedUsers = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadViewedUsers(); //to load viewed users when the page is initialized
  }

  Future<void> loadViewedUsers() async {
    final users = await CacheHelper.getViewedUsers();
    setState(() {
      viewedUsers = users;
      loading = false;
    });
  }

  Future<void> clearCache() async {   //method to clear cache and refresh profile page
    await CacheHelper.clearCache(); 
    setState(() {
      viewedUsers = []; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Viewed Users',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          //to add a button to clear the cache
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: clearCache, 
          ),
        ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : viewedUsers.isEmpty
              ? const Center(
                  child: Text(
                      'No viewed users found.'), //to show message if no viewed users
                )
              : ListView.builder(
                  itemCount: viewedUsers.length,
                  itemBuilder: (context, index) {
                    final user = viewedUsers[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.image),
                      ),
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text('Age: ${user.age}, Email: ${user.email}'),
                      onTap: () {
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
