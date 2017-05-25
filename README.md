[![Build Status](https://travis-ci.org/proper/JLDemo.svg?branch=master)](https://travis-ci.org/proper/JLDemo) [![codecov](https://codecov.io/gh/proper/JLDemo/branch/master/graph/badge.svg)](https://codecov.io/gh/proper/JLDemo)


# JLDemo

A demo project based on Swift 3 & Xcode 8, for iPad only.

Git-flow workflow was used to develop the app.

### Goals of the demo project
- The app should work on an iPad, in landscape and portrait mode.
- The app allows customers to see the range of dishwashers available.
- The app displays the first 20 results returned by the API.
- The app displays the title, image, price and title of the dishwasher.
 
### How to open the project
Go to the JLDemo folder.
Find a file named 'JLDemo.xcodeproj', open it.
Select an iPad simulator with version 10.0.
Press 'cmd+U' to test or 'cmd+R' to run the app on the iPad simulator.

### The plan for developing the demo app

~~ - A model will be created first. ~~
~~ - I will add the network downloading logic after. ~~
- I will use UICollectionView to display the grid. I will possibly use a 3rd party image downloader, because it will be easier and not comprise the purpose of the demo.

### TDD approach applied

I created the Product data type using the TDD approach. You will notice all of the commits around this.

I wrote a test case for creating a Product first. Then some more complex logics were created along with writing more test cases. The Product type was refactored several times to reflect the changes in test cases.
