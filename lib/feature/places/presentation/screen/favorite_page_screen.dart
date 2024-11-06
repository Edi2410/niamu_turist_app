import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:niamu_project/feature/common/presentation/screen/error_screen.dart';
import 'package:niamu_project/feature/common/presentation/screen/loading_screen.dart';
import 'package:niamu_project/feature/common/presentation/widget/custom_app_bar.dart';
import 'package:niamu_project/feature/places/presentation/controller/state/favorite_place_state.dart';
import 'package:niamu_project/feature/places/presentation/widget/places_card_widget.dart';

import '../../../../core/di.dart';

class FavoritePageScreen extends ConsumerWidget {
  const FavoritePageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allPlaces = ref.watch(placesNotifierProvider.notifier).places;
    final favoritePlacesState = ref.watch(favoritePlacesNotifiesProvider);
    return switch (favoritePlacesState) {
      LoadingFavoritePlaces() => const LoadingScreen(),
      ErrorFavoritePlaces() => const ErrorScreen(),
      EmptyFavoritePlaces() => const ErrorScreen(),
      SuccessFavoritePLaces() => Scaffold(
          appBar: const CustomAppBar(title: "Places"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: favoritePlacesState.favoritePlaces.length,
              itemBuilder: (context, index) {
                final place = allPlaces?.firstWhere((element) =>
                    element.id ==
                    favoritePlacesState.favoritePlaces[index].placesId);
                return Column(
                  children: [
                    place != null
                        ? PlacesCard(place: place, isFavorite: true)
                        : const SizedBox(),
                    if (index != favoritePlacesState.favoritePlaces.length - 1)
                      const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ),
    };
  }
}
