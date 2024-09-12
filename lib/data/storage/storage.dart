import 'package:bank_mobile/data/module/base_models/tokens.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import 'base_storage.dart';

@lazySingleton
class Storage {
  Storage(this._box);

  final Box _box;

  @FactoryMethod(preResolve: true)
  static Future<Storage> create() async {
    await Hive.initFlutter();

    Hive.registerAdapter(TokensImplAdapter());

    final box = await Hive.openBox('storage');
    return Storage(box);
  }

  BaseStorage<bool> get showOnboard => BaseStorage(_box, 'showOnboard');

  BaseStorage<Tokens> get tokens => BaseStorage(_box, 'tokens');

  BaseStorage<bool>? get isDark => BaseStorage(_box, "isDark");

  BaseStorage<String> get role => BaseStorage(_box, 'role');
}
