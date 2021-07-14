import 'package:expression_language/expression_language.dart';
import 'package:flutter/cupertino.dart';
import 'package:interpolation/interpolation.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClassificationRepository {
  BuildContext context;
  ClassificationRepository(this.context);

  String classifyBabyHealth(
      {required bool? ecebSevereJaundice,
      required double? ecebAssessTemperature,
      required double? ecebWeight,
      required bool? ecebChestIndrawing,
      required bool? ecebFeedingProperly,
      required bool? ecebFastBreathing,
      required bool? ecebConvulsions}) {
    DHIS2Config.setUpProgramRules();

    var interpolation = Interpolation();
    var programRuleDanger = interpolation.eval(DHIS2Config.programRuleDanger, {
      'ecebSevereJaundice': ecebSevereJaundice,
      'ecebAssessTemperature': ecebAssessTemperature,
      'ecebWeight': ecebWeight,
      'ecebChestIndrawing': ecebChestIndrawing,
      'ecebFeedingProperly': ecebFeedingProperly,
      'ecebFastBreathing': ecebFastBreathing,
      'ecebConvulsions': ecebConvulsions,
    });
    var programRuleProblem =
        interpolation.eval(DHIS2Config.programRuleProblem, {
      'ecebSevereJaundice': ecebSevereJaundice,
      'ecebAssessTemperature': ecebAssessTemperature,
      'ecebWeight': ecebWeight,
      'ecebChestIndrawing': ecebChestIndrawing,
      'ecebFeedingProperly': ecebFeedingProperly,
      'ecebFastBreathing': ecebFastBreathing,
      'ecebConvulsions': ecebConvulsions,
    });

    if (evaluateString(programRuleProblem))
      return AppLocalizations.of(context)!.problem;

    if (evaluateString(programRuleDanger))
      return AppLocalizations.of(context)!.danger;

    return AppLocalizations.of(context)!.normal;
  }

  bool evaluateString(String str) {
    //Create expression parser and pass a map of the types extending ExpressionProviderElement which can hold other expressions.
    var expressionGrammarDefinition = ExpressionGrammarParser({});

    var parser = expressionGrammarDefinition.build();

    var result = parser.parse(str);
    var expression = result.value as Expression<bool>;

    //Evaluate the expression.
    return expression.evaluate();
  }
}
