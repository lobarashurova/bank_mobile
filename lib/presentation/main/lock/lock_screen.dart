import 'package:bank_mobile/extensions/navigation_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/presentation/main/main/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LockScreen extends StatefulWidget {
  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  String _enteredPin = '';
  final String _correctPin = '1234';
  final LocalAuthentication _localAuth = LocalAuthentication();
  bool _isAuthenticated = false;
  String _authStatus = "Locked";

  void _onNumberPressed(String number) {
    if (_enteredPin.length < 4) {
      setState(() {
        _enteredPin += number;
      });

      if (_enteredPin.length == 4) {
        _validatePin();
      }
    }
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to access the app',
        options: const AuthenticationOptions(
            biometricOnly: true,
            // Use only biometrics
            stickyAuth: true,
            // Keeps authentication active across app suspensions
            useErrorDialogs: true // Use system-provided error dialogs
            ),
      );
      setState(() {
        _isAuthenticated = authenticated;
        if (authenticated) {
          // Navigate to Home Page if authenticated
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        } else {
          _authStatus = "Failed to authenticate";
        }
      });
    } catch (e) {
      setState(() {
        _authStatus = "Error: $e";
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void _onDeletePressed() {
    if (_enteredPin.isNotEmpty) {
      setState(() {
        _enteredPin = _enteredPin.substring(0, _enteredPin.length - 1);
      });
    }
  }

  void _validatePin() {
    if (_enteredPin == _correctPin) {
      setState(() {
        _enteredPin = '';
      });
      context.pushReplacement(MainPage());
    } else {
      setState(() {
        _enteredPin = '';
      });
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('Incorrect PIN'),
          content: Text('Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            "Welcome to our bank system!"
                .s(24)
                .a(TextAlign.center)
                .w(600)
                .c(context.colors.onPrimary),
            Spacer(),
            Icon(
              Icons.lock,
              size: 100,
              color: Colors.blueGrey,
            ),
            SizedBox(height: 20),
            Text(
              'Enter PIN',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: context.colors.onPrimary),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: index < _enteredPin.length
                          ? Colors.blueGrey
                          : Colors.transparent,
                      border: Border.all(color: Colors.blueGrey, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 40),
            _buildNumberPad(context),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child:
                  "It is for your privacy reasons, please enter the correct password to confirm your availibilty"
                      .s(14)
                      .a(TextAlign.center)
                      .w(400)
                      .c(context.colors.onPrimary),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  Widget _buildNumberPad(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: ['1', '2', '3'].map(_buildNumberButton).toList(),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: ['4', '5', '6'].map(_buildNumberButton).toList(),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: ['7', '8', '9'].map(_buildNumberButton).toList(),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async {
                await _authenticate();
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
                backgroundColor: Colors.blueGrey, // Background color
              ),
              child: Icon(
                Icons.fingerprint,
                color: Colors.white,
              ),
            ),
            _buildNumberButton('0'),
            _buildDeleteButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberButton(String number) {
    return ElevatedButton(
      onPressed: () => _onNumberPressed(number),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.blueGrey, // Background color
      ),
      child: Text(
        number,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return ElevatedButton(
      onPressed: _onDeletePressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.red, // Background color
      ),
      child: Icon(
        Icons.backspace,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
