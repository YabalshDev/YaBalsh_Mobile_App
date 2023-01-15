import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_animated_widget.dart';
import 'package:yabalash_mobile_app/core/widgets/internet_connection_wrapper.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/views/cart_view.dart';
import 'package:yabalash_mobile_app/features/categories/presentation/blocs/categories_cubit.dart';
import 'package:yabalash_mobile_app/features/categories/presentation/views/category_view.dart';
import 'package:yabalash_mobile_app/features/home/presentation/blocs/cubit/home_cubit.dart';
import 'package:yabalash_mobile_app/features/home/presentation/blocs/cubit/main_navigation_cubit.dart';
import 'package:yabalash_mobile_app/features/home/presentation/views/home_view.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/nav_icon.dart';
import 'package:yabalash_mobile_app/features/settings/presentation/views/settings_view.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/blocs/cubit/shopping_list_cubit.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/views/shopping_lists_view.dart';

import '../../../../core/depedencies.dart';
import '../../../cart/presentation/blocs/cubit/cart_cubit.dart';

class MainNavigation extends StatefulWidget {
  final int pageIndex;
  const MainNavigation({super.key, required this.pageIndex});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  PageController? _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: widget.pageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: screens.length,
              itemBuilder: ((context, index) {
                return screens[index];
              }))),
      bottomNavigationBar: MainBottomNavBar(
        pageController: _pageController!,
      ),
    );
  }
}

class MainBottomNavBar extends StatelessWidget {
  final PageController pageController;

  const MainBottomNavBar({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainNavigationCubit, MainNavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex:
              BlocProvider.of<MainNavigationCubit>(context).currentPageIndex,
          onTap: (value) {
            BlocProvider.of<MainNavigationCubit>(context).setPageIndex(value);
            pageController.jumpToPage(
              value,
            );
          },
          items: [
            BottomNavigationBarItem(
                icon: NavIcon(
                    activeIndex: BlocProvider.of<MainNavigationCubit>(context)
                        .currentPageIndex,
                    iconPath: AppAssets.homeIcon,
                    itemIndex: 0),
                label: 'الرئيسية'),
            BottomNavigationBarItem(
                icon: NavIcon(
                    activeIndex: BlocProvider.of<MainNavigationCubit>(context)
                        .currentPageIndex,
                    iconPath: AppAssets.menuIcon,
                    itemIndex: 1),
                label: 'الاقسام'),
            BottomNavigationBarItem(
                icon: NavIcon(
                    activeIndex: BlocProvider.of<MainNavigationCubit>(context)
                        .currentPageIndex,
                    iconPath: AppAssets.cartIcon,
                    itemIndex: 2),
                label: 'السلة'),
            BottomNavigationBarItem(
                icon: NavIcon(
                    activeIndex: BlocProvider.of<MainNavigationCubit>(context)
                        .currentPageIndex,
                    iconPath: AppAssets.shoppingListsIcon,
                    itemIndex: 3),
                label: 'قوائمي'),
            BottomNavigationBarItem(
                icon: NavIcon(
                    activeIndex: BlocProvider.of<MainNavigationCubit>(context)
                        .currentPageIndex,
                    iconPath: AppAssets.settingsIcon,
                    itemIndex: 4),
                label: 'الاعدادت')
          ],
        );
      },
    );
  }
}

final List<Widget> screens = [
  InternetConnectionWrapper(
    child: BlocProvider<HomeCubit>(
      create: (context) {
        if (!getIt<HomeCubit>().isClosed) {
          return getIt<HomeCubit>()
            ..getLastOffers()
            ..getBanners()
            ..getNearStores()
            ..getHomeSections();
        }

        return getIt<HomeCubit>();
      },
      child: const CustomAnimatedWidget(child: HomeView()),
    ),
  ),
  InternetConnectionWrapper(
      child: BlocProvider<CategoriesCubit>(
    create: (context) => getIt<CategoriesCubit>()..getCategoriesSections(),
    child: const CustomAnimatedWidget(child: CategoriesScreen()),
  )),
  InternetConnectionWrapper(
    child: CustomAnimatedWidget(
      child: MultiBlocProvider(providers: [
        BlocProvider.value(value: getIt<CartCubit>()),
      ], child: const CartView()),
    ),
  ),
  InternetConnectionWrapper(
    child: CustomAnimatedWidget(
        child: CustomAnimatedWidget(
            child: BlocProvider<ShoppingListCubit>(
      create: (context) => getIt<ShoppingListCubit>()
        ..getAllShoppingList()
        ..getRecipies(),
      child: const ShoppingListsView(),
    ))),
  ),
  const CustomAnimatedWidget(child: SettingsView()),
];
