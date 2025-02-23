import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ten_twenty_test/blocs/main_watch/main_watch_bloc.dart';
import 'package:ten_twenty_test/models/upcoming_movies.dart';
import 'package:ten_twenty_test/styles/typography.dart';
import 'package:ten_twenty_test/widgets/searched_movies_widget.dart';
import 'package:ten_twenty_test/widgets/secondary_app_bar.dart';
import 'package:ten_twenty_test/widgets/upcoming_movies_display_widget.dart';

class MainWatchView extends StatefulWidget {
  const MainWatchView({super.key});

  @override
  State<MainWatchView> createState() => _MainWatchViewState();
}

class _MainWatchViewState extends State<MainWatchView> {
  final searchController = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<MainWatchBloc>(context).add(GetUpcomingMoviesEvent());
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(controller: searchController),
      body: BlocConsumer<MainWatchBloc, MainWatchState>(
        listener: (context, state) {
          if (state is MainWatchInitial && state.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                  style: kStyle14400,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is MainWatchInitial) {
            if (state.isLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                strokeCap: StrokeCap.round,
              ));
            } else {
              final UpcomingMovies? movies = state.movies;
              final bool isSearching = state.userSearchingMovies;
              if (movies != null && !isSearching) {
                return ListView.builder(
                  padding: const EdgeInsets.only(
                      top: 30, left: 20, right: 20, bottom: 60),
                  itemCount: movies.results.length,
                  itemBuilder: (context, index) {
                    return UpcomingMoviesDisplayWidget(
                      margin: EdgeInsets.only(top: index == 0 ? 0 : 20),
                      movie: movies.results[index],
                    );
                  },
                );
              } else if (isSearching) {
                final movies = state.searchedMovies;
                return movies.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Nothing found, please try again with different keyword",
                            style: kStyle14400,
                          ),
                        ),
                      )
                    : ListView(
                        padding: const EdgeInsets.only(
                            top: 30, left: 20, right: 20, bottom: 60),
                        children: [
                          Text(
                            "Top results",
                            style: kStyle12500,
                          ),
                          const Gap(10),
                          Divider(
                            height: 1,
                            color: Colors.black.withValues(
                              alpha: .11,
                            ),
                          ),
                          ...List.generate(movies.length, (index) {
                            return SearchedMoviesWidget(movie: movies[index]);
                          })
                        ],
                      );
              } else {
                return const SizedBox();
              }
            }
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
