import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({
    Key? key,
    required this.currentStep,
    required this.steps,
    this.onStepContinue,
  }) : super(key: key);

  final int currentStep;
  final int totalStepsForSemantic = 3;
  final List<CustomStep> steps;
  final VoidCallback? onStepContinue;

  @override
  Widget build(BuildContext context) {
    final step = steps[currentStep];
    final List<CustomStep> visualStepperSteps = steps
      ..removeWhere((CustomStep step) => !step.displayStep);

    const animateDuration = Duration(milliseconds: 600);
    const stepperHeight = 20.0;

    double getDotHeight(StepState state) {
      return state == StepState.editing ? stepperHeight : 8;
    }

    Color getDotColor(StepState state) {
      return state == StepState.complete ? Colors.blue : Colors.white;
    }

    Color getDotBorderColor(StepState state) {
      return state == StepState.editing || state == StepState.complete
          ? Colors.blue
          : Colors.grey;
    }

    return Column(
      children: [
        const SizedBox(height: 34),
        currentStep != 3
            ? MergeSemantics(
                child: Semantics(
                  container: true,
                  label:
                      ' Paso ${currentStep + 1} de $totalStepsForSemantic ${currentStep + 1} ${step.semanticTitle},',
                  explicitChildNodes: true,
                  child: SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final width = constraints.maxWidth;
                          final progresFactor =
                              width / (visualStepperSteps.length - 1);
                          return Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 1.0,
                                      right: 1.0,
                                    ),
                                    child: Container(
                                      height: 2,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  AnimatedPositioned(
                                    duration: animateDuration,
                                    left: 8,
                                    right: (width -
                                        (progresFactor * currentStep) -
                                        progresFactor / 2),
                                    child: Container(
                                      height: 2,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: stepperHeight,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: visualStepperSteps.map(
                                        (e) {
                                          return Container(
                                            width: 20,
                                            alignment: e ==
                                                    visualStepperSteps.first
                                                ? Alignment.centerLeft
                                                : e == visualStepperSteps.last
                                                    ? Alignment.centerRight
                                                    : Alignment.center,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                AnimatedContainer(
                                                  duration: animateDuration,
                                                  height: getDotHeight(e.state),
                                                  width: getDotHeight(e.state),
                                                  decoration: BoxDecoration(
                                                    color: getDotColor(e.state),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: getDotBorderColor(
                                                          e.state),
                                                    ),
                                                  ),
                                                  child: ExcludeSemantics(
                                                    child: Text(
                                                      (visualStepperSteps
                                                                  .indexOf(e) +
                                                              1)
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (![
                                                  StepState.editing,
                                                  StepState.complete,
                                                ].contains(e.state))
                                                  Container(
                                                    height: 8,
                                                    width: 8,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              ExcludeSemantics(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: visualStepperSteps
                                      .map(
                                        (e) => SizedBox(
                                          width: constraints.maxWidth /
                                              visualStepperSteps.length,
                                          child: Align(
                                            alignment: e ==
                                                    visualStepperSteps.first
                                                ? Alignment.centerLeft
                                                : e == visualStepperSteps.last
                                                    ? Alignment.centerRight
                                                    : Alignment.center,
                                            child: e.title,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        Expanded(
          child: step.content,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: onStepContinue,
            child: Text(
              step.buttonNextStepTitle,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomStep extends Step {
  final bool displayStep;
  final String buttonNextStepTitle;
  final String semanticTitle;
  const CustomStep(
      {@override title,
      subtitle,
      content,
      state,
      isActive = true,
      label,
      this.displayStep = true,
      required this.buttonNextStepTitle,
      required this.semanticTitle})
      : super(
          title: title,
          subtitle: subtitle,
          content: content,
          state: state,
          isActive: isActive,
          label: label,
        );
}
