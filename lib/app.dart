import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littleword/providers/username_providers.dart';
import 'package:littleword/routes/error/error.routes.dart';
import 'package:littleword/routes/home/home.routes.dart';
import 'package:littleword/routes/loading/loading.root.dart';
import 'package:littleword/routes/login/login.routes.dart';

class LittleWordsApp extends StatelessWidget {
  const LittleWordsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
        child: MaterialApp(
          title: 'Little Words',
          home: _Routing(),
        )
    );
  }
}

class _Routing extends ConsumerWidget{
  const _Routing({
    Key? key,
}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref){
    return ref.watch(usernameProvider).when(data: _whenData, error: _whenError, loading: _whenLoading);
  }
  Widget _whenData(String? username){
    if(null == username){
      return LoginRoute();
    }
    return HomeRoute();
  }
  Widget _whenError(Object error, StackTrace stackTrace){
    return ErrorRoute();
  }
  Widget _whenLoading(){
    return LoadingRoute();
  }
}


