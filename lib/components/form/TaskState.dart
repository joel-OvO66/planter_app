import 'package:flutter/material.dart';
import 'package:tornado/form/FormMixin.dart';
abstract class TaskFormState<  T extends StatefulWidget> extends State<T> {

    String getTaskData() ;
}