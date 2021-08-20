import 'package:get_it/get_it.dart';

import '../helper/helper.dart';

import '../service/itunes_store.dart' as itunesStore;

GetIt locator = GetIt.instance;

setupLocator() {
  // Factory

  locator.registerFactoryParam<LogHelper, String, bool>((fileName, isEnable) =>
      LogHelper(fileName: fileName, isEnable: isEnable));
  locator.registerFactory<Request>(() => Request());

  // Switch between testing(with dummy data) and development
  // Example:
  // locator.registerFactory<itunesStore.ItunesStoreAPI>(
  //   () => itunesStore.Testing());

  locator.registerFactory<itunesStore.ItunesStoreAPI>(
      () => itunesStore.Development());
}
