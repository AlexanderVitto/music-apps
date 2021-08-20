import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../provider/providers.dart';
import '../screen/search/search_provider.dart';

List<SingleChildWidget> setupProviders() {
  List<SingleChildWidget> providers = [
    ...topLevelProviders(),
    ...stateProviders()
  ];

  return providers;
}

List<SingleChildWidget> topLevelProviders() {
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (_) => Music(),
      lazy: true,
    ),
  ];

  return providers;
}

List<SingleChildWidget> stateProviders() {
  List<SingleChildWidget> providers = [
    ChangeNotifierProxyProvider<Music, SearchProvider>(
      create: (ctx) => SearchProvider(ctx.read<Music>()),
      update: (_, musicProvider, prevProvider) =>
          prevProvider..update(musicProvider),
    )
  ];

  return providers;
}
