import 'package:go_router/go_router.dart';
import 'package:meditator_app/pages/main_screen.dart';
import 'package:meditator_app/router/router_names.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: RouterName.mainPage,
        builder: (context, state) {
          return MainScreen();
        },
      )
    ],
  );
}
