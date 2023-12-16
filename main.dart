import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

final _formKey = GlobalKey<FormState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController FirstnameController = TextEditingController();
  TextEditingController LastnameController = TextEditingController();
  TextEditingController phnoController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
    );
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }
  String? validatePhoneNumber(String? phoneNumber) {
    RegExp phoneRegex = RegExp(
      r'^\d{10}$',
    );
    final isPhoneValid = phoneRegex.hasMatch(phoneNumber ?? '');
    if (!isPhoneValid) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100),
      child: Form(
        key: _formKey,
        child: Column(
          // Replace children with Column
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: FirstnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                ),
                validator: (name) {
                  if (name == null || name.isEmpty) {
                    return 'First Name should not be empty';
                  } else if(name.length < 3){
                    return 'Name should contain atleast 3 characters';
                  }
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: LastnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name ',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email ID',
                ),
                validator: validateEmail,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                obscureText: true,
                controller: phnoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile',
                ),
                validator: validatePhoneNumber,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
            Container(
              //height: 50,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                child: const Text('Sign In'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, you can perform the login or navigation here
                    print("Form is valid");
                  }
                },
              ),
            ),
            Row(
              children: <Widget>[
                const Text('Already have an account?'),
                TextButton(
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
