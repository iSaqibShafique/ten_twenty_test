import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ten_twenty_test/blocs/dashboard/dashboard_bloc.dart';
import 'package:ten_twenty_test/styles/app_colors.dart';
import 'package:ten_twenty_test/styles/typography.dart';

class KBottomNav extends StatelessWidget {
  const KBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> bottomNavItems = [
      {
        "icon": "assets/svgs/4_x_circles.svg",
        "label": "Dashboard",
      },
      {
        "icon": "assets/svgs/watch.svg",
        "label": "Watch",
      },
      {
        "icon": "assets/svgs/media_library.svg",
        "label": "Media Library",
      },
      {
        "icon": "assets/svgs/3_x_vertical_lines.svg",
        "label": "More",
      }
    ];
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 75 + 18,
      ),
      padding: const EdgeInsets.only(left: 26, top: 17, right: 25, bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.bottomNavBackground,
        borderRadius: BorderRadius.circular(27),
      ),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return state is DashboardInitial
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(bottomNavItems.length, (index) {
                    return IconButton(
                      onPressed: () async {
                        await HapticFeedback.heavyImpact();
                        context
                            .read<DashboardBloc>()
                            .add(UpdateBottomNavBarIndexEvent(index: index));
                      },
                      icon: Column(
                        children: [
                          SvgPicture.asset(
                            bottomNavItems[index]["icon"]!,
                            height: 18,
                            width: 18,
                            colorFilter: ColorFilter.mode(
                                index == state.selectedIndex
                                    ? AppColors.selectedBottomNavForeground
                                    : AppColors.unselectedBottomNavForeground,
                                BlendMode.srcIn),
                          ),
                          const Gap(8),
                          Text(
                            bottomNavItems[index]["label"]!,
                            style: kStyle10400.copyWith(
                              color: index == state.selectedIndex
                                  ? AppColors.selectedBottomNavForeground
                                  : AppColors.unselectedBottomNavForeground,
                              fontWeight: index == state.selectedIndex
                                  ? FontWeight.w700
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    );
                  }))
              : const SizedBox();
        },
      ),
    );
  }
}
