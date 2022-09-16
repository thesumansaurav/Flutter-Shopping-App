import 'package:flutter/material.dart';
import 'package:myapp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String fname = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(context) async {
    if(_formKey.currentState!.validate()){
    setState(() {
      changeButton = true;
     });
    await Future.delayed(const Duration(seconds: 1));
                        // ignore: use_build_context_synchronously
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
     setState(() {
       changeButton = false;
        });
    }
  }
  @override
  Widget build(BuildContext context) {
     return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/hey.png", 
                fit: BoxFit.cover),
              const SizedBox(
                height: 20,
              ),
              Text("welcome $fname",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )
              ),
            const SizedBox(
                height: 20,
              ),
            Padding(
              padding: const EdgeInsets.all(20.0), 
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter User Name",
                      labelText: "Username",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                            },
                    onChanged: (value){
                      fname = value;
                      setState(() {
                        
                      });
                    },
                  ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                          return 'Please enter Password';
                        }
                        else if(value.length <6){
                            return 'Enter at least 6 character';
                        }
                        return null;
                            },
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(

                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changeButton ? 40 : 8.0),
                  child: InkWell(
                  
                      onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: changeButton ? 40 : 150,
                            height: 40,
                            alignment: Alignment.center,
                            child: changeButton
                            ? const Icon(
                              Icons.done,
                              color: Colors.white
                            )
                              : const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18
                                  )
                                )
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
}
