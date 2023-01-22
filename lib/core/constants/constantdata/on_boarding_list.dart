import 'package:yabalash_mobile_app/core/constants/app_assets.dart';

import '../../../features/on_boaring/domain/entities/on_boarding.dart';

final List<OnBoarding> onBoardings = [
  const OnBoarding(
      imagePath: AppAssets.firstOnBoardingIllustration,
      title: 'قارن أسعار المنتجات',
      subTitile:
          'بنقدملك أكتر من +200 ألف منتج و بنقارنلك بين أسعارهم في كل السوبر ماركتس '),
  const OnBoarding(
      imagePath: AppAssets.secondOnBoardingIllustration,
      title: 'اعرف أرخص سعر فين',
      subTitile:
          'بعد اختيارك لكل إحتياجاتك، هنقولك تقدر تشتريهم منين بأقل سعر و توفر فلوسك !'),
  const OnBoarding(
      imagePath: AppAssets.thirdOnBoardingIllustration,
      title: 'هنوصلك لباب بيتك',
      subTitile:
          'زودت كل الي محتاجه؟ هنوصلهمك  من السوبرماركت الي تختاره لحد باب بيتك!')
];
