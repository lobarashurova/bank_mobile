import 'package:flutter/cupertino.dart';

class Constants {
  static const baseUrl = 'https://www.solutionsquad.uz/api/';
  static const chatSocketUrl = 'wss://api.mytsj.org/ws/chat/';
  static const notificationSocketUrl =
      'ws://113.30.190.31:8000/ws/notifications/';
  static const imageUrl = "https://api.mytsj.org/media/";

  static SizedBox getTopPadding(BuildContext context) =>
      SizedBox(height: MediaQuery.of(context).viewPadding.top);
}