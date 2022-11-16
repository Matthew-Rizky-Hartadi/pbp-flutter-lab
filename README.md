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
