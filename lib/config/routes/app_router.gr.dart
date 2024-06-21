// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    NewItemFormRoute.name: (routeData) {
      return AutoRoutePage<GroceryItemEntity>(
        routeData: routeData,
        child: const NewItemFormScreen(),
      );
    },
    ShoppingListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShoppingListScreen(),
      );
    },
    SignInRegisterRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRegisterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignInRegisterScreen(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    UserProfilRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserProfilScreen(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VerifyEmailScreen(),
      );
    },
  };
}

/// generated route for
/// [NewItemFormScreen]
class NewItemFormRoute extends PageRouteInfo<void> {
  const NewItemFormRoute({List<PageRouteInfo>? children})
      : super(
          NewItemFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewItemFormRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShoppingListScreen]
class ShoppingListRoute extends PageRouteInfo<void> {
  const ShoppingListRoute({List<PageRouteInfo>? children})
      : super(
          ShoppingListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShoppingListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInRegisterScreen]
class SignInRegisterRoute extends PageRouteInfo<SignInRegisterRouteArgs> {
  SignInRegisterRoute({
    Key? key,
    required Function onResult,
    List<PageRouteInfo>? children,
  }) : super(
          SignInRegisterRoute.name,
          args: SignInRegisterRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'SignInRegisterRoute';

  static const PageInfo<SignInRegisterRouteArgs> page =
      PageInfo<SignInRegisterRouteArgs>(name);
}

class SignInRegisterRouteArgs {
  const SignInRegisterRouteArgs({
    this.key,
    required this.onResult,
  });

  final Key? key;

  final Function onResult;

  @override
  String toString() {
    return 'SignInRegisterRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [UserProfilScreen]
class UserProfilRoute extends PageRouteInfo<void> {
  const UserProfilRoute({List<PageRouteInfo>? children})
      : super(
          UserProfilRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfilRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyEmailScreen]
class VerifyEmailRoute extends PageRouteInfo<void> {
  const VerifyEmailRoute({List<PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
