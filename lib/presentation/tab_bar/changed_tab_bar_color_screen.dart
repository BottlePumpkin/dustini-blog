import 'package:flutter/material.dart';

class ChangedTabBarColorScreen extends StatefulWidget {
  const ChangedTabBarColorScreen({Key? key}) : super(key: key);

  @override
  State<ChangedTabBarColorScreen> createState() =>
      _ChangedTabBarColorScreenState();
}

class _ChangedTabBarColorScreenState extends State<ChangedTabBarColorScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('ChangedTabBarColor'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(bottom: 20),
        maintainBottomViewPadding: true,
        child: Column(
          children: [
            DecoratedBox(
              //This is responsible for the background of the tabbar, does the magic
              decoration: const BoxDecoration(
                color: Colors.orange,
              ),
              child: TabBar(
                onTap: (index) {
                  _currentIndex = index;
                },
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const BoxDecoration(color: Colors.yellow),
                tabs: [
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      '첫번째',
                      style: TextStyle(
                          color:
                              _currentIndex == 0 ? Colors.black : Colors.red),
                    ),
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      '두번째',
                      style: TextStyle(
                          color:
                              _currentIndex == 1 ? Colors.black : Colors.red),
                    ),
                  ),
                ],
                controller: _tabController,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    color: Colors.red,
                    child: Center(
                      child: Text('첫번째 화면'),
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text('두번째 화면'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
