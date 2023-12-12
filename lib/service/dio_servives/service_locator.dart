

import 'package:learn_dio/service/dio_servives/dio_network.dart';
import 'package:learn_dio/service/dio_servives/product_repozitory.dart';

late  RepositoryProduct repository;
void serviceLocator()async{
  repository = RepositoryProductImpl(dioNetwork: DioNetworkImpl());
}