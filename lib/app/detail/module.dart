import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvels/app/detail/data/repository/detail_repository_imp.dart';
import 'package:marvels/app/detail/domain/repositories/detail_repository.dart';
import 'package:marvels/app/detail/presenter/bloc/detail_bloc.dart';
import 'package:marvels/app/detail/presenter/page/detail_page.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class DetailModule extends Module {
  static const routeName = "/detail";

  @override
  List<Bind> get binds => [
        Bind((i) => DetailRepositoryImp()),
        BlocBind.singleton((i) => DetailBloc(i<DetailRepository>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => DetailPage(
            character: args.data,
          ),
        )
      ];
}
