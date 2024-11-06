import 'package:dartz/dartz.dart';
import 'package:niamu_project/core/error/failure.dart';
import 'package:niamu_project/feature/places/data/db/places_hive_services.dart';
import 'package:niamu_project/feature/places/domain/models/favorite_place_model.dart';
import 'package:niamu_project/feature/places/domain/repository/favorite_places_repository.dart';

class FavoritePlacesRepositoryImpl implements FavoritePlacesRepository {
  final FavoritePlacesService _service;

  FavoritePlacesRepositoryImpl(this._service);

  @override
  Future<Either<Failure, void>> addFavoritePlace(int placeId) async {
    try {
      final result = await _service.addFavoritePlace(placeId);
      return Right(result);
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FavoritePlaceModel>?>>
      getAllFavoritePlaces() async {
    try {
      final result = await _service.getAllFavoritePlaces();
      return Right(result);
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavoritePlaces(int placeId) async {
    try {
      final result = await _service.removeFavoritePlaces(placeId);
      return Right(result);
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }
}
