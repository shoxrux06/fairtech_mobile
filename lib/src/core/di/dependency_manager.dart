import 'package:fairtech_mobile/src/core/handlers/http_service.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/data/repository/sign_in_repository_impl.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/domain/repository/sign_in_repository.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/repository/appeals_repository_impl.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/domain/repository/appeals_repository.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/data/repository/services_repository_impl.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/domain/repository/services_repository.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/presentation/bloc/services_bloc.dart';
import 'package:fairtech_mobile/src/features/main/presentation/bloc/main/main_bloc.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/repositories/pharm_info_repository_impl.dart';
import 'package:fairtech_mobile/src/features/pharm_info/domain/repositories/pharm_info_repository.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/bloc/pharm_info_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

setUpDependencies() {
  sl.registerLazySingleton<HttpService>(() => HttpService());
  sl.registerLazySingleton<SignInRepository>(() => SignInRepositoryImpl());
  sl.registerLazySingleton<AppealsRepository>(() => AppealsRepositoryImpl());
  sl.registerLazySingleton<ServicesRepository>(() => ServicesRepositoryImpl());
  sl.registerLazySingleton<PharmInfoRepository>(() => PharmInfoRepositoryImpl());

  mainFeature();
  servicesFeature();
  signInFeature();
  pharmInfoFeature();
}

final signInRepository = sl.get<SignInRepository>();
final appealsRepository = sl.get<AppealsRepository>();
final servicesRepository = sl.get<ServicesRepository>();
final pharmInfoRepository = sl.get<PharmInfoRepository>();



void mainFeature() {
  /// main
  sl.registerLazySingleton(MainBloc.new);
}

void servicesFeature() {
  /// main
  sl.registerLazySingleton(() => ServicesBloc(servicesRepository));
}

void signInFeature() {
  /// main
  sl.registerLazySingleton(() => SignInBloc(signInRepository));
}

void pharmInfoFeature() {
  /// main
  sl.registerLazySingleton(() => PharmInfoBloc(pharmInfoRepository));
}