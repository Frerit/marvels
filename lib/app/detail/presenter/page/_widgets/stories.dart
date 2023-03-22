part of '../detail_page.dart';

class _Stories extends StatefulWidget {
  const _Stories({super.key});

  @override
  State<_Stories> createState() => _StoriesState();
}

class _StoriesState extends State<_Stories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        BlocBuilder<DetailBloc, DetailState>(
          buildWhen: (previous, state) =>
              state is LoadedStoriesState ||
              state is LoadingStoriesState ||
              state is FailureStoriesState,
          builder: (context, state) {
            if (state is FailureStoriesState) {
              return const SizedBox.shrink();
            }
            if (state is LoadedStoriesState) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text("Stories"),
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
                          padding: const EdgeInsets.only(right: 25),
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
