// ignore: avoid_web_libraries_in_flutter

import 'dart:convert';

import 'package:flutter/material.dart';

class DynamicFormScreen extends StatefulWidget {
  const DynamicFormScreen({Key? key}) : super(key: key);

  @override
  _DynamicFormScreenState createState() => _DynamicFormScreenState();
}

class _DynamicFormScreenState extends State<DynamicFormScreen> {
  //
  late int _count;
  late String _result;
  // ignore: unused_field
  late List<Map<String, dynamic>> _values;

  @override
  void initState() {
    super.initState();
    _count = 0;
    _result = '';
    _values = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Form'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              setState(() {
                _count++;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              setState(() {
                _count = 0;
              });
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _count,
                itemBuilder: (context, index) {
                  return _row(index);
                },
              ),
            ),
            const SizedBox(height: 10.0),
            Text(_result),
          ],
        ),
      ),
    );
  }

  _row(int key) {
    return Row(
      children: [
        Text('ID: $key'),
        const SizedBox(width: 30.0),
        Expanded(child: TextFormField(
          onChanged: (val) {
            _onUpdate(key, val);
          },
        )),
      ],
    );
  }

  _onUpdate(int key, String val) {
    // ignore: non_constant_identifier_names, unused_local_variable
    int Foundkey = -1;
    for (var map in _values) {
      if (map.containsKey('id')) {
        if (map['id'] == key) {
          Foundkey = key;
          break;
        }
      }
    }
    if (-1 != Foundkey) {
      _values.removeWhere((map) {
        return map['id'] == Foundkey;
      });
    }
    Map<String, dynamic> json = {
      'id': key,
      'value': {
        "text": val,
      }
    };
    _values.add(json);

    setState(() {
      _result = _prettyPrint(_values);
    });
  }

  // ignore: unused_element
  String _prettyPrint(jsonObject) {
    var encoder = const JsonEncoder.withIndent('      ');
    return encoder.convert(jsonObject);
  }
}
