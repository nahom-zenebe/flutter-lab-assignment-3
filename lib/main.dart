import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab_assignment_3/data/%20data_sources/album_api_service.dart';
import 'package:flutter_lab_assignment_3/data/repositoryimpl/album_repository_impl.dart';
import 'package:flutter_lab_assignment_3/domain/usecase/Albumusecase.dart';
import 'package:flutter_lab_assignment_3/presentation/bloc/album_bloc.dart';
import 'package:flutter_lab_assignment_3/routes/app_router.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final dio = Dio();
  final apiService = AlbumApiService(dio);
  final albumUsecase = Albumusecase(
    albumRepository: AlbumRepositoryImpl(albumApiService: apiService),
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<Albumusecase>.value(value: albumUsecase),
        BlocProvider(
          create: (_) => AlbumBloc(albumUsecase),
        ),
      ],
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    
     
    );
  }
}

