import 'package:fairtech_mobile/src/core/handlers/http_service.dart';
import 'package:fairtech_mobile/src/core/platform/network_info.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/data/repository/sign_in_repository_impl.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/domain/repository/sign_in_repository.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/repository/appeals_repository_impl.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/domain/repository/appeals_repository.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/repositories/fair_price_repository_impl.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/repositories/fair_price_repository.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/bloc/fair_price_bloc.dart';
import 'package:fairtech_mobile/src/features/main/menu/star/data/repository.dart';
import 'package:fairtech_mobile/src/features/main/menu/star/presentaion/bloc/star_bloc.dart';
import 'package:fairtech_mobile/src/features/main/presentation/bloc/main/main_bloc.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/repositories/pharm_info_repository_impl.dart';
import 'package:fairtech_mobile/src/features/pharm_info/domain/repositories/pharm_info_repository.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/bloc/pharm_info_bloc.dart';
import 'package:fairtech_mobile/src/features/product_info/data/repository/product_info_repository_impl.dart';
import 'package:fairtech_mobile/src/features/product_info/domain/repository/product_info_repository.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final GetIt sl = GetIt.instance;

setUpDependencies() {
  sl.registerLazySingleton<HttpService>(() => HttpService());
  sl.registerLazySingleton<SignInRepository>(() => SignInRepositoryImpl());
  sl.registerLazySingleton<AppealsRepository>(() => AppealsRepositoryImpl());
  sl.registerLazySingleton<ProductInfoRepository>(() => ProductInfoRepositoryImpl());
  sl.registerLazySingleton<PharmInfoRepository>(() => PharmInfoRepositoryImpl());
  sl.registerLazySingleton<StarRepository>(() => StarRepository());
  sl.registerLazySingleton<FairPriceRepository>(() => FairPriceRepositoryImpl());

  mainFeature();
  networkFeature();
  servicesFeature();
  signInFeature();
  pharmInfoFeature();
  filterFeature();
  fairPriceFeature();
}

final signInRepository = sl.get<SignInRepository>();
final appealsRepository = sl.get<AppealsRepository>();
final servicesRepository = sl.get<ProductInfoRepository>();
final pharmInfoRepository = sl.get<PharmInfoRepository>();
final stareRepository = sl.get<StarRepository>();
final fairPricerepository = sl.get<FairPriceRepository>();



void mainFeature() {
  /// main
  sl.registerLazySingleton(MainBloc.new);
}
void networkFeature() {
  /// main
  sl.registerLazySingleton(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(InternetConnectionChecker.new);
}

void servicesFeature() {
  /// main
  sl.registerLazySingleton(() => ProductInfoBloc(servicesRepository));
}

void signInFeature() {
  /// main
  sl.registerLazySingleton(() => SignInBloc(signInRepository));
}

void pharmInfoFeature() {
  /// main
  sl.registerLazySingleton(() => PharmInfoBloc(pharmInfoRepository));
}

void filterFeature() {
  /// main
  sl.registerLazySingleton(() => StarBloc(stareRepository));
}

void fairPriceFeature() {
  /// main
  sl.registerLazySingleton(() => FairPriceBloc(fairPricerepository));
}