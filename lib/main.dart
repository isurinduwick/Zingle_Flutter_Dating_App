import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/pages/splash/splash_page.dart';
import 'presentation/viewmodels/splash_viewmodel.dart';
import 'domain/usecases/check_auth_usecase.dart';
import 'domain/repositories/auth_repository.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'data/datasources/local/auth_local_datasource.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({Key? key, required this.sharedPreferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Data Sources
        Provider<AuthLocalDatasource>(
          create: (_) => AuthLocalDatasourceImpl(sharedPreferences),
        ),
        // Repositories
        Provider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            context.read<AuthLocalDatasource>(),
          ),
        ),
        // Use Cases
        Provider<CheckAuthUsecase>(
          create: (context) => CheckAuthUsecase(
            context.read<AuthRepository>(),
          ),
        ),
        // ViewModels
        ChangeNotifierProvider<SplashViewModel>(
          create: (context) => SplashViewModel(
            context.read<CheckAuthUsecase>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Zingle',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          useMaterial3: true,
        ),
        home: SplashPage(),
      ),
    );
  }
}
