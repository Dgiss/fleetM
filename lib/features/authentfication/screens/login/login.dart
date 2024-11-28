import 'package:fleet_watcher_mobile/common/widgets/inputes/input_text_field.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/home/home_screen.dart';
import 'package:fleet_watcher_mobile/models/fake/fake_user_data.dart';
import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:fleet_watcher_mobile/utils/constants/image.dart';
import 'package:fleet_watcher_mobile/utils/constants/sizes.dart';
import 'package:fleet_watcher_mobile/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePass = true;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;
  String? _userNameError;
  String? _passwordError;

  // Fonction toogle Pass visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePass = !_obscurePass;
    });
  }

  // Vérifier les informations de connexion
  void _login() async {
    String userName = _userNameController.text;
    String password = _passwordController.text;
    bool hasError = false;

    // Refresh error msg
    setState(() {
      _userNameError = null;
      _passwordError = null;
      _errorMessage = null;
    });

    if (userName.isEmpty) {
      setState(() {
        _userNameError = "userNameError".tr;
        hasError = true;
      });
    }
    if (password.isEmpty) {
      setState(() {
        _passwordError = "passError".tr;
        hasError = true;
      });
    }
    if (hasError) return;
    try {
      //try car y'a une exception si jmais il ne trouve pas l'element
      FakeUserData.users.firstWhere(
          (user) => user.userName == userName && user.password == password);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      HelperFuctions.navigateToScreenWithouReturn(context, const HomeScreen());
    } catch (e) {
      setState(() {
        _errorMessage = "errorMessage".tr;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: double.infinity,
              height: HelperFuctions.screenHeight(),
              child: Padding(
                padding: const EdgeInsets.all(FSizes.defaultSpace),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //header
                    Image(
                      image: AssetImage(MyImages.logo),
                    ),
                    const Gap(FSizes.spaceBtwSection * 3),
                    //UserName
                    InputTextField(
                      controller: _userNameController,
                      hintText: "loginInput".tr,
                      hintColor: MyColors.darkGrey,
                      icon: CupertinoIcons.mail,
                      iconColor: MyColors.primary,
                      contentPading: FSizes.contentPading,
                      errorText: _userNameError,
                    ),
                    const Gap(FSizes.spaceBtwInputeFields),
                    //Password
                    InputTextField(
                      controller: _passwordController,
                      obscurePass: _obscurePass,
                      onPressed: _togglePasswordVisibility,
                      hintText: "passInput".tr,
                      hintColor: MyColors.darkGrey,
                      icon: CupertinoIcons.lock,
                      iconColor: MyColors.primary,
                      isSuffix: true,
                      contentPading: FSizes.contentPading,
                      errorText: _passwordError,
                    ),
                    const Gap(FSizes.spaceBtwInputeFields),
                    //error_msgs
                    if (_errorMessage != null)
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: FSizes.errorPading),
                        child: Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    //connexion btn
                    SizedBox(
                      width: double.infinity,
                      height: FSizes.btnLoginHight,
                      child: ElevatedButton(
                        onPressed: _login,
                        child: Text(
                          "btnConnecter".tr,
                          style: const TextStyle(fontSize: FSizes.fonSizeXl),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
