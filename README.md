# Assignment 7

## Stateless Widget and Stateful Widget

A widget can only either be stateful or stateless.  Its appearance and properties remain unchanged throughout the lifetime of the widget. 
A stateless widget will never change. Some examples include Icon, IconButton, and Text. 

Stateful widget on the other hand is dynamic, meaning that the widget can change. 
For example, it can change its appearance in response to events triggered by user interactions or when it recieves data.
Checkbox, Radio, Slider, InkWell, Form, and TextField are examples of stateful widgets.

## Widgets in the Project
There are Text widgets which display the information of odd/even and the current number.
There are also floating action button widgets which serves to increment or decrement the number being displayed in the page.
Lastly there is a stateful widget for the class which holds all of the page and its content.

## setState() Function
Every StatefulWidget has a State Object. This State Object keeps a track of the variables and functions that we define inside a StatefulWidget.
The setState() function notifies the the framework that the internal state of the object has changed in a way that might
impact the user interface in the subtree which causes the framework to schedule a build for the State object.
If you just change the state without calling setState, the framework might not schedule a build and the UI might not be updated to reflect the new state.

Variables created inside the class can be affected when calling the setState function and updating the content of the variable.

## Const and Final
Const and final keyword are used to assign a constant value to a variable. Both const and final are used to hardcode the values of the variable and it cannot be
changed in the future, neither any kind of operations performed can alter its value.
The difference is the const makes the variable constant from compile-time only. Using const on an object, makes the object’s entire deep state strictly fixed at 
compile-time and that the object with this state will be considered frozen and completely immutable.

## Implementation
<img width="136" alt="image" src="https://user-images.githubusercontent.com/112454126/200812554-bbc0ab21-4631-4635-a86d-23d60fd3a89b.png">

Made a function to decrement the counter only if the counter is not 0. If the counter is 0, set the variable of _isVisible to false.

<img width="169" alt="image" src="https://user-images.githubusercontent.com/112454126/200812922-36ff702c-23c0-444c-bd40-298ced62fa6d.png">

Created three additional variables each for the text of odd/even, the text color, and boolean value for visibility.

<img width="143" alt="image" src="https://user-images.githubusercontent.com/112454126/200813091-7328beff-c362-46b0-b79b-4bc561c1b3c7.png">

Created a function info() which updates the text to odd or even and the text color to blue if odd and red if even.

<img width="341" alt="image" src="https://user-images.githubusercontent.com/112454126/200813308-813d1b55-6bba-49bf-9589-d1bebd8f2110.png">

Call the info() function after every update in the increment and decrement function.

<img width="200" alt="image" src="https://user-images.githubusercontent.com/112454126/200813445-220686ce-8b11-4b21-92b6-901049e424e2.png">

Replace the text to the _text variable and the color set to the _color variable.

<img width="321" alt="image" src="https://user-images.githubusercontent.com/112454126/200813726-5fec9306-45b5-4502-b532-f73c23a01c84.png">

Created a new container of Floating Action Button with its position in center.
Made a child with a row direction and the main axis alignment space between to make the widgets on the left and right side of the app.
Added padding for the widgets.
Created two widgets, 1 for increment counter and 1 for decrement counter using the functions created before for the value in onPressed.
Added the icons for increment and decrement widget.
Use the visibility class for the decrement counter with the value of visible as the _isVisible function which updates to false if the counter is 0.


# Assignment 8

## Navigator.push and Navigator.pushReplacement
The Navigator uses the concept of the data structure stack. In Flutter, when we navigate to another screen, we use the push methods and the navigator widget adds the new screen on top of the stack. Naturally, the pop methods would remove that screen from the stack. The push replacement however, replaces the current route of the navigator by pushing th e fiven route and then disposing the previous route once the new route has finished animating in. Making the user unable to go back to the previous page.

## Widgets
Container -> Creates a rectangular visual element which can have margins, padding, constraint, and can be decoratd with a BoxDecoration such as a bckground, a border, or a shadow

Row, Column -> Create flexible layouts in both the horizontal (Row) and vertical (Column) directions. The design of these objects is based on the web’s flexbox layout model.

Text -> Creates a run of styled text

AppBar -> Consists of a toolbar and potentially other widgets

Drawer -> A Material Design panel that slides in horizontally from the edge of a Scaffold to show navigation links in an application.

Scaffold -> Implements the basic Material Design visual layout structure. This class provides APIs for showing drawers, snack bars, and bottom sheets.

Padding -> Widget that insets its child by the given padding.

Form -> Container for grouping together multiple form field widgets.

Center -> Centers the child within itself.

TextFormField -> Widget that wraps a TextField widget in a FormField.

Card -> Widget with bland space or panel with round corners and a slight elevation on the lower side. It comes with many properties like color, shape, shadow color, etc which lets developers customize.

SingleChildScrollView -> A box in which a single widget can be scrolled.

ListTile -> A list tile contains one to three lines of text optionally flanked by icons or other widgets, such as check boxes. The icons (or other widgets) for the tile are defined with the leading and trailing parameters.

Icon -> A graphical icon widget drawn with a glyph from a font described in an IconData such as material's predefined IconDatas in Icons.

Navigator -> A widget that manages a set of child widgets with a stack discipline.

DropDownButton -> A Material Design button for selecting from a list of items.

FloatingActionButton -> A circular icon button that hovers over content to promote a primary action in the application.

## Events in Flutter

There are a lot of events that exists in flutter. Some of them are PointerDownEvent, PointerMoveEvent, PointerUpEvent, PointerCancelEvent. Gestures can also dispatch multiple events, such as onTap, onTapDown, onTapUp, onHover, onFocusChange, onDoubleTap, onPressed, onLongPress, onHover, onVerticalDragStart, onHorizontalDragStart, onPanStart, and many more.

Some of the funtionalities include:

OnPressed -> Called when a button is tapped or otherwise activated.

onHover -> Called when a pointer enters or exit the button response area.

onLongPress -> Called when a button is long-pressed.

onFocusChange -> Handler called when the focus changes.

## Navigator Switching Pages

The Navigator uses the stack data structure. To switch to a new route, use the Navigator.push() method. The push() method adds a Route to the stack of routes managed by the Navigator. Where does the Route come from? You can create your own, or use a MaterialPageRoute, which is useful because it transitions to the new route using a platform-specific animation. To close the second route and return to the first, you can use the pop() method which removes the current Route from the stack of routes managed by the Navigator.

To navigate to pages without pushing and popping from the stack, you can use the PageView to achieve it.

## Implementation

<img width="98" alt="image" src="https://user-images.githubusercontent.com/112454126/202335513-87fd7bde-a695-46e4-93c2-1fc3413cceee.png">

Created two more dart files for form and data display.

<img width="257" alt="image" src="https://user-images.githubusercontent.com/112454126/202335652-c45ece9a-bff7-4edd-b45e-4bd9072c0cb6.png">

Added a drawer in the three files for navigation.

<img width="271" alt="image" src="https://user-images.githubusercontent.com/112454126/202335745-e1c60245-617a-4502-a511-c0c1de149b84.png">

<img width="269" alt="image" src="https://user-images.githubusercontent.com/112454126/202335776-0d264129-f16d-42c1-b08d-bcd3dfc6d283.png">

<img width="271" alt="image" src="https://user-images.githubusercontent.com/112454126/202335796-a55337d4-9ed1-4a78-a0d8-3518dfd80dd2.png">

<img width="270" alt="image" src="https://user-images.githubusercontent.com/112454126/202335826-06f5709a-8698-4a8b-9353-1295b7487d04.png">

<img width="284" alt="image" src="https://user-images.githubusercontent.com/112454126/202335851-f67e5e91-912b-4bed-b9bd-ae6d65763f08.png">

<img width="271" alt="image" src="https://user-images.githubusercontent.com/112454126/202335875-4736083e-a3d5-4ad3-8ed5-36ea20f7461b.png">

<img width="293" alt="image" src="https://user-images.githubusercontent.com/112454126/202335897-889411f6-b574-415e-91b1-0033d472fca0.png">

Created a form in the budget_form dart file consisting of inputs for the Title, Amount, Type, Date picker and a save button.

<img width="254" alt="image" src="https://user-images.githubusercontent.com/112454126/202336088-a37f5daf-c3fb-4f89-8e97-2ae4008db3b4.png">

<img width="146" alt="image" src="https://user-images.githubusercontent.com/112454126/202336197-953e801c-c6d2-4fda-9221-71d0ce4eade1.png">

When saved, the data will be put in a list, which will be added to another list created by the class Data

<img width="288" alt="image" src="https://user-images.githubusercontent.com/112454126/202336475-175bcd0c-fe8a-4538-b28f-d75474b0fe24.png">

<img width="284" alt="image" src="https://user-images.githubusercontent.com/112454126/202336520-6ab669b3-400c-423f-b408-a9f860712eb4.png">

<img width="270" alt="image" src="https://user-images.githubusercontent.com/112454126/202336585-3b382a02-f56e-416b-80a3-13c04922ca2b.png">

<img width="286" alt="image" src="https://user-images.githubusercontent.com/112454126/202336617-5a163c3b-b067-4f02-9907-60f7ad419618.png">

In the budget data dart file, created cards containing the information saved from the budget form dart file by iterating through the list from the Data class in the budget form dart file.

# Assignment 9

## Retrieving JSON data
It is possible to retrieve JSON data without making a model first. Using the jsonDecode() function, you can decode the JSON dta with the JSON string as the method argument. IT returns a Map<String, dynamic> meaning that the value types are unknown until runtime. You lose most of the statically typed language features: type safety, autocompletion and most importantly, compile-time exceptions. Your code will become instantly more error-prone.

## Widgets
Container -> Creates a rectangular visual element which can have margins, padding, constraint, and can be decoratd with a BoxDecoration such as a bckground, a border, or a shadow

Row, Column -> Create flexible layouts in both the horizontal (Row) and vertical (Column) directions. The design of these objects is based on the web’s flexbox layout model.

Text -> Creates a run of styled text

AppBar -> Consists of a toolbar and potentially other widgets

Drawer -> A Material Design panel that slides in horizontally from the edge of a Scaffold to show navigation links in an application.

Scaffold -> Implements the basic Material Design visual layout structure. This class provides APIs for showing drawers, snack bars, and bottom sheets.

Padding -> Widget that insets its child by the given padding.

Card -> Widget with bland space or panel with round corners and a slight elevation on the lower side. It comes with many properties like color, shape, shadow color, etc which lets developers customize.

ListTile -> A list tile contains one to three lines of text optionally flanked by icons or other widgets, such as check boxes. The icons (or other widgets) for the tile are defined with the leading and trailing parameters.

FloatingActionButton -> A circular icon button that hovers over content to promote a primary action in the application.

ElevatedButton -> An elevated button is a label child displayed on a Material widget whose Material.elevation increases when the button is pressed.

TextSpan -> An immutable span of text that has a style property to give style to the text. It is also having children property to add more text to this widget and give style to the children.

RichText -> The RichText widget displays text that uses multiple different styles. The text to display is described using a tree of TextSpan objects, each of which has an associated style that is used for that subtree.

Wrap -> A widget that displays its children in multiple horizontal or vertical runs.

FutureBuilder -> Widget that builds itself based on the latest snapshot of interaction with a Future.

ListView.builder -> Takes an IndexedWidgetBuilder, which builds the children on demand. This constructor is appropriate for list views with a large (or infinite) number of children because the builder is called only for those children that are actually visible.

## JSON to FLutter Data Retrieving Mechanism
Firstly, we need to create a model for the JSON data which can be obtained from several websites such as Quicktype, and add it to a dart file. Next we need to add the http package to perform the HTTP request. Run the command 'flutter pub add http'  on the project terminal to add it and add '<uses-permission android:name="android.permission.INTERNET" />' after the applicaiton tag in the ANdroidManifest.xml to alow for internet access.

In the page you want to retrieve the data, import the http package, dart:convert, and the model dart file. Create a stateful widget ,and get the JSON data using th eFUture widget and http.get using the url containing the data. Convert the data using the fromJson method of the model class and add it to a list.

To display the data, use the FutureBuilder function with the future being the function fething the data and for the builder, create the data representation using ListView.builder.

## Implementation


