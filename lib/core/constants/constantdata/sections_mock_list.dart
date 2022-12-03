import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/price_model.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/section.dart';

const List<Section> sections = [
  Section(keyWord: 'ارخص الاسعار للمنتجات', products: [
    Product(
        id: '1',
        imagePath: AppAssets.mix,
        name: 'جهينة مكس  شوكولاتة - 200 ملي - 27 قطعة',
        size: 200,
        sizeType: 'capacity',
        prices: {
          'كارفور': PriceModel(
              isAvailable: true,
              price: 119.95,
              storeId: '1',
              storeImagePath: AppAssets.carefour),
          'جورميه': PriceModel(
              isAvailable: true,
              price: 133,
              storeId: '2',
              storeImagePath: AppAssets.gourmet),
        }),
    Product(
        id: '2',
        imagePath: AppAssets.mix,
        name: 'بونجورنو كيس قهوة بندق - 400 جم',
        size: 400,
        sizeType: 'weight',
        prices: {
          'كارفور': PriceModel(
              isAvailable: true,
              price: 45.45,
              storeId: '1',
              storeImagePath: AppAssets.carefour),
          'جورميه': PriceModel(
              isAvailable: true,
              price: 55.45,
              storeId: '2',
              storeImagePath: AppAssets.gourmet),
        }),
  ])
];
