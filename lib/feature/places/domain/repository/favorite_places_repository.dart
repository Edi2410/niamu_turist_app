import 'package:dartz/dartz.dart';
import 'package:niamu_project/core/error/failure.dart';
import 'package:niamu_project/feature/places/domain/entity/place.dart';
import 'package:niamu_project/feature/places/domain/models/favorite_place_model.dart';

abstract interface class FavoritePlacesRepository {
  Future<Either<Failure, List<FavoritePlaceModel>?>> getAllFavoritePlaces();

  Future<Either<Failure, void>> addFavoritePlace (final int placeId);

  Future<Either<Failure, void>> removeFavoritePlaces(final int placeId);

}
