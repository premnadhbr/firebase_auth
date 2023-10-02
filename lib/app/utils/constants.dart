import 'package:flutter/material.dart';
import 'package:user_management_firebase/app/view/sign_in/signin_screen.dart';
import 'package:user_management_firebase/app/view/sign_up/signup_screen.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 16.0,
    ),
    decoration: InputDecoration(
      labelText: text,
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      labelStyle: TextStyle(
        color: Colors.white.withOpacity(0.8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.white,
          width: 2.0,
        ),
      ),
    ),
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function ontap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {
        ontap(); // Corrected to ontap();
      },
      child: Text(
        isLogin ? 'LOG IN' : ' SIGN UP',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

Row signupOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Don't have an account? ",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ));
        },
        child: Text(
          'Sign in',
          style: TextStyle(
            color: Color.fromARGB(
                255, 1, 37, 55), // You can use any color you like
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
