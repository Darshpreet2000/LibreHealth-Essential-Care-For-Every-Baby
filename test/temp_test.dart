import 'package:expression_language/expression_language.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interpolation/interpolation.dart';

void main() {
  int weight =656;
  String str = '{weight}<50';

  var interpolation = Interpolation();

  test('returns false if user is not loggedIn', () {
    var stringIs = interpolation.eval(str, {
      'weight': weight,
    });
    //Create expression parser and pass a map of the types extending ExpressionProviderElement which can hold other expressions.
    var expressionGrammarDefinition =
        ExpressionGrammarParser({});

    var parser = expressionGrammarDefinition.build();

    var result = parser.parse(stringIs);
    var expression = result.value as Expression<bool>;

//Evaluate the expression.
    bool value = expression.evaluate();
    print(value);
  });
}
