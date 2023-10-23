import 'package:flutter/material.dart';
import 'package:ui/dialogs/add_restriction_rule_dialog.dart';
import 'package:ui/dialogs/confirm_dialog.dart';
import 'package:ui/dialogs/info_dialog.dart';
import 'package:ui/services/proto/fraud-detection-service.pb.dart';

class DialogService {
  const DialogService();

  void showInfoDialog(BuildContext context, String text) {
    showDialog(context: context, builder: (context) => InfoDialog(text: text));
  }

  Future<bool> showConfirmDialog(BuildContext context, String text) async {
    final res = await showDialog<bool>(
        context: context, builder: (context) => ConfirmDialog(text: text));
    if (res == null) {
      return false;
    }
    return res;
  }

  Future<RestrictionRule?> showAddRestrictionRuleDialog(
      BuildContext context) async {
    return await showDialog<RestrictionRule?>(
        context: context,
        builder: (context) => const AddRestrictionRuleDialog());
  }
}
