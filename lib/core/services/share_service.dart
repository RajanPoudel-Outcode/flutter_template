import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';

@injectable
class ShareService {
  Future<void> onShare(BuildContext context, String text) async {
    final box = context.findRenderObject() as RenderBox?;

    if (box != null && Platform.isIOS) {
      await Share.share(
        text,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      );
    } else {
      await Share.share(text);
    }
  }
}
