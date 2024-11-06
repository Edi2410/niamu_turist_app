import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:niamu_project/core/di.dart';
import 'package:niamu_project/feature/places/domain/models/favorite_place_model.dart';
import 'package:niamu_project/feature/places/domain/usecase/favorite_places_use_case.dart';
import 'package:niamu_project/feature/places/presentation/controller/state/favorite_place_state.dart';

class FavoritePlacesNotifier extends Notifier<FavoritePlaceState> {
  late final FavoritePlacesUseCase _favoritePlacesUseCase;
  List<FavoritePlaceModel> favoritePlaces = [];

  @override
  FavoritePlaceState build() {
    _favoritePlacesUseCase = ref.read(favoritePlacesUseCasesProvider);
    getAllFavoritePlaces();
    return const LoadingFavoritePlaces();
  }

  void getAllFavoritePlaces() async {
    state = const LoadingFavoritePlaces();
    final result = await _favoritePlacesUseCase.getAllPlaces();
    result.fold(
      (failure) => state = ErrorFavoritePlaces(error: failure),
      (favoritePlaces) {
        if (favoritePlaces == null) {
          state = const EmptyFavoritePlaces();
          return;
        }
        this.favoritePlaces = favoritePlaces;
        for (final place in favoritePlaces) {
          print(place.placesId);
        }
        state = SuccessFavoritePLaces(favoritePlaces);
      },
    );
  }

  void addFavoritePlace(final int placeId) async {
    final result = await _favoritePlacesUseCase.addPlace(placeId);
    result.fold(
      (failure) => state = ErrorFavoritePlaces(error: failure),
      (_) => getAllFavoritePlaces(),
    );
  }

  void removeFavoritePlace(final int placeId) async {
    final result = await _favoritePlacesUseCase.deletePlace(placeId);
    result.fold(
      (failure) => state = ErrorFavoritePlaces(error: failure),
      (_) => getAllFavoritePlaces(),
    );
  }
}
