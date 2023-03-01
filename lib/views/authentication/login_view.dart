import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  LoginView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CupertinoTextFormFieldRow(
              placeholder: 'Enter user name',
            ),
            CupertinoTextFormFieldRow(
              placeholder: 'Enter password',
            ),
            TextFormField(
                decoration: InputDecoration(
              suffix: IconButton(
                  onPressed: () {
                    //
                  },
                  icon: const Icon(Icons.forward)),
              hintText: 'or Enter code to join a quiz',
            )),
          ],
        ));
  }
}
