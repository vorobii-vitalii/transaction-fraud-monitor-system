import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ui/riverpod.dart';
import 'package:ui/routes.dart';

class LeftNavbar extends ConsumerWidget {
  const LeftNavbar({super.key});

  void onDestinationSelected(BuildContext context, WidgetRef ref, int index) {
    final newPage = LeftNavBarEnum.values[index];
    ref.read(navBarSelectedEnumProvider.notifier).state = newPage;
    context.go(Routes.getRouteString(newPage));
  }

  static const List<(IconData, String)> data = [
    (Icons.gavel, 'Restriction\nRules'),
    (Icons.receipt_long_outlined, 'Transaction\nvalidation')
  ];

  NavigationRailDestination getNavDestination(
          {required IconData icon, required String text}) =>
      NavigationRailDestination(
          icon: Icon(icon),
          label: Text(
            text,
            textAlign: TextAlign.center,
          ));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationRail(
        selectedIndex: ref.watch(navBarSelectedEnumProvider).index,
        onDestinationSelected: (int newValue) =>
            onDestinationSelected(context, ref, newValue),
        labelType: NavigationRailLabelType.all,
        destinations: data
            .map((pair) => getNavDestination(icon: pair.$1, text: pair.$2))
            .toList());
  }
}
