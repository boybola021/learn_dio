import 'package:learn_dio/service/dio_servives/dio_network.dart';
import 'package:learn_dio/service/model.dart';
import 'core.dart';

abstract class RepositoryProduct{
  Future<List<Products>> fetchData();
}

class RepositoryProductImpl implements RepositoryProduct{
  final DioNetwork dioNetwork;
  const RepositoryProductImpl({required this.dioNetwork});
  @override
  Future<List<Products>> fetchData()async => await dioNetwork.getMethod(baseUrl: Api.baseUrl,api: Api.apiProduct);
}
