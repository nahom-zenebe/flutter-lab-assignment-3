import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab_assignment_3/presentation/bloc/album_bloc.dart';
import 'package:flutter_lab_assignment_3/presentation/bloc/album_event.dart';
import 'package:flutter_lab_assignment_3/presentation/bloc/album_state.dart';
import 'package:go_router/go_router.dart';

class AlbumListScreen extends StatefulWidget {
  @override
  State<AlbumListScreen> createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {

@override
void initState() {
  super.initState();

  context.read<AlbumBloc>().add(FetchAlbums());
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Albums",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<AlbumBloc, AlbumState>(
  builder: (context, state) {

    if (state is AlbumLoading || state is AlbumInitial) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 16),
                    Text(
                      "Loading Albums...",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              );
            }
            
            if (state is AlbumLoaded) {
              if (state.albums.isEmpty) {
                return Center(
                  child: Text(
                    "No albums found",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                );
              }
              
              return ListView.separated(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 16),
                itemCount: state.albums.length,
                separatorBuilder: (_, __) => Divider(height: 1),
                itemBuilder: (_, index) {
                  final album = state.albums[index];
                  return Card(
                    elevation: 0,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => context.push('/album/${album.id}'),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Icon(
                                Icons.album_outlined,
                                size: 30,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                album.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            
            if (state is AlbumError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Colors.red[400],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Failed to load albums",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    OutlinedButton(
                      onPressed: () {
                        context.read<AlbumBloc>().add(FetchAlbums());
                      },
                      child: Text("Retry"),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}