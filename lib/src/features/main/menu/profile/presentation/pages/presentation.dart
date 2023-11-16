import 'package:fairtech_mobile/src/features/main/menu/profile/data/local_data.dart';
import 'package:fairtech_mobile/src/features/pdf/data/models/invoice.dart';
import 'package:fairtech_mobile/src/features/pdf/presentation/pages/pdf_review.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreviewPage(
        invoice: Invoice(
          dateTime: DateTime.now(),
          id: 1,
          orderItems: LocalData.orderItems
        ),
      ),
    );
  }
}
