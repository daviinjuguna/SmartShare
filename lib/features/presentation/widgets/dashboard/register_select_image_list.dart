import 'package:flutter/material.dart';

class RegisterSelectImageList extends StatelessWidget {
  const RegisterSelectImageList({
    Key key,
    @required this.selections,
    @required this.tap,
  }) : super(key: key);

  final List selections;
  final Function tap;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      children: [
        Center(
            child: Column(
          children: [Text('Select Photo'), Divider(thickness: 1)],
        )),
        Container(
          height: 150,
          width: double.infinity,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  tap(selections[index]['title']);
                  Navigator.of(context).pop();
                },
                title: Text(selections[index]['title']),
                leading: Icon(selections[index]['icon']),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: selections?.length,
          ),
        ),
      ],
    );
  }
}