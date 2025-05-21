import 'package:flutter/material.dart';
import 'package:flutter_lab_assignment_3/data/%20data_sources/album_api_service.dart';
import 'package:flutter_lab_assignment_3/data/%20data_sources/album_local_datasource.dart';
import 'package:flutter_lab_assignment_3/data/%20data_sources/photo_local_datasource.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab_assignment_3/data/models/Album_hive_model.dart';
import 'package:flutter_lab_assignment_3/data/models/photo_hive_model.dart';
import 'package:flutter_lab_assignment_3/data/repositoryimpl/album_repository_impl.dart';
import 'package:flutter_lab_assignment_3/domain/usecase/Albumusecase.dart';
import 'package:flutter_lab_assignment_3/presentation/bloc/album_bloc.dart';
import 'package:flutter_lab_assignment_3/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(AlbumModelAdapter());
  Hive.registerAdapter(PhotoModelAdapter());

  final albumBox = await Hive.openBox<AlbumModel>('albums');
  final photoBox = await Hive.openBox<PhotoModel>('photos');

  final localAlbum = AlbumLocalDataSource(albumBox);
  final localPhoto = PhotoLocalDataSource(photoBox);
  final apiService = AlbumApiService(httpClient: http.Client());
  final albumUsecase = Albumusecase(
    albumRepository: AlbumRepositoryImpl(
      albumApiService: apiService,
      localAlbum: localAlbum,
      localPhoto: localPhoto,
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<Albumusecase>.value(value: albumUsecase),
        BlocProvider(create: (_) => AlbumBloc(albumUsecase)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
