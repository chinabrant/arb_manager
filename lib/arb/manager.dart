import 'dart:convert';
import 'dart:io';

import 'package:arb_manager/arb/arb_file.dart';
import 'package:flutter/material.dart';

class ArbManager extends ChangeNotifier {
  Map<String, ArbFile> _arbs = {};
  Map<String, ArbFile> get arbs => _arbs;
  String _path = '';
  String get path => _path;

  /// 从指定文件夹读取所有arb文件
  Future<Map<String, ArbFile>> readFromDir(String dirPath) async {
    Directory dir = Directory(dirPath);
    if (!dir.existsSync()) {
      return {};
    }

    _path = dir.path;

    final List<String> arbPaths = [];
    // 找出所有的arb文件
    final subs = dir.listSync();
    for (var sub in subs) {
      if (sub.path.endsWith(".arb")) {
        arbPaths.add(sub.path);
      }
    }

    final Map<String, ArbFile> arbs = {};
    for (var path in arbPaths) {
      File file = File(path);
      final jsonString = file.readAsStringSync();
      final json = jsonDecode(jsonString);
      ArbFile arbFile = ArbFile.fromJson(json);
      arbs[arbFile.locale] = arbFile;
    }

    _arbs = arbs;
    notifyListeners();
    return arbs;
  }
}
