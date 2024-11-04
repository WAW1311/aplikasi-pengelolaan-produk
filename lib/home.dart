import 'package:flutter/material.dart';
import 'product.dart';
import 'server.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const WidgetHome(),
    const Product(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home',
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text(
                'Produk',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 30),
              IconButton(
                  onPressed: () {
                    _onItemTapped(0);
                  },
                  icon: const Row(
                    children: [
                      Icon(Icons.home),
                      Text('Home',style: TextStyle(fontWeight: FontWeight.w600),)
                    ],
                  )),
              const SizedBox(width: 20),
              IconButton(
                  onPressed: () {
                    _onItemTapped(1);
                  },
                  icon: const Row(
                    children: [
                      Icon(Icons.production_quantity_limits_rounded),
                      Text('Kelola Produk',style: TextStyle(fontWeight: FontWeight.w600),)
                    ],
                  ))
            ],
          ),
        ),
        body: _widgetOptions[_selectedIndex],
      ),
    );
  }
}

class WidgetHome extends StatefulWidget {
  const WidgetHome({super.key});

  @override
  State<WidgetHome> createState() => _WidgetHomeState();
}

class _WidgetHomeState extends State<WidgetHome> {
  final data = Server();
  dynamic item;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var datases = await data.getData();
    setState(() {
      item = datases;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 400,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: item?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final dataItem = item[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.indigo.shade300, width: 1.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 16.0,
                        spreadRadius: 4.0,
                        offset: Offset(0.0, 4.0))
                  ],
                ),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dataItem['name'],
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo,
                          ),
                        ),
                        Text(
                          "Harga : ${dataItem['price'].toString()}",
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo,
                          ),
                        ),
                        Text(
                          "Stok : ${dataItem['stock'].toString()}",
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo,
                          ),
                        ),
                      ]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
