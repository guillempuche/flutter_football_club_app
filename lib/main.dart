import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => MatchesBloc(matchesApi: MockMatchesApi()))
        ],
        child: (BuildContext context) {
          return Theme(
            data: ThemeData(
              appBarTheme: AppBarTheme(backgroundColor: Colors.green.shade400),
            ),
            child: MaterialApp(
              home: const MyHomePage(title: 'Flutter Demo Home Page'),
              debugShowCheckedModeBanner: false,
            ),
          );
        });
  }
}
