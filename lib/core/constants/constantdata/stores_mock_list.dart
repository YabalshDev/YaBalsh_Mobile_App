import 'package:yabalash_mobile_app/core/constants/app_assets.dart';

import '../../../features/home/domain/entities/store.dart';

const List<Store> storesMock = [
  Store(
      id: 1, name: 'كارفور', cardImagePath: AppAssets.carefour, locations: []),
  Store(id: 2, name: 'جورميه', cardImagePath: AppAssets.gourmet, locations: []),
  Store(id: 3, name: 'سعودي', cardImagePath: AppAssets.seoudi, locations: []),
  Store(
      id: 4, name: 'كارفور', cardImagePath: AppAssets.carefour, locations: []),
  Store(
      id: 5, name: 'كارفور', cardImagePath: AppAssets.carefour, locations: []),
];
