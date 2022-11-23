import 'package:app_filmes/application/ui/filmes_app_icons_icons.dart';
import 'package:app_filmes/modules/favorites/favorites_page.dart';
import 'package:app_filmes/modules/movies/movies_bindings.dart';
import 'package:app_filmes/modules/movies/movies_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app_filmes/application/ui/theme_extensions.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/movies',
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
                settings: settings,
                page: () => const MoviesPage(),
                binding: MoviesBindings());
          }
          if (settings.name == '/favorites') {
            return GetPageRoute(
              settings: settings,
              page: () => const FavoritesPage(),
            );
          }
          return null;
        },
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            selectedItemColor: context.themeRed,
            unselectedItemColor: context.themeGrey,
            onTap: controller.goToPage,
            currentIndex: controller.pageIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'Filmes',
              ),
              BottomNavigationBarItem(
                icon: Icon(FilmesAppIcons.heart_empty),
                label: 'Favoritos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.login_outlined),
                label: 'Sair',
              ),
            ],
          );
        },
      ),
    );
  }
}
