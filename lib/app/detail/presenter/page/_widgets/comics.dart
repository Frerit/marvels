part of '../detail_page.dart';

class _Comics extends StatefulWidget {
  const _Comics({super.key});

  @override
  State<_Comics> createState() => _ComicsState();
}

class _ComicsState extends State<_Comics> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        BlocBuilder<DetailBloc, DetailState>(
          buildWhen: (previous, state) =>
              state is LoadedComicsState ||
              state is LoadingComicsState ||
              state is FailureComicsState,
          builder: (context, state) {
            if (state is FailureComicsState) {
              return const SizedBox.shrink();
            }
            if (state is LoadedComicsState) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text("Comics"),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ListView.builder(
                      itemCount: state.events.results?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final event = state.events.results?[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: CardParticipation(
                            image: event?.thumbnail,
                            name: event?.title ?? '',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return const SkeletonItem();
          },
        ),
      ],
    );
  }
}
