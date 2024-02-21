import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/components/loading_widgets/modal_progress_hud.dart';
import 'package:fairtech_mobile/src/features/components/pageview/custom_pageview_builder.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/bloc/fair_price_bloc.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/widgets/add_legal_entity_widget.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/widgets/add_personal_entity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddObyektPage extends StatefulWidget {
  const AddObyektPage({super.key});

  @override
  State<AddObyektPage> createState() => _AddObyektPageState();
}

class _AddObyektPageState extends State<AddObyektPage> {
  int? marketTypeId;
  LatLng? center;
  String lang = '12.34343434';
  String lat = '34.45553566';

  String? dropDownObjectType;

  final list = [
    'Yuridik shaxs',
    'YaTT shaxs',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Obyekt qo\'shish', style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor,),),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Text('Yuridik shaxs')),
              Tab(icon: Text('YaTT shaxs')),
            ],
          ),
        ),
        body: BlocBuilder<FairPriceBloc, FairPriceState>(
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: (state.obyektIsCreating || state.isFetchingTinData),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TabBarView(
                  children: [
                    AddLegalEntity(
                        marketTypeId: marketTypeId,
                        center: center,
                        lang: lang,
                        lat: lat,
                        shortName: state.companyDataWithTinEntity?.company.shortName ?? '- - -',
                        companyBillingAddress: state.companyDataWithTinEntity?.companyBillingAddress.nameLt?? '- - -',
                        phone: state.companyDataWithTinEntity?.directorContact.phone ?? '- - -',
                        lastName: state.companyDataWithTinEntity?.director.lastName ??'-',
                        firstName: state.companyDataWithTinEntity?.director.firstName ??'-',
                        middleName: state.companyDataWithTinEntity?.director.middleName ??'-',
                        businessStructureId: state.companyDataWithTinEntity?.company.businessStructure??0,
                        businessStructureName: state.companyDataWithTinEntity?.company.businessStructureNameLt??'',
                        soato: state.companyDataWithTinEntity?.companyBillingAddress.soato??0
                    ),
                    AddPersonalEntityWidget(
                        marketTypeId: marketTypeId,
                        center: center,
                        lang: lang,
                        lat: lat,
                        shortName: state.personDataWithPinflEntity?.companyBillingAddress.nameLt ?? '- - -',
                        businessStructureName: state.companyDataWithTinEntity?.company.businessStructureNameLt??'',
                        soato: state.personDataWithPinflEntity?.companyBillingAddress.soato??0
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
