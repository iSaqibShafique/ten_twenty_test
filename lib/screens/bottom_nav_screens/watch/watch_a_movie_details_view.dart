import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ten_twenty_test/extensions/common_extensions.dart';
import 'package:ten_twenty_test/models/movie.dart';
import 'package:ten_twenty_test/routes/app_routes.dart';
import 'package:ten_twenty_test/styles/app_colors.dart';
import 'package:ten_twenty_test/styles/typography.dart';

class WatchAMovieDetailsView extends StatefulWidget {
  const WatchAMovieDetailsView({super.key});

  @override
  State<WatchAMovieDetailsView> createState() => _WatchAMovieDetailsViewState();
}

class _WatchAMovieDetailsViewState extends State<WatchAMovieDetailsView> {
  late final Movie movie;

  void initMovie() {
    final obj = GoRouter.of(context).state.extra;
    if (obj != null) {
      movie = obj as Movie;
    }
  }

  @override
  void initState() {
    initMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 135,
        backgroundColor: Colors.transparent,
        leading: OutlinedButton.icon(
          onPressed: () => GoRouter.of(context).pop(),
          label: const Text("Watch"),
          icon: SvgPicture.asset("assets/svgs/chevron_left.svg"),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          CachedNetworkImage(
            imageUrl: movie.backdropPath.getMovieThumbnail(),
            imageBuilder: (context, imageProvider) {
              return Container(
                height: 359 + 40,
                padding: const EdgeInsets.only(bottom: 34, left: 66, right: 66),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "In theaters ${DateFormat("MMMM dd, yyyy").format(DateTime.parse(movie.releaseDate))}",
                      style: kStyle16500.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const Gap(15),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Get Tickets"),
                    ),
                    const Gap(10),
                    TextButton.icon(
                      onPressed: () => GoRouter.of(context).pushNamed(
                          NamedRoutes.watchTraillerView.name,
                          extra: movie),
                      label: const Text("Watch Trailer"),
                      icon: const Icon(Icons.play_arrow),
                      style: const ButtonStyle().copyWith(
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 40, top: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 65,
                  width: MediaQuery.sizeOf(context).width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movie.genreIds.getGenreNamesList().length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 0 : 5),
                        child: Chip(
                          backgroundColor: AppColors.colors[index],
                          label:
                              Text(movie.genreIds.getGenreNamesList()[index]),
                        ),
                      );
                    },
                  ),
                ),
                const Gap(22),
                const Divider(height: 1),
                const Gap(15),
                Text("Overview", style: kStyle16500),
                const Gap(14),
                Text(
                  movie.overview,
                  style: kStyle12400.copyWith(
                    color: AppColors.greyText,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
