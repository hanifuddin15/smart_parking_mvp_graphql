import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/modules/auth/bindings/auth_binding.dart';
import 'package:smart_parking_mvp_graphql/app/modules/auth/views/login_view.dart';
import 'package:smart_parking_mvp_graphql/app/modules/auth/views/register_view.dart';
import 'package:smart_parking_mvp_graphql/app/modules/home/bindings/home_binding.dart';
import 'package:smart_parking_mvp_graphql/app/modules/home/views/home_view.dart';
import 'package:smart_parking_mvp_graphql/app/modules/post/bindings/post_binding.dart';
import 'package:smart_parking_mvp_graphql/app/modules/post/views/post_list_view.dart';
import 'package:smart_parking_mvp_graphql/app/modules/profile/bindings/profile_binding.dart';
import 'package:smart_parking_mvp_graphql/app/modules/profile/views/profile_view.dart';
import 'package:smart_parking_mvp_graphql/app/routes/app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.POSTS,
      page: () => const PostListView(),
      binding: PostBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
