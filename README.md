master branch [![Build Status](https://travis-ci.org/proper/JLDemo.svg?branch=master)](https://travis-ci.org/proper/JLDemo) develop branch [![Build Status](https://travis-ci.org/proper/JLDemo.svg?branch=develop)](https://travis-ci.org/proper/JLDemo)

# JLDemo

A demo project based on Swift 3 & Xcode 8, for iPad only.

I used Git-flow workflow and TDD approach to develop the app. This project is to demo the quality of my code. For the sake of showing my code only, no 3rd party library was used. Even though it will make the development quicker and easier.

### Features of the demo project
- Works on iPad only, in landscape and portrait mode.
- Allows customers to see the range of dishwashers available.
- Displays the first 20 results returned by the API.
- Displays the image, title and price of the dishwasher.

### How to open and run the project
- Go to the JLDemo folder.
- Find a file named `JLDemo.xcodeproj`, open it.
- Select an iPad simulator with version 10.0+.
- Press `cmd+U` to test. You can find the test results and code coverage in `Report navigator` panel from Xcode.
- Press `cmd+R` to run the app on the iPad simulator.

### TDD approach and code coverage

I mainly created the Product data type following the TDD approach. You will notice all of the commits around this. I wrote a test case for creating a Product first. Then some more complex logics were created along with writing more test cases. The Product type was refactored several times to reflect the changes in test cases.

Other components were coded in similar way. However I did not commit every single change to reflect it.

Apart from the UI view controller code, the app has 100% code coverage.

### Notes
- I did not spend much time on the UI interaction bit. It can be handled better by adding loading screen, customised error messages etc.
- I only add in the code when absolutely necessary. The project's structure is very simple and should be easy to understand.

### Assumptions
- The app only gets the data from the server once after being launched.
- No data persistence needed.
- No caching needed.
- API token was saved into the source code in this public repository, which could be a security problem.
