import 'package:flutter/material.dart';

class WidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Page"),
      ),
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final bodyheight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return ListView(
      itemExtent: bodyheight,
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                color: Colors.grey,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlertDialogInfo()),
                        );
                      });
                    },
                    child:
                        Text('For more info about Alert Dialog. Click Here')),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                color: Colors.purpleAccent,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RichTextInfo()),
                        );
                      });
                    },
                    child: Text('For more info about Rich Text. Click Here')),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectableTextInfo()),
                        );
                      });
                    },
                    child: Text(
                        'For more info about Selectable Text. Click Here')),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                color: Colors.orange,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FlexibleInfo()),
                        );
                      });
                    },
                    child: Text('For more info about Flexible. Click Here')),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                color: Colors.cyan,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SpacerInfo()),
                        );
                      });
                    },
                    child: Text('For more info about Spacer. Click Here')),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DividerInfo()),
                        );
                      });
                    },
                    child: Text('For more info about Divider. Click Here')),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                color: Colors.green,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IgnorePointerInfo()),
                        );
                      });
                    },
                    child:
                        Text('For more info about Ignore Pointer. Click Here')),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                color: Colors.teal,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ColorFilteredInfo()),
                        );
                      });
                    },
                    child: Text(
                        'For more info about Colour Filtered. Click Here')),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                color: Colors.pink,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ToolTipInfo()),
                        );
                      });
                    },
                    child: Text('For more info about Tool Tip. Click Here')),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                color: Colors.deepPurple,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AspectRatioInfo()),
                        );
                      });
                    },
                    child:
                        Text('For more info about Aspect Ratio. Click Here')),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                color: Colors.lime,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SizedBoxInfo()),
                        );
                      });
                    },
                    child: Text('For more info about Sized Box. Click Here')),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AlertDialogInfo extends StatefulWidget {
  @override
  _AlertDialogInfoState createState() => _AlertDialogInfoState();
}

class _AlertDialogInfoState extends State<AlertDialogInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Alert Dialog"),
            SizedBox(
              height: 20,
            ),
            Text(
                "An alert dialog informs the user about situations that require acknowledgement. An alert dialog has an optional title and an optional list of actions. The title is displayed above the content and the actions are displayed below the content."),
            SizedBox(
              height: 20,
            ),
            Text('Example:'),
            SizedBox(
              height: 20,
            ),
            AlertDialog(
              title: Text('AlertDialog Title'),
              content: Text('Demo text is here'),
              actions: [
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    return null;
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RichTextInfo extends StatefulWidget {
  @override
  _RichTextInfoState createState() => _RichTextInfoState();
}

class _RichTextInfoState extends State<RichTextInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rich Text'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Rich Text"),
            SizedBox(
              height: 20,
            ),
            Text(
                "The RichText widget displays text that uses multiple different styles. The text to display is described using a tree of TextSpan objects, each of which has an associated style that is used for that subtree. The text might break across multiple lines or might all be displayed on the same line depending on the layout constraints."),
            SizedBox(
              height: 20,
            ),
            Text('Example:'),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                text: 'Hello ',
                children: <TextSpan>[
                  TextSpan(
                      text: 'bold',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' world!'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectableTextInfo extends StatefulWidget {
  @override
  _SelectableTextInfoState createState() => _SelectableTextInfoState();
}

class _SelectableTextInfoState extends State<SelectableTextInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selectable Text'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Selectable Text"),
            SizedBox(
              height: 20,
            ),
            Text(
                "The SelectableText widget displays a string of text with a single style. The string might break across multiple lines or might all be displayed on the same line depending on the layout constraints."),
            SizedBox(
              height: 20,
            ),
            Text('Example:'),
            SizedBox(
              height: 20,
            ),
            SelectableText(
              'Hello! How are you?',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class FlexibleInfo extends StatefulWidget {
  @override
  _FlexibleInfoState createState() => _FlexibleInfoState();
}

class _FlexibleInfoState extends State<FlexibleInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flexible'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Flexible"),
            SizedBox(
              height: 20,
            ),
            Text(
                "Using a Flexible widget gives a child of a Row, Column, or Flex the flexibility to expand to fill the available space in the main axis (e.g., horizontally for a Row or vertically for a Column), but, unlike Expanded, Flexible does not require the child to fill the available space."),
            SizedBox(
              height: 20,
            ),
            Text('Example:'),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Text('one'),
                    color: Colors.blue,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    child: Text('two'),
                    color: Colors.blue,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Text('three'),
                    color: Colors.blue,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SpacerInfo extends StatefulWidget {
  @override
  _SpacerInfoState createState() => _SpacerInfoState();
}

class _SpacerInfoState extends State<SpacerInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spacer'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Spacer"),
            SizedBox(
              height: 20,
            ),
            Text(
                "The Spacer widget will take up any available space, so setting the Flex.mainAxisAlignment on a flex container that contains a Spacer to MainAxisAlignment.spaceAround, MainAxisAlignment.spaceBetween, or MainAxisAlignment.spaceEvenly will not have any visible effect: the Spacer has taken up all of the additional space, therefore there is none left to redistribute."),
            SizedBox(
              height: 20,
            ),
            Text('Example:'),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text('Begin'),
                Spacer(), // Defaults to a flex of one.
                Text('Middle'),
                // Gives twice the space between Middle and End than Begin and Middle.
                Spacer(flex: 2),
                Text('End'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DividerInfo extends StatefulWidget {
  @override
  _DividerInfoState createState() => _DividerInfoState();
}

class _DividerInfoState extends State<DividerInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Divider'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Divider"),
            SizedBox(
              height: 20,
            ),
            Text(
                "A thin horizontal line, with padding on either side. In the material design language, this represents a divider. Dividers can be used in lists, Drawers, and elsewhere to separate content. To create a divider between ListTile items, consider using ListTile.divideTiles, which is optimized for this case. The box's total height is controlled by height. The appropriate padding is automatically computed from the height."),
            SizedBox(
              height: 20,
            ),
            Text('Example:'),
            SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                Text('Above'),
                Divider(
                  color: Colors.black,
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 0,
                ),
                Text('Below'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IgnorePointerInfo extends StatefulWidget {
  @override
  _IgnorePointerInfoState createState() => _IgnorePointerInfoState();
}

class _IgnorePointerInfoState extends State<IgnorePointerInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ignore Pointer'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Ignore Pointer"),
            SizedBox(
              height: 20,
            ),
            Text(
                "When ignoring is true, this widget (and its subtree) is invisible to hit testing. It still consumes space during layout and paints its child as usual. It just cannot be the target of located events, because it returns false from RenderBox.hitTest."),
            SizedBox(
              height: 20,
            ),
            Text('Example:'),
            SizedBox(
              height: 20,
            ),
            IgnorePointer(
              ignoring: true,
              child: FlatButton(
                onPressed: () {
                  return null;
                },
                child: Text("demo"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ColorFilteredInfo extends StatefulWidget {
  @override
  _ColorFilteredInfoState createState() => _ColorFilteredInfoState();
}

class _ColorFilteredInfoState extends State<ColorFilteredInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Filtered'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Color Filtered"),
            SizedBox(
              height: 20,
            ),
            Text("Applies a ColorFilter to its child."),
            SizedBox(
              height: 20,
            ),
            Text('Example:'),
            SizedBox(
              height: 20,
            ),
            ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
              child: SizedBox(
                height: 50,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToolTipInfo extends StatefulWidget {
  @override
  _ToolTipInfoState createState() => _ToolTipInfoState();
}

class _ToolTipInfoState extends State<ToolTipInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tool Tip'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Tool Tip"),
            SizedBox(
              height: 20,
            ),
            Text(
                "Tooltips provide text labels that help explain the function of a button or other user interface action. Wrap the button in a Tooltip widget to show a label when the widget long pressed (or when the user takes some other appropriate action)."),
            SizedBox(
              height: 20,
            ),
            Text('Example:'),
            SizedBox(
              height: 20,
            ),
            Tooltip(
              message: 'Flat Button',
              verticalOffset: 48,
              height: 24,
              child: FlatButton(
                onPressed: () {
                  return null;
                },
                child: Text("demo"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AspectRatioInfo extends StatefulWidget {
  @override
  _AspectRatioInfoState createState() => _AspectRatioInfoState();
}

class _AspectRatioInfoState extends State<AspectRatioInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aspect Ratio'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Aspect Ratio"),
            SizedBox(
              height: 20,
            ),
            Text(
                "The widget first tries the largest width permitted by the layout constraints. The height of the widget is determined by applying the given aspect ratio to the width, expressed as a ratio of width to height."),
            SizedBox(
              height: 20,
            ),
            Text('Example:'),
            SizedBox(
              height: 20,
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: SizedBox(
                height: 50,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SizedBoxInfo extends StatefulWidget {
  @override
  _SizedBoxInfoState createState() => _SizedBoxInfoState();
}

class _SizedBoxInfoState extends State<SizedBoxInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sized Box'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Sized Box"),
            SizedBox(
              height: 20,
            ),
            Text(
                "If given a child, this widget forces its child to have a specific width and/or height (assuming values are permitted by this widget's parent). If either the width or height is null, this widget will try to size itself to match the child's size in that dimension. If the child's size depends on the size of its parent, the height and width must be provided."),
            SizedBox(
              height: 20,
            ),
            Text('Example:'),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
