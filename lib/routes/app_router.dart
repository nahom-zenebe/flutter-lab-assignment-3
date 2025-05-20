import 'package:flutter/material.dart';
import 'package:flutter_lab_assignment_3/presentation/screens/AlbumDetailScreen.dart';

import 'package:flutter_lab_assignment_3/presentation/screens/AlbumListScreen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => AlbumListScreen(),
    ),
    GoRoute(
      path: '/album/:id',
      name: 'albumDetail',
      builder: (context, state) {
        final albumId = state.pathParameters['id']!;
        return AlbumDetailScreen(albumId: albumId);
      },
    ),
  ],
);
