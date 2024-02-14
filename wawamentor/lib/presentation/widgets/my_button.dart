import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   child: Container(
    //     padding: const EdgeInsets.all(25),
    //     margin: const EdgeInsets.symmetric(horizontal: 25),
    //     decoration: BoxDecoration(
    //       color: Colors.black,
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    // child: const Center(
    //     child: Text(
    //   'Sign In',
    //   style: TextStyle(
    //     color: Colors.white,
    //     fontWeight: FontWeight.bold,
    //     fontSize: 16,
    //   ),
    // ))
    return Container(
      //padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.green],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: const Text(
          'Sign in',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
