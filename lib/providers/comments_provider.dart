import 'dart:convert';

import 'package:api_task/constant/api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class CommentsProvider extends ChangeNotifier {
  List<dynamic>? _comments;
  bool _isDataLoaded = false;
  List<dynamic>? get comments => _comments;

  Future<void> fetchCommentsData() async {
    if (!_isDataLoaded) {
      final response = await http.get(Uri.parse(API_URL_POST_COMMENTS));

      if (response.statusCode == 200) {
        _comments = jsonDecode(response.body);
        _isDataLoaded = true;
        notifyListeners();
      } else {
        throw Exception('Failed to load comments');
      }
    }
  }

}