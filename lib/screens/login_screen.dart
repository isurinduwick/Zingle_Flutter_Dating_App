import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              
              // Logo with red circle background
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE91E63), // Red/Pink color
                ),
                padding: EdgeInsets.all(5),
                child: Image.asset(
                  'assets/Zingle_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              
              const SizedBox(height: 60),
              
              // Sign up to continue text
              Text(
                'Sign up to continue',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Continue with email button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to email signup
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE91E63),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Continue with email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Use phone number button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigate to phone signup
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Color(0xFFE91E63),
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  child: Text(
                    'Use phone number',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE91E63),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Or sign up with text
              Text(
                'or sign up with',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Social login buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(
                    icon: Icons.facebook,
                    color: Color(0xFF1877F2),
                    onPressed: () {
                      // Facebook login
                    },
                  ),
                  const SizedBox(width: 16),
                  _buildSocialButton(
                    icon: Icons.g_mobiledata,
                    color: Color(0xFFDB4437),
                    onPressed: () {
                      // Google login
                    },
                  ),
                  const SizedBox(width: 16),
                  _buildSocialButton(
                    icon: Icons.apple,
                    color: Colors.black,
                    onPressed: () {
                      // Apple login
                    },
                  ),
                ],
              ),
              
              const Spacer(),
              
              // Terms and Privacy Policy
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to terms
                      },
                      child: Text(
                        'Terms of use',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFE91E63),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '•',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to privacy policy
                      },
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFE91E63),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: IconButton(
        icon: Icon(icon, size: 28),
        color: color,
        onPressed: onPressed,
      ),
    );
  }
}
