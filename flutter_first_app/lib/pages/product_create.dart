import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/sushi.jpg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product\'s Name'),
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return 'Title is required and must be 5+ characters';
        }
      },
      keyboardType: TextInputType.text,
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product\'s Description'),
      validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return 'Description is required and must be 10+ characters';
        }
      },
      maxLines: 4,
      keyboardType: TextInputType.multiline,
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildPriceField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product\'s Price'),
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is required and must be a number';
        }
      },
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    widget.addProduct(_formData);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double paddingWidth = deviceWidth - targetWidth;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: paddingWidth / 2),
            children: <Widget>[
              _buildTitleField(),
              _buildDescriptionField(),
              _buildPriceField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Text('Create'),
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
