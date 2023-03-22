part of '../detail_page.dart';

class _Events extends StatefulWidget {
  const _Events({super.key});

  @override
  State<_Events> createState() => _EventsState();
}

class _EventsState extends State<_Events> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        BlocBuilder<DetailBloc, DetailState>(
          buildWhen: (_, state) =>
              state is LoadedEventsState ||
              state is LoadingEventsState ||
              state is FailureEventsState,
          builder: (context, state) {
            if (state is FailureEventsState) {
              return const SizedBox.shrink();
            }
            if (state is LoadedEventsState) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text("Eventos"),
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
                          padding: const EdgeInsets.only(right: 20),
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
            return SkeletonItem();
          },
        ),
      ],
    );
  }
}
