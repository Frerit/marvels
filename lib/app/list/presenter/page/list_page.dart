import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvels/app/detail/module.dart';
import 'package:marvels/app/list/presenter/bloc/list_bloc.dart';

import '_widgets/card_character.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<ListBloc>()
        ..add(
          GetCharactersEvent(),
        ),
      child: _View(),
    );
  }
}

class _View extends StatelessWidget {
  _View({
    Key? key,
  }) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  void listenerScroll(ScrollController scroll) {
    final isFetching = !Modular.get<ListBloc>().isFetching;
    if (scroll.offset == scroll.position.maxScrollExtent && isFetching) {
      Modular.get<ListBloc>()
        ..isFetching = true
        ..page += 1
        ..add(
          GetMoreCharactersEvent(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListBloc, ListState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadedListState) {
          return Scaffold(
            body: Stack(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 230,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                    ),
                    padding: const EdgeInsets.only(top: 160),
                    primary: false,
                    itemCount: state.results.length + 1,
                    controller: _scrollController
                      ..addListener(() {
                        listenerScroll(_scrollController);
                      }),
                    itemBuilder: (context, index) {
                      if (index == state.results.length) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 100,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      final marvels = state.results[index];
                      return CardCharacter(
                        character: marvels,
                        onPress: (image) => Modular.to.pushNamed(
                            DetailModule.routeName,
                            arguments: marvels),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://1000logos.net/wp-content/uploads/2021/06/Marvel-Comics-logo.png",
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                  ],
                ),
              ),
            ]),
          );
        }

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              value: null,
              strokeWidth: 7,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
