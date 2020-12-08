import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:hotel_management/components/reuable_alertdialog.dart';
import 'package:hotel_management/components/reusable_loading.dart';

class DialogWorker {
  static void showDialog({
    String title,
    String body,
    BuildContext context,
    Function positiveAction,
    Function negativeAction,
    String positiveActionText,
    String negativeActionText,
    Row actionWidgets,
  }) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ReusableAlertDialog(
          title: title,
          body: body,
          positiveActionText: positiveActionText,
          positiveAction: positiveAction,
          negativeActionText: negativeActionText,
          negativeAction: negativeAction,
          actionWidgets: actionWidgets,
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.linear,
      duration: Duration(milliseconds: 500),
    );
  }

  static void showInformationDialog({
    String title,
    BuildContext context,
    Function positiveAction,
    Function negativeAction,
    String positiveActionText,
    String negativeActionText,
    Row actionWidgets,
    Widget body,
  }) async {
    showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          backgroundColor: Colors.grey,
          titlePadding: EdgeInsets.only(top: 16.0, left: 16.0),
          contentPadding: EdgeInsets.all(16.0),
          actionsPadding: EdgeInsets.only(bottom: 8.0, right: 4.0),
          content: body,
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
      },
      animationType: DialogTransitionType.size,
      curve: Curves.linear,
      duration: Duration(milliseconds: 500),
    );
  }

  static void showLoadingDialog(BuildContext context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          backgroundColor: Colors.grey,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ReusableLoading(
                color: Colors.black,
              ),
            ],
          ),
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.linear,
      duration: Duration(milliseconds: 500),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(padding: mediaQuery.viewInsets, duration: const Duration(milliseconds: 300), child: child);
  }
}
