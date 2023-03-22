part of '../detail_page.dart';

class _Series extends StatefulWidget {
  const _Series({super.key});

  @override
  State<_Series> createState() => _SeriesState();
}

class _SeriesState extends State<_Series> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        BlocBuilder<DetailBloc, DetailState>(
          buildWhen: (previous, state) =>
              state is LoadedSeriesState ||
              state is LoadingSeriessState ||
              state is FailureSeriesState,
          builder: (context, state) {
            if (state is FailureSeriesState) {
              return const SizedBox.shrink();
            }
            if (state is LoadedSeriesState) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text("Series"),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ListView.builder(
                      itemCount: state.events.results.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final event = state.events.results[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CardParticipation(
                            image: event.thumbnail,
                            name: event.title ?? '',
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
