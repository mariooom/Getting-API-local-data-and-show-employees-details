import 'package:data_handel/service/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:data_handel/models/user_model.dart';

class DetailsPage extends StatelessWidget {
  final User user;

  const DetailsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    //to save the viewed user to cache when the details page is opened
    CacheHelper.saveViewedUser(user);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          '${user.firstName} ${user.lastName}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 460,
          width: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 234, 227, 239),
              border: Border.all(width: 0.1)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.network(user.image),
                Text(
                  'ID: ${user.id}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Name: ${user.firstName} ${user.lastName}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Age: ${user.age}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Gender: ${user.gender}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Email: ${user.email}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Phone: ${user.phone}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
