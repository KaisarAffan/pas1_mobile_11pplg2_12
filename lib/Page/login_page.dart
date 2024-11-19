import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_12/controller/login_controller.dart';
import 'package:pas1_mobile_11pplg2_12/controller/username_controller.dart';
import 'package:pas1_mobile_11pplg2_12/widget/my_edittext.dart';
import 'package:pas1_mobile_11pplg2_12/widget/my_text.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: [
              SizedBox(
                height: 170,
              ),
              Text(
                "LogIn",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              MyEditText(
                  controller: usernameController,
                  labelText: "Username",
                  prefixIcon: Icons.person),
              SizedBox(
                height: 20,
              ),
              MyEditText(
                controller: passwordController,
                labelText: "Password",
                prefixIcon: Icons.lock,
                isPassword: true,
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 90.0),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                  onPressed: controller.isLoading.value
                      ? null
                      : () async {
                          if (usernameController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: MyText(
                                  hintText: "Nama dan password harus diisi!",
                                  fontSize: 16,
                                  colors: Colors.white,
                                ),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                          } else {
                            await controller.login(usernameController.text,
                                passwordController.text);
                            if (controller.loginStatus.value ==
                                "Login success") {
                              Get.put(UsernameController())
                                  .setUsername(usernameController.text);
                              Get.snackbar(controller.loginStatus.value,
                                  controller.token.value);
                              Get.toNamed('/dashboard');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: MyText(
                                    hintText: controller.loginStatus.value,
                                    fontSize: 16,
                                    colors: Colors.white,
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                  child: controller.isLoading.value
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : MyText(
                          hintText: "Login",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          colors: Colors.white,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
