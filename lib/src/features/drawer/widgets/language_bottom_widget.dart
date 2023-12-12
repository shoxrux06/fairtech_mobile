import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_options.dart';

class LanguageBottomWidget extends StatelessWidget {

  const LanguageBottomWidget({
    super.key,
    required this.onChanged,
  });
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Language'),
        ),
        ListTile(
          onTap: () {
            onChanged('ru');
            context.pop();
          },
          title: Text('RU', style: context.textStyle.largeTitle2,),
          trailing: Visibility(
            visible: AppOptions.of(context).locale.languageCode == 'ru',
            child: const Icon(Icons.check),
          ),
        ),
        ListTile(
          onTap: () {
            onChanged('uz');
            context.pop();
          },
          title: Text('UZ',style: context.textStyle.largeTitle2,),
          trailing: Visibility(
            visible: AppOptions.of(context).locale.languageCode == 'uz',
            child: const Icon(Icons.check),
          ),
        ),
        SafeArea(
          minimum: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            onTap: () {
              onChanged('en');
              context.pop();
            },
            title: Text('EN',style: context.textStyle.largeTitle2,),
            trailing: Visibility(
              visible: AppOptions.of(context).locale.languageCode == 'en',
              child: const Icon(Icons.check),
            ),
          ),
        ),
      ],
    );
}
