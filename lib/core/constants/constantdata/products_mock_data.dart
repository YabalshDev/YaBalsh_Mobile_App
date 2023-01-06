import '../../../features/home/domain/entities/price_model.dart';
import '../../../features/home/domain/entities/product.dart';

const productsMock = [
  Product(
      id: 1,
      imagePath:
          'https://yabalash.net/storage/UkdfnrzZCaoeTPeO0V2QT3EMkHe2DZ-metabWl4LnBuZw==-.png',
      name: 'جهينة مكس  شوكولاتة - 200 ملي - 27 قطعة',
      size: '200 ملي',
      prices: {
        'كارفور': PriceModel(
            isAvailable: true,
            price: 5.5,
            storeId: 1,
            storeImagePath:
                'https://yabalash.net/storage/RWq4N7pLbkMjmxoWNbpBkuHiNGKBoc-metaY2FyZWZvdXIucG5n-.png'),
        'امازون': PriceModel(
            isAvailable: true,
            price: 6,
            storeId: 2,
            storeImagePath:
                "https://yabalash.net/storage/gwpF88L2o61eLueVagmWEGHqeVKa5q-metaQW1hem9uLWljb24ucG5n-.png"),
      }),
  Product(
      id: 2,
      imagePath:
          'https://yabalash.net/storage/6X9cnDN7ZHSEy1RDqHVRoqlj9kTBlD-metabWl4LXN0cmF3YmVycnkucG5n-.png',
      name: 'بونجورنو كيس قهوة بندق - 400 جم',
      size: '400 جم',
      prices: {
        'كارفور': PriceModel(
            isAvailable: true,
            price: 5.5,
            storeId: 1,
            storeImagePath:
                'https://yabalash.net/storage/RWq4N7pLbkMjmxoWNbpBkuHiNGKBoc-metaY2FyZWZvdXIucG5n-.png'),
        'امازون': PriceModel(
            isAvailable: false,
            price: 6,
            storeId: 2,
            storeImagePath:
                "https://yabalash.net/storage/gwpF88L2o61eLueVagmWEGHqeVKa5q-metaQW1hem9uLWljb24ucG5n-.png"),
      }),
];
