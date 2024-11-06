import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:niamu_project/feature/auth/data/firabase/user_firebase_api.dart';
import 'package:niamu_project/feature/auth/data/repository/user_repository_impl.dart';
import 'package:niamu_project/feature/auth/domain/repository/user_repository.dart';
import 'package:niamu_project/feature/auth/domain/usecase/auth_use_case.dart';
import 'package:niamu_project/feature/auth/presentation/controller/auth_notifier.dart';
import 'package:niamu_project/feature/auth/presentation/controller/state/auth_state.dart';
import 'package:niamu_project/feature/places/data/api/places_api_client.dart';
import 'package:niamu_project/feature/places/data/db/places_hive_services.dart';
import 'package:niamu_project/feature/places/data/repository/favorite_places_repository_impl.dart';
import 'package:niamu_project/feature/places/data/repository/places_repository_impl.dart';
import 'package:niamu_project/feature/places/domain/repository/favorite_places_repository.dart';
import 'package:niamu_project/feature/places/domain/repository/places_repository.dart';
import 'package:niamu_project/feature/places/domain/usecase/favorite_places_use_case.dart';
import 'package:niamu_project/feature/places/domain/usecase/places_use_case.dart';
import 'package:niamu_project/feature/places/presentation/controller/favorite_places_notifier.dart';
import 'package:niamu_project/feature/places/presentation/controller/places_notifier.dart';
import 'package:niamu_project/feature/places/presentation/controller/state/favorite_place_state.dart';
import 'package:niamu_project/feature/places/presentation/controller/state/place_state.dart';


// ***************** EXTERNAL LIBRARIES ***************** //
final dioProvider = Provider<Dio>((ref) => Dio());
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);


// ***************** DATASOURCE ***************** //
final userFirebaseApi = Provider<UserFirebaseApi>((ref) =>
    UserFirebaseApi(ref.watch(firebaseAuthProvider))
);

final placesApiProvider = Provider<PlacesApiClient>((ref) =>
    PlacesApiClient(ref.watch(dioProvider))
);

// ***************** SERVICE ***************** //
final favoritePlacesService = Provider<FavoritePlacesService>((ref) =>
    FavoritePlacesService()
);

// ***************** REPOSITORY ***************** //
final userFirebaseRepositoryProvider = Provider<UserRepository>(
      (ref) => UserRepositoryImpl(ref.watch(userFirebaseApi)),
);

final placesRepositoryProvider = Provider<PlacesRepository>(
      (ref) => PlacesRepositoryImpl(ref.watch(placesApiProvider)),
);

final favoritePlacesRepositoryProvider = Provider<FavoritePlacesRepository>(
      (ref) => FavoritePlacesRepositoryImpl(ref.watch(favoritePlacesService)),
);

// ***************** USE CASE ***************** //
final authUseCasesProvider = Provider<AuthUseCase>(
      (ref) => AuthUseCase(ref.watch(userFirebaseRepositoryProvider)),
);

final placesUseCasesProvider = Provider<PlacesUseCase>(
      (ref) => PlacesUseCase(ref.watch(placesRepositoryProvider)),
);

final favoritePlacesUseCasesProvider = Provider<FavoritePlacesUseCase>(
      (ref) => FavoritePlacesUseCase(ref.watch(favoritePlacesRepositoryProvider)),
);

// ***************** RIVERPOD ***************** //
final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(
      () => AuthNotifier(),
);

final placesNotifierProvider = NotifierProvider<PlacesNotifier, PlacesState>(
      () => PlacesNotifier(),
);

final favoritePlacesNotifiesProvider = NotifierProvider<FavoritePlacesNotifier, FavoritePlaceState>(
      () => FavoritePlacesNotifier(),
);




