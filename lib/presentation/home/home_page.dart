import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers/domain/mock_sneakers.dart';
import 'package:sneakers/presentation/home/cubit/brand_cubit.dart';
import 'package:sneakers/presentation/home/cubit/brand_state.dart';
import 'package:sneakers/presentation/home/cubit/selected_cubit.dart';
import 'package:sneakers/presentation/home/more_content.dart';
import 'package:sneakers/presentation/home/sneakers_content.dart';
import 'package:sneakers/presentation/main/navigation_page.dart';

class HomePage extends NavigationPage {
  const HomePage({super.key}) : super(icon: Icons.home_outlined);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandCubit, BrandState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorState) {
          return const Center(
            child: Icon(Icons.close),
          );
        } else if (state is LoadedState) {
          final brands = state.brands;

          return DefaultTabController(
            length: brands.length, //mockSneakers.brands.length,
            child: BlocBuilder<SelectedCubit, int>(
              builder: (context, activeBrandIndex) {
                return ListView(
                  children: [
                    TabBar(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      isScrollable: true,
                      onTap: context.read<SelectedCubit>().updateIndex,
                      // onTap: (value) => context.read<BrandCubit>().updateIndex(value),
                      indicatorColor: Colors.transparent,
                      tabs: [
                        // for (var i = 0; i < mockSneakers.brands.length; i++)
                        for (var i = 0; i < brands.length; i++)
                          Tab(
                            child: Text(
                              // mockSneakers.brands[i].name,
                              brands[i].name.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: i == activeBrandIndex ? Colors.black : Colors.grey[400],
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 350,
                      child: SneakersContent(
                        brand: brands[activeBrandIndex],
                      ),
                    ),
                    // MoreContent(
                    //   sneakers: mockSneakers.more,
                    // ),
                  ],
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
