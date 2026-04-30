import 'package:tornado/form/Validator.dart';

mixin FormFieldBuilderHelper{
    static String? validate<C>(C? v, List<ValidatorFn?>? validators) {
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
}