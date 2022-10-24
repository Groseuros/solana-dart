import 'dart:async';

import 'package:cryptoplease/app/components/snackbars.dart';
import 'package:cryptoplease/l10n/l10n.dart';
import 'package:cryptoplease/ui/snackbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

extension LinkOpenerExt on BuildContext {
  Future<void> openLink(String link) async {
    try {
      await launchUrl(Uri.parse(link));
    } on PlatformException catch (_) {
      showCpErrorSnackbar(
        this,
        message: l10n.tryAgainLater,
      );
    }
  }
}

// TODO(rhbrunetto): use this extension app-wide
extension ClipboardExt on BuildContext {
  void copyToClipboard(String text) {
    final data = ClipboardData(text: text);
    Clipboard.setData(data);
    showClipboardSnackbar(this);
  }
}

extension StringExt on String {
  String withZeroWidthSpaces() =>
      splitMapJoin('', onMatch: (m) => '${m.group(0)}\u200b');
}
