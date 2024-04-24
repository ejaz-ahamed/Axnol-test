import 'package:axnol_project/controller/provider/login_provider.dart';
import 'package:axnol_project/core/themes/app_theme.dart';
import 'package:axnol_project/view/pages/profile_page.dart';
import 'package:axnol_project/view/widgets/elevated_button_widget.dart';
import 'package:axnol_project/view/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState(false);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 32,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: SizedBox()),
                RichText(
                    text: const TextSpan(
                        text: 'SHREE ',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Apptheme.primary,
                        ),
                        children: [
                      TextSpan(
                        text: 'IRA',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Apptheme.secondary,
                        ),
                      ),
                      TextSpan(text: '\nEDUCATION')
                    ])),
                const SizedBox(
                  height: 16,
                ),
                TextFieldWidget(
                  controller: emailController,
                  text: 'Email address',
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldWidget(
                  controller: passwordController,
                  text: 'Password',
                  suffixText: 'Forgot?',
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButtonWidget(
                    onpressed: () async {
                      isLoading.value = true;
                      await ref
                          .read(loginProvider.notifier)
                          .login(emailController.text, passwordController.text);
                      isLoading.value = false;
                      Future.sync(() => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          )));
                    },
                    text: isLoading.value
                        ? const CircularProgressIndicator()
                        : const Text('Sign In')),
                const Expanded(child: SizedBox()),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Not registered yet?',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Sign Up now',
                      style: TextStyle(
                        color: Apptheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
