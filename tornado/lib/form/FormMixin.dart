import 'package:flutter/material.dart';
import 'package:tornado/theme.dart';

import 'Validator.dart';

mixin FormMixin<E, T extends StatefulWidget> on State<T> {
  bool submitted = false;

  GlobalKey _formKey = new GlobalKey<FormState>();

  late E entity;

  get formKey {
    return _formKey;
  }

  Widget buildLabel(String label, bool required) {
    if (required) {
      return Row(
        children: [Text('* ', style: TextStyle(color: Colors.red)), Text(label, style: Theme.of(context).textTheme.labelSmall)],
      );
    } else {
      return Text(label, style: Theme.of(context).textTheme.labelSmall);
    }
  }

  String? validate<C>(List<ValidatorFn?>? validators, C? v) {
    if (validators != null && validators.isNotEmpty) {
      bool required = validators.any((element) => element!.type == 'required');
      if ((v == null || v is String && v.isEmpty) && !required) {
        return null;
      }
      for (var element in validators) {
        if (element != null) {
          String? error = element.call(v);
          if (error != null) {
            return error;
          }
        }
      }
    } else {
      return null;
    }
  }

  void submitForm() {
    if (!this.submitted) {
      FormState formState = (_formKey.currentState as FormState);
      formState.save();
      if (formState.validate()) {
        this.submitted = true;
        this.onValidSuccess(entity);
      } else {
        this.submitted = false;
      }
    }
  }

  void resetForm() {
    FormState formState = (_formKey.currentState as FormState);
    formState.reset();
  }


  @protected
  @factory
  onValidSuccess(E formValue);
}
