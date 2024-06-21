import 'package:auto_route/auto_route.dart';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import 'package:shopping_list_app/config/routes/app_router.dart';
import 'package:shopping_list_app/core/di/injection.dart';

@RoutePage()
class SignInRegisterScreen extends SignInScreen {
  const SignInRegisterScreen({super.key, required this.onResult});

  final Function onResult;

  @override
  HeaderBuilder? get headerBuilder => _header;


  //@override
  //List<AuthProvider<AuthListener, AuthCredential>> get providers => [

 // ];

  @override
  List<FirebaseUIAction> get actions => [
        AuthStateChangeAction<SignedIn>((context, state) {
          if (!state.user!.emailVerified) {
            getIt<AppRouter>().push(const VerifyEmailRoute());
          } else {
            onResult(true);
          }
        }),
        AuthStateChangeAction<UserCreated>((context, state) {
          getIt<AppRouter>().push(const VerifyEmailRoute());
        }),
      ];

  Widget _header(
      BuildContext context, BoxConstraints constraints, double shrinkOffset) {
    return Column(
      children: [
        const SizedBox(height: 5),
        AspectRatio(
            aspectRatio: 3,
            child: Image.network(
              "https://cdni.iconscout.com/illustration/premium/thumb/mobile-grocery-list-7365672-6037530.png?f=webp",
            ),
          ),
      ],
    );
    
  }
}
