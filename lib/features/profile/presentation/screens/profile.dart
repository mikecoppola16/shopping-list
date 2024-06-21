import 'package:auto_route/auto_route.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_app/config/routes/app_router.dart';
import 'package:shopping_list_app/core/di/injection.dart';

@RoutePage()
class UserProfilScreen extends ProfileScreen {
  const UserProfilScreen({super.key});

  @override
  List<FirebaseUIAction>? get actions => [
        SignedOutAction((context) {
          getIt<AppRouter>().push(const ShoppingListRoute());
        })
      ];
  @override
  bool get showMFATile => true;

  @override
  bool get showDeleteConfirmationDialog => true;

  @override
  bool get showUnlinkConfirmationDialog => true;

  @override
  AppBar? get appBar => AppBar(
        title: const Text("Profile Settings"),
      );
}
