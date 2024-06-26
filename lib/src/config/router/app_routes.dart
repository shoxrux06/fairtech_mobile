import 'package:fairtech_mobile/src/core/di/dependency_manager.dart';
import 'package:fairtech_mobile/src/features/appeal/presentation/pages/appeal_page.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/pages/auth_confirmed_page.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/pages/auth_oneid_page.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/pages/empty_page.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/pages/pin_code_page.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/pages/sign_in_page.dart';
import 'package:fairtech_mobile/src/features/drawer/about_system/presentation/pages/about_system_page.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/presentaion/bloc/appeals_bloc.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/presentaion/pages/appeals_page.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/presentaion/pages/create_appeals_page.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/presentaion/pages/select_from_map_page.dart';
import 'package:fairtech_mobile/src/features/drawer/presentation/help_page.dart';
import 'package:fairtech_mobile/src/features/drawer/personal_information/presentation/pages/personal_inforamtion_page.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/bloc/fair_price_bloc.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/pages/add_obyekt.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/pages/enter_price_page.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/pages/fair_price_page.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/pages/multiple_products_page.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/pages/price_look_create_page.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/pages/product_detail_page.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/pages/products_list_page.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/pages/sub_market_page.dart';
import 'package:fairtech_mobile/src/features/main/menu/star/presentaion/bloc/star_bloc.dart';
import 'package:fairtech_mobile/src/features/main/presentation/bloc/main/main_bloc.dart';
import 'package:fairtech_mobile/src/features/main/presentation/pages/main_page.dart';
import 'package:fairtech_mobile/src/features/drawer/settings/presentation/pages/settings_page.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/bloc/pharm_info_bloc.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/pages/pharrm_info_page.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/widgets/all_appeals_widget.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/widgets/completed_appeals_widget.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/widgets/in_the_execution_process_appleas_widget.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/product_info_response.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/choose_option_page.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/mxik_code_page.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/mxik_code_service.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/product_or_service_page.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/product_tnved_code_page.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/qr_code_screen_page.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/scanner_result_page.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/service_page.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/shtrix_code_page.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/tnved_product_detail_page.dart';
import 'package:fairtech_mobile/src/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:fairtech_mobile/src/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'routes.dart';

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class AppGoRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.initial,
    routes: <RouteBase>[
      ///splash
      GoRoute(
        name: Routes.initial,
        path: Routes.initial,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: BlocProvider(
            create: (_) => SplashBloc(),
            child: const SplashPage(),
          ),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),

      /// main
      GoRoute(
          name: Routes.main,
          path: Routes.main,
          pageBuilder: (_, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<MainBloc>(create: (_) => sl<MainBloc>()),
                  BlocProvider<SignInBloc>(create: (_) => sl<SignInBloc>()),
                  BlocProvider<ProductInfoBloc>(
                      create: (_) => sl<ProductInfoBloc>()),
                  BlocProvider<StarBloc>(create: (_) => sl<StarBloc>()),
                  BlocProvider<PharmInfoBloc>(
                      create: (_) => PharmInfoBloc(pharmInfoRepository)),
                ],
                child: const MainPage(),
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.authOneId,
          path: Routes.authOneId,
          pageBuilder: (_, state) {
            final extra = state.extra as SignInBloc;
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: BlocProvider.value(
                value: extra,
                child: const AuthOneIDPage(),
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
        name: Routes.signIn,
        path: Routes.signIn,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: MultiBlocProvider(providers: [
            BlocProvider<MainBloc>(create: (_) => sl<MainBloc>()),
            BlocProvider<SignInBloc>(create: (_) => sl<SignInBloc>()),
            BlocProvider<StarBloc>(create: (_) => sl<StarBloc>()),
          ], child: const SignInPage()),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        name: Routes.authConfirmed,
        path: Routes.authConfirmed,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: const AuthConfirmedPage(),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        name: Routes.emptyPage,
        path: Routes.emptyPage,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: const EmptyPage(),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        name: Routes.settings,
        path: Routes.settings,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: const SettingsPage(),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        name: Routes.help,
        path: Routes.help,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: const HelpPage(),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
          name: Routes.setPinCode,
          path: Routes.setPinCode,
          pageBuilder: (_, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: BlocProvider(
                create: (_) => SignInBloc(signInRepository),
                child: const PinCodePage(),
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
        name: Routes.personalInformation,
        path: Routes.personalInformation,
        pageBuilder: (_, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 1200),
            child: BlocProvider(
              create: (_) => PharmInfoBloc(pharmInfoRepository),
              child: PersonalInformationPage(),
            ),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        },
      ),
      GoRoute(
        name: Routes.appeals,
        path: Routes.appeals,
        pageBuilder: (_, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 1200),
            child: const AppealsPage(),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        },
      ),
      GoRoute(
        name: Routes.createAppeals,
        path: Routes.createAppeals,
        pageBuilder: (_, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 1200),
            child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => SignInBloc(signInRepository)),
                BlocProvider(create: (_) => AppealsBloc(appealsRepository)),
                BlocProvider(create: (_) => PharmInfoBloc(pharmInfoRepository))
              ],
              child: const CreateAppealsPage(),
            ),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        },
      ),
      GoRoute(
        name: Routes.aboutSystem,
        path: Routes.aboutSystem,
        pageBuilder: (_, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 1200),
            child: const AboutSystemPage(),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        },
      ),
      GoRoute(
        name: Routes.qrCode,
        path: Routes.qrCode,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: BlocProvider(
            create: (_) => ProductInfoBloc(servicesRepository),
            child: const QrCodeScreenPage(),
          ),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        name: Routes.tnVedCode,
        path: Routes.tnVedCode,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: BlocProvider(
            create: (_) => ProductInfoBloc(servicesRepository),
            child: ProductTnVedCodePage(),
          ),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
          name: Routes.scannerResult,
          path: Routes.scannerResult,
          pageBuilder: (_, state) {
            final extra = state.extra as Map;
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<AppealsBloc>(
                      create: (_) => AppealsBloc(appealsRepository)),
                  BlocProvider<ProductInfoBloc>(
                      create: (_) => ProductInfoBloc(servicesRepository)),
                ],
                child: ScannerResultPage(
                  code: extra['code'],
                  onClose: extra['closeScreen'],
                ),
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.pharmInfo,
          path: Routes.pharmInfo,
          pageBuilder: (_, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<SignInBloc>(create: (_) => sl<SignInBloc>()),
                  BlocProvider(
                    create: (_) => PharmInfoBloc(pharmInfoRepository),
                  ),
                  BlocProvider(
                    create: (_) => AppealsBloc(appealsRepository),
                  ),
                ],
                child: const PharmInfoPage(),
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.chooseOption,
          path: Routes.chooseOption,
          pageBuilder: (_, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: const ChooseOptionPage(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.shtrixCode,
          path: Routes.shtrixCode,
          pageBuilder: (_, state) {
            String extra = '';
            if (state.extra != null) {
              extra = state.extra as String;
            }
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: BlocProvider(
                create: (_) => ProductInfoBloc(servicesRepository),
                child: ShtrixCodePage(code: extra),
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
        name: Routes.mxikCode,
        path: Routes.mxikCode,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: BlocProvider(
            create: (_) => ProductInfoBloc(servicesRepository),
            child: const MxikCodePage(),
          ),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        name: Routes.mxikCodeService,
        path: Routes.mxikCodeService,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: BlocProvider(
            create: (_) => ProductInfoBloc(servicesRepository),
            child: const MxikCodePageService(),
          ),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
          name: Routes.tnVedProductDetail,
          path: Routes.tnVedProductDetail,
          pageBuilder: (_, state) {
            final good = state.extra as Good;
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: TnVedProductDetailPage(good: good),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.selectFromMap,
          path: Routes.selectFromMap,
          pageBuilder: (_, state) {
            final extra = state.extra as BuildContext;
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: SelectFromMapPage(
                context: extra,
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.mainAppeal,
          path: Routes.mainAppeal,
          pageBuilder: (_, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => PharmInfoBloc(pharmInfoRepository),
                  ),
                ],
                child: const AppealPage(),
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.productOrService,
          path: Routes.productOrService,
          pageBuilder: (_, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: const ProductOrServicePage(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.service,
          path: Routes.service,
          pageBuilder: (_, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: const ServicePage(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.allAppeals,
          path: Routes.allAppeals,
          pageBuilder: (_, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: MultiBlocProvider(providers: [
                BlocProvider(
                  create: (_) => PharmInfoBloc(pharmInfoRepository),
                ),
                BlocProvider(
                  create: (_) => AppealsBloc(appealsRepository),
                ),
              ], child: const AllAppealsWidget()),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.completedAppeals,
          path: Routes.completedAppeals,
          pageBuilder: (_, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: const CompletedAppealsWidget(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.inProcessAppeals,
          path: Routes.inProcessAppeals,
          pageBuilder: (_, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: const InTheExecutionProcessAppealsWidget(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.fairPrice,
          path: Routes.fairPrice,
          pageBuilder: (_, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => FairPriceBloc(fairPricerepository),
                  ),
                ],
                child: const FairPricePage(),
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      // GoRoute(
      //     name: Routes.subMarket,
      //     path: Routes.subMarket,
      //     pageBuilder: (_, state) {
      //       final extra = state.extra as Map;
      //       return CustomTransitionPage(
      //         transitionDuration: const Duration(milliseconds: 1200),
      //         child: MultiBlocProvider(
      //           providers: [
      //             BlocProvider(
      //               create: (_) => FairPriceBloc(fairPricerepository),
      //             ),
      //           ],
      //           child: SubMarketPage(type: extra['type']),
      //         ),
      //         transitionsBuilder: (_, animation, __, child) => FadeTransition(
      //           opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
      //           child: child,
      //         ),
      //       );
      //     }),
      // GoRoute(
      // name: Routes.fairPriceProductList,
      // path: Routes.fairPriceProductList,
      // pageBuilder: (_, state) {
      //   final extra = state.extra as Map;
      //   return CustomTransitionPage(
      //     transitionDuration: const Duration(milliseconds: 1200),
      //     child: MultiBlocProvider(
      //       providers: [
      //         BlocProvider(
      //           create: (_) => FairPriceBloc(fairPricerepository),
      //         ),
      //       ],
      //       child: ProductsListPage(
      //           marketId: extra['marketId'],
      //           isMarketEmployee: extra['isMarketEmployee']
      //       ),
      //     ),
      //     transitionsBuilder: (_, animation, __, child) => FadeTransition(
      //       opacity:
      //           CurveTween(curve: Curves.easeInOutCirc).animate(animation),
      //       child: child,
      //     ),
      //   );
      // }),
      GoRoute(
          name: Routes.productDetail,
          path: Routes.productDetail,
          pageBuilder: (_, state) {
            final extra = state.extra as Map;
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => FairPriceBloc(fairPricerepository),
                  ),
                  BlocProvider(
                      create: (_) => PharmInfoBloc(pharmInfoRepository)),
                ],
                child: ProductDetailPage(
                  product: extra['product'],
                ),
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.enterPrice,
          path: Routes.enterPrice,
          pageBuilder: (_, state) {
            final extra = state.extra as Map;
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => FairPriceBloc(fairPricerepository),
                  ),
                  BlocProvider(
                      create: (_) => PharmInfoBloc(pharmInfoRepository)),
                ],
                child: EnterPricePage(
                  isFromProductDetail: extra['isFromProductDetail'],
                  dropDownObjectType: extra['dropDownObjectType'],
                ),
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.addObyekt,
          path: Routes.addObyekt,
          pageBuilder: (_, state) {
            // final extra = state.extra as Map;
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => FairPriceBloc(fairPricerepository),
                  ),
                  BlocProvider(
                      create: (_) => PharmInfoBloc(pharmInfoRepository)),
                ],
                child: AddObyektPage(),
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.multipleProduct,
          path: Routes.multipleProduct,
          pageBuilder: (_, state) {
            final extra = state.extra as Map;
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => FairPriceBloc(fairPricerepository),
                  ),
                ],
                child: MultipleProductPage(children: extra['children']),
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
          name: Routes.priceLookOrCreate,
          path: Routes.priceLookOrCreate,
          pageBuilder: (_, state) {
            final extra = state.extra as Map;
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: PriceLookCreatePage(
                type: extra['type'],
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
    ],
  );
}

class FadePageRoute<T> extends PageRouteBuilder<T> {
  FadePageRoute({required this.builder})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
  final WidgetBuilder builder;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);
}
