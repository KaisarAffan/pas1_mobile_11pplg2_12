// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_12/Models/liga_english_model.dart';
import 'package:pas1_mobile_11pplg2_12/controller/liga_english_controller.dart';
import 'package:pas1_mobile_11pplg2_12/controller/like_controller.dart';

class MyListCard extends StatelessWidget {
  final LigaEnglishController postController = Get.put(LigaEnglishController());
  final LikeController likeController = Get.put(LikeController());
  final LigaEnglishModel models;
  bool allowDeletion = false;

  MyListCard({required this.models, super.key, this.allowDeletion = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.network(
              models.strBadge,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    models.strTeam,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: [
                            Color.fromARGB(255, 77, 69, 69),
                            Color(0xFF242A32),
                          ],
                        ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    models.strLocation,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF242A32),
                    ),
                  ),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Obx(() {
                      var isLiked =
                          likeController.getLikedById(models.idTeam!).value;
                      return ElevatedButton.icon(
                        onPressed: () {
                          if (isLiked) {
                            if (allowDeletion) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Delete Confirmation"),
                                    content: Text(
                                      "Are you sure you want to remove ${models.strTeam} from favorites?",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          likeController
                                              .deleteTask(models.idTeam!);
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                          Get.snackbar(
                                            'Info',
                                            '${models.strTeam} removed from favorites.',
                                            backgroundColor: Colors.teal,
                                            colorText: Colors.white,
                                          );
                                        },
                                        child: Text("Delete"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              Get.snackbar(
                                'Error',
                                'You can only remove favorites from Library.',
                                backgroundColor: Colors.teal,
                                colorText: Colors.white,
                              );
                            }
                          } else {
                            likeController.addTask(models);
                            Get.snackbar(
                              'Info',
                              '${models.strTeam} added to favorites.',
                              backgroundColor: Colors.black87,
                              colorText: Colors.white,
                            );
                          }
                        },
                        icon: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.redAccent : Colors.grey[600],
                          size: 20,
                        ),
                        label: Text(
                          isLiked ? "Liked" : "Like",
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                isLiked ? Colors.redAccent : Colors.grey[700],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          iconColor: Colors.white,
                          elevation: 0,
                          side: BorderSide(
                            color:
                                isLiked ? Colors.redAccent : Colors.grey[300]!,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
