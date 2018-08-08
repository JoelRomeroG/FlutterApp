import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'terms': false
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.6),
        BlendMode.dstATop,
      ),
      image: AssetImage('assets/Wallpaper.jpg'),
    );
  }

  Widget _buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Email is required and must be a valid email address';
        }
      },
      decoration: InputDecoration(
        labelText: 'Email',
        filled: true,
        errorStyle: TextStyle(
          color: Colors.redAccent,
        ),
        fillColor: Colors.white30,
      ),
      onSaved: (String value) {
        _formData['email'] = value;
      },
    );
  }

  Widget _buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        filled: true,
        errorStyle: TextStyle(
          color: Colors.redAccent,
        ),
        fillColor: Colors.white30,
      ),
      validator: (String value) {
        if (value.isEmpty || value.length < 8) {
          return 'Password is required and must be 8+ characters';
        }
      },
      onSaved: (String value) {
        _formData['password'] = value;
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _formData['terms'],
      activeColor: Colors.lightBlueAccent,
      onChanged: (bool value) {
        setState(() {
          _formData['terms'] = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate() || !_formData['terms']) return;
    _formKey.currentState.save();
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final double targetWidth = MediaQuery.of(context).size.width > 550.0
        ? 500.0
        : MediaQuery.of(context).size.width * 0.95;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
              image: _buildBackgroundImage(),
            ),
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: targetWidth,
                  child: Column(
                    children: <Widget>[
                      _buildEmailFormField(),
                      SizedBox(
                        height: 5.0,
                      ),
                      _buildPasswordFormField(),
                      _buildAcceptSwitch(),
                      SizedBox(
                        height: 10.0,
                      ),
                      RaisedButton(
                        child: Text('Login'),
                        color: Colors.lightBlue,
                        onPressed: _submitForm,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
