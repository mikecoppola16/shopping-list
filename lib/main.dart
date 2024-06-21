import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list_app/core/di/injection.dart';
import 'package:shopping_list_app/config/routes/app_router.dart';
import 'package:shopping_list_app/config/theme/theme.dart';
import 'package:shopping_list_app/features/shopping_list/presentation/bloc/article/remote/remote_grocery_bloc.dart';
import 'package:shopping_list_app/features/shopping_list/presentation/bloc/article/remote/remote_grocery_event.dart';
import 'package:shopping_list_app/firebase_options.dart';

Future<void> main() async {
  await initializeDependencies();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    GoogleProvider(clientId: "483662825708-0p8104h34tbcq5mfdmrbf5bcpdu8kgms.apps.googleusercontent.com"),
    // ... other providers
  ]);

  runApp(ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {
  ShoppingListApp({super.key});

  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteGroceryItemsBloc>(
        create: (context) => getIt()..add(LoadGroceryListItems()),
        child: MaterialApp.router(
          title: 'Flutter Groceries',
          theme: AppTheme.darkTheme,
          routerConfig: _appRouter.config(),
        ));
  }
}
