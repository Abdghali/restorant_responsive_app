import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../utility/my_app_color.dart';

class BaseController extends GetxController {
  // loading functionality

  RxBool loading = false.obs;

  setLoadingTrue() {
    loading.value = true;
  }

  setLoadingFalse() {
    loading.value = true;
  }

  // searching functionality
  RxBool isSearching = false.obs;
  Rx<TextEditingController> searchTextController = TextEditingController().obs;

// clear search text field
  void clearSearch() {
    searchTextController.value.clear();
  }

// stop searching
  void stopSearching() {
    clearSearch();
    isSearching.value = false;
  }

  void startSearch() {
    isSearching.value = true;
  }
}
