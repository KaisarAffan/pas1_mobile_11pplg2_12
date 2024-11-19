import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_12/controller/liga_english_controller.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({super.key});

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  final LigaEnglishController postController = Get.put(LigaEnglishController());
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final int index = Get.arguments['index'];
    final post = postController.postList[index];

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        backgroundColor: Color.fromARGB(255, 79, 161, 255),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Image.network(
                post.strBadge,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 16),
            Text(
              post.strTeam,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              post.strLocation,
              style: TextStyle(fontSize: 18, color: Colors.green),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                post.strDescription,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
