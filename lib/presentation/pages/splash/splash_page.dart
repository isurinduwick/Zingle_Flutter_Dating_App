import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/splash_viewmodel.dart';

class SplashPage extends StatefulWidget {
  // ignore: use_super_parameters
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<SplashViewModel>();
      viewModel.checkAuthStatus();

      // Listen for navigation
      viewModel.addListener(() {
        if (viewModel.navigationRoute != null) {
          Navigator.of(
            context,
          ).pushReplacementNamed(viewModel.navigationRoute!);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SplashViewModel>(
        builder: (context, viewModel, child) {
          return Container(
            decoration: BoxDecoration(color: Color(0xFFB80F0A)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Logo
                  Image.asset(
                    'assets/Zingle_logo.png',
                    width: 420,
                    height: 420,
                  ),
                  SizedBox(height: 60),
                  // Loading Indicator
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 3,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Error Message
                  if (viewModel.errorMessage != null)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Text(
                            viewModel.errorMessage!,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () => viewModel.checkAuthStatus(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text(
                              'Retry',
                              style: TextStyle(color: Color(0xFFFF6B9D)),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
