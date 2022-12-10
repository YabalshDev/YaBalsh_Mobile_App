import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';

void openHiveBoxes() async {
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openLazyBox(AppStrings.isFirstTimeVisitKey);
}
