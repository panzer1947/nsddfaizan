import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nsdd/providers/password_provider.dart';
import 'package:nsdd/utils/file_path.dart';
import 'package:nsdd/utils/routes.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _globalKeyLoginForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final passwordProvider =
        Provider.of<PasswordProvider>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              FilePath.topRightCornerBg(context),
              height: 152.h,
              width: 222.w,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: kPagePadding,
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _globalKeyLoginForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        kPageItemSpacing2,
                        TextFormField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.pin),
                            hintText: 'Enter cnic no',
                          ),
                        ),
                        kPageItemSpacing2,
                        Consumer<PasswordProvider>(
                          builder: (context, pp, child) => TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            obscureText: pp.isObscure,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.key),
                              hintText: 'Enter Password',
                              suffixIcon: IconButton(
                                icon: Icon(pp.isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () =>
                                    passwordProvider.toggleIsObscure(),
                              ),
                            ),
                          ),
                        ),
                        kPageItemSpacing2,
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            RouteGenerator.forgotPassword,
                          ),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Forgot Password?',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        kPageItemSpacing4,
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pushNamed(
                              context,
                              RouteGenerator.home,
                            ),
                            child: Text(
                              'Login',
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ),
                        kPageItemSpacing2,
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don’t have an account? ',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                TextSpan(
                                  text: 'Register',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator
                                            .restorablePushReplacementNamed(
                                          context,
                                          RouteGenerator.signup,
                                        ),
                                ),
                              ],
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
        ],
      ),
    );
  }
}
