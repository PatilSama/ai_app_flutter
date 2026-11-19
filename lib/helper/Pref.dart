import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Pref {

  static late Box _box;
  static Future<void> initialized()async{
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    _box = await Hive.openBox('MyData');
  }

  static bool get showOnBoarding => _box.get("showOnBoarding",defaultValue: true);
  static set showOnBoarding(bool v) => _box.put("showOnBoarding", v);
}