import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvels/app/detail/presenter/bloc/detail_bloc.dart';
import 'package:marvels/app/detail/presenter/page/_widgets/card_participation.dart';
import 'package:marvels/app/detail/presenter/page/_widgets/skeleton_item.dart';
import 'package:marvels/app/list/domain/entities/m_characters.dart';

part './_widgets/header.dart';
part './_widgets/series.dart';
part './_widgets/events.dart';
part './_widgets/comics.dart';
part './_widgets/stories.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.character,
  }) : super(key: key);

  final MarverCharacter character;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<DetailBloc>()
        ..add(
          InitialEvent(id: character.id),
        ),
      child: _View(character: character),
    );
  }
}

class _View extends StatelessWidget {
  const _View({
    required this.character,
  });

  final MarverCharacter character;

  @override
  Widget build(BuildContext context) {
    final img = "${character.thumbnail.path}.${character.thumbnail.extension}";

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Header(
              character: character,
              img: img,
              onPressed: () => Modular.to.pop(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    character.name,
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const _Comics(),
            const _Series(),
            const _Events(),
            const _Stories(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
