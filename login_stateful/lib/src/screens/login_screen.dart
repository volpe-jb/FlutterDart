import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form( // pass key to widget
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),  
    );
  }

  Widget emailField() {
    return TextFormField(
      // set TextInputType so @ appears on keyboard
      keyboardType: TextInputType.emailAddress,
      decoration:InputDecoration(
        labelText: 'Email address',
        hintText: 'you@example.com',
      ),
      
      validator: (String value) {  // function to the validator property
        // return null if valid
        // otherwise string (with error message) if invalid
        if (!value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
      onSaved: (String value) {
        print(value);
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      
      validator: (String value) {
        if (value.length  < 4) {
          return 'Password must be at least 4 characters';
        }
      },
      onSaved: (String value) {
        print(value);
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit!'),
      onPressed: () {
        if (formKey.currentState.validate()) {
        formKey.currentState.save();
        }
      },
    );  
  }
}