import 'package:flutter/material.dart';
import 'package:learn_dio/service/dio_servives/service_locator.dart';
import 'package:learn_dio/service/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Products> products = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData()async{
    setState(() => isLoading = true);
     products = await repository.fetchData();
    setState(() => isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: products.length,
            itemBuilder: (context,i){
              final data = products[i];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.primaries[i % Colors.primaries.length],
                    child: Text(data.id.toString()),
                  ),
                  title: Text(data.title),
                  subtitle: Text(data.description),
                ),
              );
            },
          ),
          if(isLoading)const LoadingPage(),
        ],
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
