import 'package:auto_route/auto_route.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:shopping_list_app/config/routes/app_router.dart';
import 'package:shopping_list_app/core/di/injection.dart';

@RoutePage()
class VerifyEmailScreen extends EmailVerificationScreen {
  const VerifyEmailScreen({super.key});

  @override
  List<FirebaseUIAction> get actions => [
        EmailVerifiedAction(() {
          getIt<AppRouter>().push(const ShoppingListRoute());
        }),
        AuthCancelledAction((context) {
          getIt<AppRouter>().push(const ShoppingListRoute());
        }),
      ];
}
