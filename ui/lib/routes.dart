import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui/routes/restriction_rules_route.dart';
import 'package:ui/routes/transaction_validation_route.dart';

enum LeftNavBarEnum { restrictionRulesRoute, transactionValidationRoute }

class Routes {
  Routes._();

  static const restrictionRulesRoute = '/restriction_rules';
  static const transactionValidationRoute = '/transaction_validation';

  static String getRouteString(LeftNavBarEnum value) {
    switch (value) {
      case LeftNavBarEnum.restrictionRulesRoute:
        return restrictionRulesRoute;
      case LeftNavBarEnum.transactionValidationRoute:
        return transactionValidationRoute;
    }
  }

  static GoRouter get router => _router;

  static final _router = GoRouter(
      debugLogDiagnostics: kDebugMode,
      initialLocation: restrictionRulesRoute,
      routes: [
        GoRoute(
            path: restrictionRulesRoute,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                  key: state.pageKey,
                  child: const RestrictionRulesRoute(),
                  transitionDuration: const Duration(milliseconds: 250),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCirc)
                          .animate(animation),
                      child: child,
                    );
                  });
            }),
        GoRoute(
            path: transactionValidationRoute,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                  key: state.pageKey,
                  child: const TransactionValidationRoute(),
                  transitionDuration: const Duration(milliseconds: 250),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCirc)
                          .animate(animation),
                      child: child,
                    );
                  });
            })
      ]);
}
