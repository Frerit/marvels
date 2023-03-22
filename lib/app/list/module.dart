import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvels/app/list/data/repository/list_repository_imp.dart';
import 'package:marvels/app/list/domain/repositories/list_characters_repository.dart';
import 'package:marvels/app/list/presenter/bloc/list_bloc.dart';
import 'package:marvels/app/list/presenter/page/list_page.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class ListModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => ListCharactersRepositoryImp()),
        BlocBind.singleton((i) => ListBloc(i<ListCharactersRepository>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => const ListPage(),
        )
      ];
}
