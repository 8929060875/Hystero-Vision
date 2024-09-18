import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hystero/auth/verify.dart';

class SignInPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignInPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool passwordShow = true;
  bool confirm = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  Future signUp(TextEditingController emailController,
      TextEditingController passwordController) async {
    try {
      if (passwordConfirmed()) {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        )
            .then((_) {
          Navigator.of(context).pushReplacementNamed(Verification.routeName);
        });
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.TOP);
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() == _confirmPassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 141, 199, 1),
                Color.fromRGBO(29, 60, 112, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),

                        //email field
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              icon: Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                              labelText: 'Enter Email',
                            ),
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Please enter your email';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        //password field
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: passwordShow,
                            validator: (password) {
                              if (password == " ") {
                                return 'Please enter a valid password';
                              } else if (password!.length < 8) {
                                return "Password is too short";
                              }
                              return " ";
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: passwordShow == false
                                    ? const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                                onPressed: () {
                                  setState(() {
                                    passwordShow =
                                        !passwordShow; //show password
                                  });
                                  FocusScope.of(context).unfocus();
                                },
                              ),
                              labelText: 'Password',
                              icon: const Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        //confirm password field
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: _confirmPassword,
                            obscureText: confirm,
                            validator: (password) {
                              if (password == " ") {
                                return 'Please enter a valid password';
                              } else if (password!.length < 8) {
                                return "Password is too short";
                              }
                              return " ";
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: confirm == false
                                    ? const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                                onPressed: () {
                                  setState(() {
                                    confirm = !confirm; //show password
                                  });
                                  FocusScope.of(context).unfocus();
                                },
                              ),
                              labelText: 'Confirm Password',
                              icon: const Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              border: const UnderlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                              } else {
                                signUp(_emailController, _passwordController);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 221, 210, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already a Member?  ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: widget.showLoginPage,
                              child: const Text(
                                'Login Now',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 172, 199, 1),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
