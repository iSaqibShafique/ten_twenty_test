import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ten_twenty_test/extensions/common_extensions.dart';
import 'package:ten_twenty_test/models/movie.dart';
import 'package:ten_twenty_test/routes/app_routes.dart';
import 'package:ten_twenty_test/styles/typography.dart';

class UpcomingMoviesDisplayWidget extends StatelessWidget {
  final Movie movie;
  final EdgeInsetsGeometry? margin;
  const UpcomingMoviesDisplayWidget(
      {super.key, required this.movie, this.margin});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: movie.backdropPath.getMovieThumbnail(),
      imageBuilder: (context, imageProvider) {
        return GestureDetector(
          onTap: () async {
            await HapticFeedback.heavyImpact();
            GoRouter.of(context).pushNamed(
                NamedRoutes.watchAMovieDetailsView.name,
                extra: movie);
          },
          child: Container(
            margin: margin,
            height: 180,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(bottom: 20, left: 20),
            child: Text(
              movie.title,
              style: kStyle18500.copyWith(color: Colors.white),
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return Container(
          margin: margin,
          height: 180,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: const CircularProgressIndicator(
            strokeCap: StrokeCap.round,
          ),
        );
      },
    );
  }
}
