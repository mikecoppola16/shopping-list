import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_app/config/routes/auto_route_guard.dart';
import 'package:shopping_list_app/features/profile/presentation/screens/profile.dart';
import 'package:shopping_list_app/features/shopping_list/domain/entities/grocery_item_entity.dart';
import 'package:shopping_list_app/features/auth/presentation/screens/email_verification.dart';
import 'package:shopping_list_app/features/auth/presentation/screens/signin_register_screen.dart';
import 'package:shopping_list_app/features/shopping_list/presentation/screens/new_item_form.dart';
import 'package:shopping_list_app/features/shopping_list/presentation/screens/shopping_list.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {



  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ShoppingListRoute.page, guards: [AutoRouteAuthGuard()], initial: true),
        AutoRoute(page: SignInRegisterRoute.page),
        AutoRoute(page: VerifyEmailRoute.page),
        AutoRoute(page: UserProfilRoute.page),
        AutoRoute(
          page: NewItemFormRoute.page,
        ),
      ];
}
