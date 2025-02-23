import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ten_twenty_test/blocs/main_watch/main_watch_bloc.dart';
import 'package:ten_twenty_test/styles/app_colors.dart';
import 'package:ten_twenty_test/styles/typography.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSize {
  final TextEditingController controller;
  const SecondaryAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffEFEFEF),
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: BlocBuilder<MainWatchBloc, MainWatchState>(
        builder: (context, state) {
          if (state is MainWatchInitial) {
            final bool isSearchState = state.userInSearchState;
            return isSearchState
                ? Padding(
                    padding:
                        const EdgeInsets.only(left: 21, right: 20, bottom: 25),
                    child: TextFormField(
                      controller: controller,
                      onChanged: (value) => context
                          .read<MainWatchBloc>()
                          .add(OnSearchMoviesEvent(value)),
                      decoration: InputDecoration(
                        hintText: "TV shows, movies and more",
                        prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 18, right: 11),
                            child: SvgPicture.asset("assets/svgs/search.svg")),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(
                              onPressed: () {
                                controller.clear();
                                context
                                    .read<MainWatchBloc>()
                                    .add(OnEndSearchMoviesEvent());
                              },
                              icon: SvgPicture.asset("assets/svgs/x_mark.svg")),
                        ),
                        prefixIconConstraints:
                            const BoxConstraints(maxWidth: 36 + 20),
                        contentPadding: const EdgeInsets.only(
                          left: 48,
                          top: 16,
                          bottom: 16,
                          right: 48,
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 31, bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Watch",
                          style: kStyle16500.copyWith(
                            color: AppColors.textDark,
                          ),
                        ),
                        IconButton(
                          onPressed: () => context
                              .read<MainWatchBloc>()
                              .add(AddOrRemoveUserToSearchState()),
                          icon: SvgPicture.asset("assets/svgs/search.svg",
                              height: 19, width: 19),
                          style: const ButtonStyle().copyWith(
                            minimumSize:
                                const WidgetStatePropertyAll(Size(36, 36)),
                            padding:
                                const WidgetStatePropertyAll(EdgeInsets.zero),
                          ),
                        )
                      ],
                    ),
                  );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  @override
  Widget get child => throw const SizedBox();

  @override
  Size get preferredSize => const Size.fromHeight(111);
}
