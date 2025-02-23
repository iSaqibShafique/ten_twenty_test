import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ten_twenty_test/extensions/common_extensions.dart';
import 'package:ten_twenty_test/models/movie.dart';
import 'package:ten_twenty_test/routes/app_routes.dart';
import 'package:ten_twenty_test/styles/typography.dart';

class SearchedMoviesWidget extends StatelessWidget {
  final Movie movie;
  const SearchedMoviesWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () async {
          await HapticFeedback.heavyImpact();
          GoRouter.of(context)
              .pushNamed(NamedRoutes.watchAMovieDetailsView.name, extra: movie);
        },
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: movie.backdropPath.getMovieThumbnail(),
              imageBuilder: (context, imageProvider) => Container(
                height: 100,
                width: 130,
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const Gap(21),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: kStyle16500),
                  const Gap(8),
                  Text(movie.genreIds.getGenreName()),
                ],
              ),
            ),
            const Spacer(),
            SvgPicture.asset("assets/svgs/3_x_circles.svg"),
          ],
        ),
      ),
    );
  }
}
