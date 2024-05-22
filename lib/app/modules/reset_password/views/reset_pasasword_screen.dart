import 'package:al_dana/app/data/data.dart';
import 'package:al_dana/app/modules/reset_password/provider/reset_password_provider.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text(
          'Reset Password',
          style: TextStyle(color: white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter current Password';
                  }
                  return null;
                },
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Current Password',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter new password';
                  } else if (value.length < 6) {
                    return 'Please enter a password with length more than 6 digits';
                  }
                  return null;
                },
                controller: _newPasswordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New Password',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter confirm password';
                  } else if (value.length < 6) {
                    return 'Please enter a password with length more than 6 digits';
                  }
                  return null;
                },
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: primary,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ResetPasswordProvider()
                            .resetPassword(
                          _passwordController.text.trim(),
                          _newPasswordController.text.trim(),
                          _confirmPasswordController.text.trim(),
                        )
                            .then((_) {
                          _passwordController.clear();
                          _newPasswordController.clear();
                          _confirmPasswordController.clear();
                        });
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
