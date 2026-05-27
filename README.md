# BibleNavigator

## Description
BibleNavigator is an app that shows a hierarchical list of Bible verses by book and chapter using UINavigationController. Written in Swift with UIKit

## Requirements
- The first level should be a list of books of the Bible (Genesis, Exodus, Leviticus, etc)
- The second should be chapters in that book (Genesis 1, Genesis 2)
- The third should be the verses (Genesis 1:1, Genesis 1:2)
- Tapping a row in the first screen should push to the second screen
- Tapping a row in the second should push to the third
- Tapping the third should open the Olive Tree app if installed and navigate to the selected verse using a url like olivetree://bible/1.2.3 for Genesis 2:3. 
- The end result should look a lot like the List view of the verse chooser in the Olive Tree app.
- The text size of the labels in the table view cells should follow the system font size setting via Dynamic Type, and it should support the system Light and Dark modes.

 
## Resources
Verse data is available at https://ot-s3-tom-hamming.s3.amazonaws.com/BibleJson.json. The top-level keys are book numbers (Genesis is 1, Exodus is 2, etc). Each book object has a title and a mapping of chapter numbers to the number of verses in that chapter. The app should download and parse this file at startup. The book and chapter number keys aren't in order, so you'll have to sort them at runtime. Don't bundle it as a resource file - the goal is to learn to use the networking APIs. Show some kind of activity indicator while the file is downloading at startup, and test it with a slow network connection.


*Major APIs to use:*

UICollectionView

UINavigationController

NSURLSession

NSJSONSerialization (or other Swift tools for parsing json)

