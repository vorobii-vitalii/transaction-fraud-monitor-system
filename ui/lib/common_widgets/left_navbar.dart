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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationRail(
        selectedIndex: ref.watch(navBarSelectedEnumProvider).index,
        onDestinationSelected: (int newValue) =>
            onDestinationSelected(context, ref, newValue),
        labelType: NavigationRailLabelType.all,
        destinations: const [
          NavigationRailDestination(
              icon: Icon(Icons.gavel),
              label: Text(
                'Restriction\nRules',
                textAlign: TextAlign.center,
              )),
          NavigationRailDestination(
              icon: Icon(Icons.receipt_long_outlined),
              label: Text(
                'Transaction\nvalidation',
                textAlign: TextAlign.center,
              ))
        ]);
  }
}
