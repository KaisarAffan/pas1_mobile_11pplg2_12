// controllers/post_controller.dart

import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_12/Models/liga_english_model.dart';
import 'package:pas1_mobile_11pplg2_12/Service/liga_english_service.dart';

class LigaEnglishController extends GetxController {
  var isLoading = true.obs;
  var postList = <LigaEnglishModel>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await LigaEnglishApiService().fetchPosts();
      postList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }
}
