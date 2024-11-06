import 'package:dartz/dartz.dart';
import 'package:niamu_project/core/error/failure.dart';
import 'package:niamu_project/feature/places/domain/models/favorite_place_model.dart';
import 'package:niamu_project/feature/places/domain/repository/favorite_places_repository.dart';
import 'package:niamu_project/feature/places/domain/repository/places_repository.dart';

class FavoritePlacesUseCase {
  final FavoritePlacesRepository _favoritePlacesRepository;

  FavoritePlacesUseCase(this._favoritePlacesRepository);

  Future<Either<Failure, List<FavoritePlaceModel>?>> getAllPlaces() async {
    return await _favoritePlacesRepository.getAllFavoritePlaces();
  }

  Future<Either<Failure, void>> addPlace(final int placeId) async {
    return await _favoritePlacesRepository.addFavoritePlace(placeId);
  }

  Future<Either<Failure, void>> deletePlace(final int placeId) async {
    return await _favoritePlacesRepository.removeFavoritePlaces(placeId);
  }

}