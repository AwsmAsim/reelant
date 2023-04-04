import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reelant_1/constants.dart';
import 'package:reelant_1/view/pages/app_main/home_page.dart';
import 'package:reelant_1/view/pages/login_and_register/register_user_details.dart';

class LoginPage extends StatefulWidget {

  UserType userType;

  LoginPage({this.userType = UserType.recruiter});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _selectedTabIndex = 0;

  void _handleTabIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // App Name
              Container(
                height: MediaQuery.of(context).size.height * 2 / 5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF37474F), Colors.black87],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Text(
                  'ReeLant',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black54,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),


              // Tab Selector
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _handleTabIndex(0),
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: _selectedTabIndex == 0
                            ? Colors.white :
                        Colors.black,
                        backgroundColor: _selectedTabIndex == 0
                            ? Colors.black :
                        Colors.white,
                        // primary: _selectedTabIndex == 0
                        //     ? Theme.of(context).accentColor
                        //     : null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _handleTabIndex(1),
                      child: Text('Register'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: _selectedTabIndex == 1
                            ? Colors.white :
                        Colors.black,
                          backgroundColor: _selectedTabIndex == 1
                              ? Colors.black :
                              Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              // Tabs
              Container(
                // height: 300,
                child: Column(
                  children: [
                    // Login Tab
                    _selectedTabIndex == 0
                        ? LoginForm(userType: widget.userType,)
                        : Container(),

                    // Register Tab
                    _selectedTabIndex == 1
                        ? RegisterForm(userType: widget.userType,)
                        : Container(),
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

class LoginForm extends StatelessWidget {

  UserType userType;
  LoginForm({required this.userType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Email Input
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),

          // Password Input
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),

          // Login Button
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterUserDetailsPage(userType: userType,)));
            },
            child: Text('Login'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}


class RegisterForm extends StatelessWidget {

  UserType userType;

  RegisterForm({required this.userType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Email Input
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),

          // Password Input
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),

          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),

          // Login Button
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterUserDetailsPage(userType: userType,)));
            },
            child: Text('Register'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
