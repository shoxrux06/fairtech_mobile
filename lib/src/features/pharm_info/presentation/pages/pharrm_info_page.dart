import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PharmInfoPage extends StatefulWidget {
  const PharmInfoPage({super.key});

  @override
  State<PharmInfoPage> createState() => _PharmInfoPageState();
}

class _PharmInfoPageState extends State<PharmInfoPage> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    const Tab(child: Text('Ijro jarayonidagi murojaatlar')),
    const Tab(child: Text('Telangana murojaatlar')),
    const Tab(child: Text('Barcha murojaatlar')),
  ];


  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: myTabs
          ),
          title: Text('Pharm info'),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.filter_alt_rounded))
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [

          ],
        ),
      ),
    );
  }
}
