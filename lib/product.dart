import 'package:flutter/material.dart';
import 'server.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final data = Server();
  List<dynamic> item = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var items = await data.getData();
    setState(() {
      item = items;
    });
  }

  void addDatases(datases) async {
    await data.addData(datases);
    fetchData();
  }

  void uptodateData(productId, items) async {
    await data.updateData(productId, items);
    fetchData();
  }

  void delData(productId) async {
    await data.deleteData(productId);
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                TextEditingController nameController0 =
                    TextEditingController();
                TextEditingController priceController0 =
                    TextEditingController();
                TextEditingController stockController0 =
                    TextEditingController();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Input data'),
                        content: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: nameController0,
                              decoration: const InputDecoration(
                                  label: Text('Name'),
                                  border:
                                    OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            TextField(
                              controller: priceController0,
                              decoration: const InputDecoration(
                                  label: Text('Price'),
                                  border:
                                    OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            TextField(
                              controller: stockController0,
                              decoration: const InputDecoration(
                                  label: Text('Stock'),
                                  border:
                                    OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  var items = {
                                    "name":
                                        nameController0.text,
                                    "price":
                                        int.parse(priceController0.text),
                                    "stock":
                                        int.parse(stockController0.text),
                                  };
                                  addDatases(items);
                                },
                                child: const Text('Tambah'))
                          ],
                        ),
                      );
                    });
                },
                child: const Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 10.0),
                    Text('Tambah data')
                  ],
                )),
              const SizedBox(height: 15.0,),
              Column(
                    children: item.isEmpty
                ? []
                : item.map(
                    (dataItem) {
                      return Center(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.indigo.shade50,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                    color: Colors.indigo.shade300, width: 1.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 16.0,
                                      spreadRadius: 4.0,
                                      offset: Offset(0.0, 4.0))
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dataItem['name'],
                                    style: const TextStyle(
                                        fontSize: 15.0, fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(width: 50),
                                  ElevatedButton(
                                      onPressed: () {
                                        TextEditingController nameController =
                                            TextEditingController(
                                                text: dataItem['name']);
                                        TextEditingController priceController =
                                            TextEditingController(
                                                text: dataItem['price'].toString());
                                        TextEditingController stockController =
                                            TextEditingController(
                                                text: dataItem['stock'].toString());
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text('Input data'),
                                                content: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    TextField(
                                                      controller: nameController,
                                                      decoration: const InputDecoration(
                                                          label: Text('Name'),
                                                          border:
                                                              OutlineInputBorder()),
                                                    ),
                                                    const SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    TextField(
                                                      controller: priceController,
                                                      decoration: const InputDecoration(
                                                          label: Text('Price'),
                                                          border:
                                                              OutlineInputBorder()),
                                                    ),
                                                    const SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    TextField(
                                                      controller: stockController,
                                                      decoration: const InputDecoration(
                                                          label: Text('Stock'),
                                                          border:
                                                              OutlineInputBorder()),
                                                    ),
                                                    const SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          var items = {
                                                            "name":
                                                                nameController.text,
                                                            "price":
                                                                int.parse(priceController.text),
                                                            "stock":
                                                                int.parse(stockController.text),
                                                          };
                                                          uptodateData(
                                                              int.parse(dataItem['id']), items);
                                                        },
                                                        child: const Text('Update'))
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      child: const Text(
                                        'Update',
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  const SizedBox(width: 50),
                                  ElevatedButton(
                                      onPressed: () {
                                        delData(int.parse(dataItem['id']));
                                      },
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w600),
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            )
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  ),
            ],
          ),
        ));
  }
}
