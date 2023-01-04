import '../../../features/home/domain/entities/price_model.dart';
import '../../../features/home/domain/entities/product.dart';
import '../app_assets.dart';

const productsMock = [
  Product(
      id: 1,
      imagePath: AppAssets.mix,
      name: 'جهينة مكس  شوكولاتة - 200 ملي - 27 قطعة',
      size: '200 ملي',
      prices: {
        'كارفور': PriceModel(
            isAvailable: true,
            price: 119.95,
            storeId: 1,
            storeImagePath: AppAssets.carefour),
        'جورميه': PriceModel(
            isAvailable: false,
            price: 133,
            storeId: 2,
            storeImagePath: AppAssets.gourmet),
      }),
  Product(
      id: 2,
      imagePath: AppAssets.mix,
      name: 'بونجورنو كيس قهوة بندق - 400 جم',
      size: '400 جم',
      prices: {
        'كارفور': PriceModel(
            isAvailable: true,
            price: 45.45,
            storeId: 1,
            storeImagePath: AppAssets.carefour),
        'جورميه': PriceModel(
            isAvailable: false,
            price: 55.45,
            storeId: 2,
            storeImagePath: AppAssets.gourmet),
      }),
];
