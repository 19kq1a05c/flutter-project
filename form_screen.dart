import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _age;
  String _gender;
  String _url;
  String _phoneNumber;
  String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildage() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'age'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'age is Required';
        }

        if(int.tryParse(value) == null) {
          return 'Please enter a valid age';
        }
        if(int.parse(value) < 18 || int.parse(value) > 120) {
          return 'Please enter an age between 18 and 120';
        }

        return null;
      },
      onSaved: (value) {
        _age = int.parse(value);
      },
    );
  }

  Widget _buildgender() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'gender'),
      keyboardType: TextInputType.Text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'gender is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _gender = value;
      },
    );
  }

  Widget _buildcountry() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'country'),
      keyboardType: TextInputType.Text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'country is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _country = value;
      },
    );
  }

  Widget _buildhobbies() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'hobbies'),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'hobbies number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _hobbies = value;
      },
    );
  }

  Widget _buildCalories() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Calories'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Calories must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _calories = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Demo")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildage(),
                _buildgender(),
                _buildcountry(),
                _buildhobbies(),
                _buildCalories(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    print(_name);
                    print(_age);
                    print(_gender);
                    print(_country);
                    print(_hobbies);
                    print(_calories);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
