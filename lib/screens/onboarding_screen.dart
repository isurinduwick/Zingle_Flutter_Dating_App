import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  // Onboarding data
  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      title: 'Algorithm',
      description: 'Users going through a vetting process to ensure you never match with bots.',
      imageUrl: 'https://i.pinimg.com/1200x/9a/9f/31/9a9f31c057a9207df1cf7e09b4928909.jpg',
    ),
    OnboardingData(
      title: 'Matches', 
      description: 'We match you with people that have a large array of similar interests.',
      imageUrl: 'https://i.pinimg.com/736x/63/7c/a9/637ca987cbdf2e174c55a8f7563a2bac.jpg',
    ),
    OnboardingData(
      title: 'Premium',
      description: 'Sign up today and enjoy the first month of premium benefits on us.',
      imageUrl: 'https://i.pinimg.com/1200x/75/97/17/759717195f00bf4838956ead0eeccea1.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToSignup() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _navigateToSignin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          itemCount: _onboardingData.length,
          itemBuilder: (context, index) {
            return _buildOnboardingPage(index);
          },
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          // Main card with profile image
          Expanded(
            child: Center(
              child: Container(
                width: 280,
                constraints: BoxConstraints(maxHeight: 420),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    _onboardingData[index].imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Color(0xFFC8B299),
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                            color: Color(0xFFE94057),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Color(0xFFC8B299),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            size: 140,
                            color: Color(0xFFB8A082),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          // Title
          Text(
            _onboardingData[index].title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFFE94057),
            ),
          ),
          const SizedBox(height: 16),
          // Description
          Text(
            _onboardingData[index].description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          // Dots indicator
          _buildDotsIndicator(),
          const SizedBox(height: 40),
          // Create account button
          _buildCreateButton(),
          const SizedBox(height: 16),
          // Sign in link
          _buildSignInLink(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _onboardingData.length,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == _currentPage ? Color(0xFFE94057) : Color(0xFFE8E8E8),
          ),
        ),
      ),
    );
  }

  Widget _buildCreateButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _navigateToSignup,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFE94057),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Create an account',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInLink() {
    return GestureDetector(
      onTap: _navigateToSignin,
      child: RichText(
        text: TextSpan(
          text: 'Already have an account? ',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
          children: [
            TextSpan(
              text: 'Sign In',
              style: TextStyle(
                color: Color(0xFFE94057),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Data class for onboarding content
class OnboardingData {
  final String title;
  final String description;
  final String imageUrl;

  OnboardingData({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
