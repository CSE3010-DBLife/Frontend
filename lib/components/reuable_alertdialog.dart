import 'package:flutter/material.dart';

class ReusableAlertDialog extends StatelessWidget {
  ReusableAlertDialog({this.title, this.body, this.positiveAction, this.positiveActionText, this.negativeAction, this.negativeActionText, this.actionWidgets});
  final String title;
  final String body;
  final Function positiveAction;
  final String positiveActionText;
  final Function negativeAction;
  final String negativeActionText;
  final Row actionWidgets;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      backgroundColor: Colors.grey,
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      content: Text(
        body,
        style: Theme.of(context).textTheme.subtitle2,
      ),
      titlePadding: EdgeInsets.only(top: 16.0, left: 16.0),
      contentPadding: EdgeInsets.all(16.0),
      actionsPadding: EdgeInsets.only(bottom: 8.0, right: 4.0),
      actions: [
        (negativeAction != null || negativeActionText != null)
            ? GestureDetector(
                child: Text(negativeActionText),
                onTap: negativeAction,
              )
            : SizedBox(),
        (positiveAction != null || positiveActionText != null)
            ? GestureDetector(
                child: Text(positiveActionText),
                onTap: positiveAction,
              )
            : SizedBox(),
        actionWidgets ?? SizedBox(),
      ],
    );
  }
}
