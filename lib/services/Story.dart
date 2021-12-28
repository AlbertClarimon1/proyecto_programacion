import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  Story(this.story);

  final String story;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16.0),
          child: Text(
            'Synopsis',
            style: textTheme.subtitle1!.copyWith(fontSize: 18.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
          child: Text(
            story,
            style:
            textTheme.bodyText2!.copyWith(color: Colors.black45, fontSize: 16.0),
          ),
        ),
        // No expand-collapse in this tutorial, we just slap the "more"
        // button below the text like in the mockup.
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'more',
                style: textTheme.bodyText2!.copyWith(fontSize: 16.0, color: theme.accentColor),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 18.0,
                color: theme.accentColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}