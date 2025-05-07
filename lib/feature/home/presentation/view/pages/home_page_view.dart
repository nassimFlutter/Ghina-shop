import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/feature/home/presentation/manager/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _selectedIndex = 0;
// todo : finish translate
  Future<void> openWhatsApp(String phone) async {
    String phoneNumber = phone;
    String url = 'https://wa.me/$phoneNumber';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not open WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    NavBarCubit navBarCubit = NavBarCubit.get(context);
    // HelperFunctions.clearUserData();

    return BlocConsumer<NavBarCubit, NavBarState>(
      listener: (context, state) {
        if (state is ChangeTab) {
          _selectedIndex = state.index;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              openWhatsApp('+963931451710');
            },
            backgroundColor: AppColor.green,
            child: SvgPicture.asset(
              IconsPath.whatsAppIcon, // Add your WhatsApp SVG icon path
              color: Colors.white,
              height: 28,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: (value) {
              _selectedIndex = value;
              navBarCubit.changeTab(value, context);
            },
            showUnselectedLabels: true,
            selectedLabelStyle: AppStyles.textStyle12w700,
            unselectedLabelStyle: AppStyles.textStyle12w700,
            selectedItemColor: AppColor.corn,

            unselectedItemColor: Colors.black,
            // backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(IconsPath.homeSelectedIcon,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        AppColor.buddhaGold, BlendMode.srcIn)),
                icon: SvgPicture.asset(
                  IconsPath.homeIcon,
                  fit: BoxFit.cover,
                ),
                label: S.of(context).home, //"Home",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(IconsPath.categorySelectedIcon,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        AppColor.buddhaGold, BlendMode.srcIn)),
                icon: SvgPicture.asset(
                  IconsPath.categoryIcon,
                  fit: BoxFit.cover,
                ),
                label: S.of(context).category, //"category",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(IconsPath.storeIcon,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        AppColor.buddhaGold, BlendMode.srcIn)),
                icon: SvgPicture.asset(
                  IconsPath.storeIcon,
                  fit: BoxFit.cover,
                ),
                label: S.of(context).stores, //"category",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  IconsPath.cartSelectedIcon,
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                      AppColor.buddhaGold, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset(
                  IconsPath.cartIcon,
                  fit: BoxFit.cover,
                ),
                label: S.of(context).cart, //"cart",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(IconsPath.accountSelectedIcon,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        AppColor.buddhaGold, BlendMode.srcIn)),
                icon: SvgPicture.asset(
                  IconsPath.accountIcon,
                  fit: BoxFit.cover,
                ),
                label: S.of(context).account, //"account",
              ),
            ],
          ),
          body: navBarCubit.screens[_selectedIndex],
        );
      },
    );
  }
}
