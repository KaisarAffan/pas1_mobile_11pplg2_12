import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_12/controller/username_controller.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UsernameController userNameController = Get.put(UsernameController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 79, 161, 255),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50)),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                child: Image.network(
                  "https://i.pinimg.com/736x/b3/11/6f/b3116f79533d4b878082ad09d26c2965.jpg",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
          Obx(() {
            return Text(
              "Hi, ${userNameController.username.value}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF242A32),
              ),
            );
          }),
          SizedBox(height: 50),
          ListTile(
            leading: Icon(Icons.settings_outlined, color: Color(0xFF242A32)),
            title: Text("Settings",
                style: TextStyle(color: Color(0xFF242A32), fontSize: 18)),
            trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF242A32)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications_none_outlined,
                color: Color(0xFF242A32)),
            title: Text("Notification",
                style: TextStyle(color: Color(0xFF242A32), fontSize: 18)),
            trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF242A32)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: Color(0xFF242A32)),
            title: Text("Terms and Service",
                style: TextStyle(color: Color(0xFF242A32), fontSize: 18)),
            trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF242A32)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined, color: Color(0xFF242A32)),
            title: Text("Log Out",
                style: TextStyle(color: Color(0xFF242A32), fontSize: 18)),
            trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF242A32)),
            onTap: () {
              Get.toNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
