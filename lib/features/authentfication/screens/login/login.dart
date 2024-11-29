import 'package:fleet_watcher_mobile/common/widgets/inputes/input_text_field.dart';
import 'package:fleet_watcher_mobile/core/routes/app_routes.dart';
import 'package:fleet_watcher_mobile/features/authentfication/controllers/auth_controller.dart';
import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:fleet_watcher_mobile/utils/constants/image.dart';
import 'package:fleet_watcher_mobile/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authController = Get.put(AuthController());
  bool _obscurePass = true;
  String? _emailError;
  String? _passwordError;
  String? _errorMessage;

  void _togglePasswordVisibility() {
    setState(() => _obscurePass = !_obscurePass);
  }

  Future<void> _login() async {
    setState(() {
      _emailError = _passwordError = _errorMessage = null;
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty) {
      setState(() => _emailError = "L'email est requis");
      return;
    }
    if (password.isEmpty) {
      setState(() => _passwordError = "Le mot de passe est requis");
      return;
    }

    final success = await _authController.login(email, password);
    if (success) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
    } else {
      setState(() => _errorMessage = "Email ou mot de passe incorrect");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                padding: const EdgeInsets.all(FSizes.defaultSpace),
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 
                      MediaQuery.of(context).padding.top - 
                      MediaQuery.of(context).padding.bottom,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(FSizes.spaceBtwSection),
                    // Logo
                    Center(
                      child: Image.asset(
                        MyImages.logo,
                        height: 120,
                      ),
                    ),
                    const Gap(FSizes.spaceBtwSection * 2),
                    // Title
                    const Text(
                      "Bienvenue",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: MyColors.primary,
                      ),
                    ),
                    const Gap(FSizes.spaceBtwItems),
                    const Text(
                      "Connectez-vous à votre compte",
                      style: TextStyle(
                        fontSize: 16,
                        color: MyColors.darkGrey,
                      ),
                    ),
                    const Gap(FSizes.spaceBtwSection),
                    // Form
                    Form(
                      child: Column(
                        children: [
                          InputTextField(
                            controller: _emailController,
                            hintText: "Entrez votre adresse email",
                            hintColor: MyColors.darkGrey,
                            icon: CupertinoIcons.mail,
                            iconColor: MyColors.primary,
                            contentPading: FSizes.contentPading,
                            errorText: _emailError,
                          ),
                          const Gap(FSizes.spaceBtwInputeFields),
                          InputTextField(
                            controller: _passwordController,
                            obscurePass: _obscurePass,
                            onPressed: _togglePasswordVisibility,
                            hintText: "Entrez votre mot de passe",
                            hintColor: MyColors.darkGrey,
                            icon: CupertinoIcons.lock,
                            iconColor: MyColors.primary,
                            isSuffix: true,
                            contentPading: FSizes.contentPading,
                            errorText: _passwordError,
                          ),
                        ],
                      ),
                    ),
                    if (_errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: FSizes.sm),
                        child: Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    const Gap(FSizes.spaceBtwSection),
                    // Login Button
                    Obx(() => SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: FSizes.defaultSpace),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: FSizes.md),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(FSizes.borderRadiusMd),
                                ),
                                minimumSize: const Size(double.infinity, FSizes.btnLoginHight),
                              ),
                              onPressed: _authController.isLoading ? null : _login,
                              child: _authController.isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text(
                                      "Se connecter",
                                      style: TextStyle(
                                        fontSize: FSizes.fonSizeXl,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        )),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}