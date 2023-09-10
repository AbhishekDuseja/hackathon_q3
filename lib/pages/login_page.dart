import 'package:flutter/material.dart';
import 'package:flutter_application_hack3/utils/MyRoutes.dart';
//import 'package:flutter/src/painting/border_radius.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String abc = "";
  bool onChange = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        onChange = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homepage);
      setState(() {
        onChange = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 109, 204, 221),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "lib/assets/Images/download.jpeg",
                width: 3000,
                height: 400,
              ),

              // Image.network(
              //     "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpngtree.com%2Fso%2Fshopping-logo-design&psig=AOvVaw25KKt_hGMiflBf86_6gCjO&ust=1694408173380000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCLilr7ygn4EDFQAAAAAdAAAAABAE",
              //     width: 40,
              //     height: 20),

              Text(
                "WELCOME $abc",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    height: 2,
                    fontWeight: FontWeight.w200),
              ),

              const SizedBox(
                height: 20,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "username",
                        labelText: "username",
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "User name cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        abc = value;
                        //build(context);

                        setState(() {
                          abc = value;
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "enter password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Password cannot be empty";
                        } else if (value!.length < 6) {
                          return "Password length should be more than 6 letters";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              // ElevatedButton(
              //   style: TextButton.styleFrom(minimumSize: const Size(30, 30)),
              //   onPressed: () {
              //     Navigator.pushNamed(context, MyRoutes.homepage);
              //   },

              //   child: const Text("Login"),
              // ),

              Material(
                borderRadius: BorderRadius.circular(onChange ? 25 : 8),
                color: const Color.fromARGB(255, 230, 230, 59),
                child: InkWell(
                  onTap: () => moveToHome(context),

                  //borderRadius: BorderRadius.circular(20),
                  child: AnimatedContainer(
                    width: onChange ? 50 : 150,
                    height: 50,

                    // decoration: BoxDecoration(
                    //   shape: onChange ? BoxShape.circle : BoxShape.rectangle,
                    //  color: const Color.fromARGB(255, 241, 241, 4),
                    //   borderRadius: BorderRadius.circular(onChange ? 25 : 8),
                    // ),

                    duration: const Duration(seconds: 1),
                    //width: onChange ? 50 : 150,
                    //height: 50,
                    //clipBehavior:  BorderRadius.circular(16),
                    alignment: Alignment.center,
                    // color: const Color.fromARGB(255, 241, 241, 4),

                    // ignore: sort_child_properties_last

                    child: onChange
                        ? const Icon(Icons.done, color: Colors.amber)
                        : const Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(143, 239, 10, 52),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
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
