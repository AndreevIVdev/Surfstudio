# Surfstudio internship test task

Hi!

In this repository you may find my solution of [Surfstudio internship test task](https://github.com/surfstudio/Surf-iOS-Developers/blob/master/Docs/Hiring/students-test-project.md).

<div align="center">
  <img src="https://media.giphy.com/media/dWesBcTLavkZuG35MI/giphy.gif" width="900" height="900"/>
</div>

## Description

Application shows apply screen for internship program. User can get more detail information by dragging modal window up.

## UIFramework

The code is written on Swift, UI is based on UIKIt, without using storyboards, layout is constructed on NSLayoutConstraints.

## Implementation

Th only one ViewController is called "RequestViewController", it contains several views.
The most interesting one is modalView. This is UIView with panGestureRecognizer. It contains contentView with two horizontal collection views. They have the same cells, but diffrent layout. Both os them use UICollectionViewFlowLayout.

The first collection view has infinite carousel effect, wich one was achieved by implementing scrollViewDidScroll function from UIScrollViewDelegate protocol, and manual change of the datasource and scrollView offset.

The second collection view uses custom implementation of UICollectionViewFlowLayout, which is called HorizontalTwoRowsWaterFlowLayout. 

## Conclusion

Project does not use any side code, or 3pl dependencies. Some mutually exclusive task requirements are missed.
The codebase if verified with Swiftlint, using the Raywenderlinch style guide. 


## Screenshots

| ![alt text](https://github.com/AndreevIVdev/NASHKODIM/blob/main/TestTaskMobileUP/Screenshots%20and%20gif's/Auth.gif?raw=true) ![alt text](https://github.com/AndreevIVdev/NASHKODIM/blob/main/TestTaskMobileUP/Screenshots%20and%20gif's/Light.gif?raw=true)|
