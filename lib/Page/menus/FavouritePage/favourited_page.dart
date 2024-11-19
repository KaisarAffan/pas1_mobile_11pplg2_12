import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_12/Page/menus/FavouritePage/favourited_detail_page.dart';
import 'package:pas1_mobile_11pplg2_12/controller/like_controller.dart';
import 'package:pas1_mobile_11pplg2_12/widget/my_list_card.dart';
import 'package:pas1_mobile_11pplg2_12/widget/my_text.dart';

class FavouritedPage extends StatefulWidget {
  const FavouritedPage({super.key});

  @override
  State<FavouritedPage> createState() => _FavouritedPageState();
}

class _FavouritedPageState extends State<FavouritedPage> {
  final LikeController likeController = Get.put(LikeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 79, 161, 255),
        title: MyText(
          hintText: "Favourited",
          colors: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (likeController.tasks.isEmpty) {
          return Center(
            child: Text('Tidak ada Club yang disukai',
                style: TextStyle(color: Colors.white)),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: likeController.tasks.length,
          itemBuilder: (context, index) {
            final dataSoccer = likeController.tasks[index];
            return GestureDetector(
              onTap: () {
                Get.to(FavouritedDetailPage(), arguments: {
                  'index': index,
                });
              },
              child: MyListCard(
                models: dataSoccer,
                allowDeletion: true,
              ),
            );
          },
        );
      }),
    );
  }
}
