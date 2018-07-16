import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();             // <<<<<<<<<<​​

  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form( // pass key to widget
        key: formKey,                                // <<<<<<<<<<​​
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
      
      validator: validateEmail,  // passing reference
      onSaved: (String value) {                 
        email = value;
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
      
      validator: validatePassword,  // passing reference
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit!'),
      onPressed: () {
        if (formKey.currentState.validate()) {
        formKey.currentState.save();           // <<<<<<<<<<​​
        // take *both* email and password and pass to an API
        print ('Time to post $email and $password to my API');
        }
      },
    );  
  }
}