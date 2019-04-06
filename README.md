# flutter_floating_menu
[![Download](https://img.shields.io/badge/flutter_floating_menu-0.0.1-blue.svg)](https://pub.dartlang.org/packages/flutter_floating_menu)

A new Flutter package which helps developers in creating Floating Menu.

## Getting Started

<img src="https://github.com/UttamPanchasara/Flutter-Floating-Menu/blob/master/gif/floating_menu.gif" height="400" alt="Screenshot"/> 

## Usage

[Example](https://github.com/UttamPanchasara/FloatingMenu)

To use this package :

* add the dependency to your [pubspec.yaml](https://github.com/iampawan/Flutter-Walkthrough/blob/master/pubspec.yaml) file.

```yaml
  dependencies:
    flutter:
      sdk: flutter
    flutter_floating_menu: ^0.0.1
```

## Quick Start:
In order to use Floating Menu Widget in your Application you will have to **Put this widget inside the Stack Widget** as below.

```dart

    Stack(
        children: <Widget>[
          //Other widgets,
          FloatingMenu(
            menuList: floatMenuList,
            callback: this,
            btnBackgroundColor: Colors.black,
            preMenuIcon: Icons.add,
            postMenuIcon: Icons.clear,
          ),
        ],
      )
      
```

## Example - How to use:

```dart

class _FloatingMenuExampleState extends State<FloatingMenuExample>
    implements FloatingMenuCallback {
  String centerText = "Home";

  @override
  Widget build(BuildContext context) {
  
    // here we have a list of Floating menu items
    final List<FloatingMenuItem> floatMenuList = [
      FloatingMenuItem(id: 1, icon: Icons.favorite, backgroundColor: Colors.deepOrangeAccent),
      FloatingMenuItem(id: 2, icon: Icons.map, backgroundColor: Colors.brown),
      FloatingMenuItem(id: 3, icon: Icons.email, backgroundColor: Colors.indigo),
      FloatingMenuItem(id: 4, icon: Icons.event, backgroundColor: Colors.pink),
      FloatingMenuItem(id: 5, icon: Icons.print, backgroundColor: Colors.green),
      FloatingMenuItem(id: 6, icon: Icons.home, backgroundColor: Colors.deepPurple),
    ];

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // add FloatingMenu Widget inside the Stack widget
      body: Stack(
        children: <Widget>[
          Center(
            child: Text(
              centerText,
              style: TextStyle(color: Colors.black),
            ),
          ),
          FloatingMenu(
            menuList: floatMenuList,
            callback: this,
            btnBackgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }

  @override
  void onMenuClick(FloatingMenuItem floatingMenuItem) {
    
    // callback listener, Perform your operations here
    
    print("onMenuClicked : " + floatingMenuItem.id.toString());
    switch (floatingMenuItem.id) {
      case 1:
        {
          centerText = "Favorite";
        }
        break;
      case 2:
        {
          centerText = "Map";
        }
        break;
      case 3:
        {
          centerText = "Email";
        }
        break;
      case 4:
        {
          centerText = "Event";
        }
        break;
      case 5:
        {
          centerText = "Print";
        }
        break;
      case 6:
        {
          centerText = "Home";
        }
        break;
    }

    setState(() {});
  }
}

```

## Questions?
 
 **Ping-Me on :**  [![Twitter](https://img.shields.io/badge/Twitter-%40UTM__Panchasara-blue.svg)](https://twitter.com/UTM_Panchasara)
[![Facebook](https://img.shields.io/badge/Facebook-Uttam%20Panchasara-blue.svg)](https://www.facebook.com/UttamPanchasara94)

 
 <a href="https://stackoverflow.com/users/5719935/uttam-panchasara">
<img src="https://stackoverflow.com/users/flair/5719935.png" width="208" height="58" alt="profile for Uttam Panchasara at Stack Overflow, Q&amp;A for professional and enthusiast programmers" title="profile for Uttam Panchasara at Stack Overflow, Q&amp;A for professional and enthusiast programmers">
</a>


## Donate
> If you found this package helpful or you learned something from the source code and want to thank me, consider buying me a cup of :coffee:
- Google Pay **(panchasarauttam@okaxis)**


## License

```
   Copyright 2019 Uttam Panchasara

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
```
