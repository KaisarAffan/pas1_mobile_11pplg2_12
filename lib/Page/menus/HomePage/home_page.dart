import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_12/Page/menus/HomePage/home_details.dart';
import 'package:pas1_mobile_11pplg2_12/controller/liga_english_controller.dart';
import 'package:pas1_mobile_11pplg2_12/widget/my_list_card.dart';
import 'package:pas1_mobile_11pplg2_12/widget/my_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LigaEnglishController ligaEnglishController =
      Get.put(LigaEnglishController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 79, 161, 255),
        title: MyText(
          hintText: "Team",
          colors: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (ligaEnglishController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: ligaEnglishController.postList.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Get.to(HomeDetailPage(), arguments: {
                  'index': index,
                });
              },
              child: MyListCard(models: ligaEnglishController.postList[index])),
        );
      }),
    );
  }
}
