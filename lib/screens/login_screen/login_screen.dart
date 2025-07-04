import 'package:facebook_app/colors/app_colors.dart';
import 'package:facebook_app/home_page.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      // Simulate a network request
      await Future.delayed(const Duration(seconds: 2));

      // Replace with your actual authentication logic (e.g., API call)
      if (_emailController.text == 'm@mo.com' &&
          _passwordController.text == '123456') {
        // Successful login
        print('Login Successful!');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          ),
        );
      } else {
        setState(() {
          _errorMessage = 'Invalid email or password.';
        });
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin:const EdgeInsets.symmetric(horizontal: 20),
          color: AppColors.white,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //facebook logo
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 65),
                      child: CircleAvatar(
                        backgroundColor: AppColors.blue,
                        radius: 40,
                        child: Text(
                          'f',
                          style: TextStyle(
                            fontSize: 75,
                            fontWeight: FontWeight.w900,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle:const TextStyle( fontSize: 16, fontWeight: FontWeight.w400),
                        hintText: 'Mobile Number or Email Address',
                        hintStyle:const TextStyle(color: AppColors.gray, fontWeight: FontWeight.w400, fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
        
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 35),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        hintStyle:const TextStyle(color: AppColors.gray, fontWeight: FontWeight.w400, fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off)),
                      ),
                      obscureText: _obscureText,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),
        
                    _isLoading
                        ? const CircularProgressIndicator(color: AppColors.blue,)
                        : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: AppColors.blue,
                          foregroundColor: AppColors.white,
                        ),
                        child:const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    if (_errorMessage != null)
                      Text(
                        _errorMessage!,
                        style:const TextStyle(color: Colors.red, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
        
                    TextButton(
                      onPressed: () {
                        print('Forgotten Password ?');
                      },
                      child:const Text('Forgotten Password ?',
                          style: TextStyle(color: AppColors.gray)),
                    ),
                  ],
                ),
        
                Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: (){},
                          child:const Text('Create Account'),
                        ),
                    ),
                    const SizedBox(
                      height: 10
                    ),
                    //meta logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/meta_logo_.png',
                          width: 30,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Meta',
                          style: TextStyle(fontSize: 24, color: AppColors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
