import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/language/lang_keys.dart';
import 'package:getme/core/routes/routes_name.dart';
import 'package:getme/core/style/color/app_color.dart';
import 'package:getme/core/style/statics/image_test.dart';
import 'package:getme/core/style/widgets/app_text.dart';

import '../../core/app/language/language_cubit/language_cubit.dart';
import '../../core/services/shared_pref/pref_keys.dart';
import '../../core/services/shared_pref/shared_pref.dart';
import '../../core/style/font/fonts_helper.dart';
import '../home_screen/presentation/widgets/choose_language_bottom_sheet.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    if (SharedPref.getData(key: PrefKeys.languageFirstTime) == null) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _showLanguageBottomSheet());
    }
  }

  Future<void> _showLanguageBottomSheet() async {
    final languageCubit = context.read<LanguageCubit>();
    await showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) => LanguageBottomSheet(languageCubit),
    );
  }

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<Widget> _pages = [
    OnboardingPage(
      image: AppImages.logo,
      title: LangKeys.title1,
      description: LangKeys.body1,
      bgColor: AppColors.black,
      textColor: AppColors.black,
      index: 0,
    ),
    OnboardingPage(
      image: AppImages.title1,
      title: LangKeys.title2,
      description: LangKeys.body2,
      bgColor: AppColors.black,
      textColor: AppColors.black,
      index: 1,
    ),
    OnboardingPage(
      image: AppImages.title2,
      title: LangKeys.title3,
      description: LangKeys.body3,
      bgColor: AppColors.black,
      textColor: AppColors.black,
      index: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var isArabic = FontsHelper.isArabic(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) => _pages[index],
          ),
          Positioned(
            bottom: 20,
            left: isArabic ? 20 : null,
            right: isArabic ? null : 20,
            child: Column(
              spacing: 10,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_pages.length, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 8,
                      width: _currentPage == index ? 30 : 15,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: _currentPage == index
                            ? Colors.black
                            : Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  }),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: _currentPage == _pages.length - 1
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            SharedPref.saveData(
                                key: PrefKeys.onBoarding, value: true);
                            context.pushNamedAndRemoveUntil(
                              RoutesNames.homeScreen,
                            );
                          },
                          child: AppText(
                            context.translate(LangKeys.discover),
                          ),
                        )
                      : FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Icon(Icons.arrow_forward_ios,
                              color: Colors.black),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Color bgColor;
  final Color textColor;
  final int index;
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.bgColor,
    required this.textColor,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: SizedBox(
              height: context.height(percent: 0.8),
              child: AnimatedBuilder(
                animation: PageController(),
                builder: (context, child) {
                  return Transform.scale(
                    scale: index == 0 ? 0.6 : 1.2,
                    child: child,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: index == 0 ? BoxFit.contain : BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 0,
            left: 0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppText(
                  context.translate(title),
                  fontSize: context.headlineLarge!.fontSize,
                  color: AppColors.white,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: context.height(percent: 0.35),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    context.translate(description),
                    maxLines: 20,
                    textAlign: TextAlign.start,
                    fontSize: context.headlineSmall!.fontSize,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
