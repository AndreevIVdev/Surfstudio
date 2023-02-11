# Surfstudio internship test task

Hi! In this repo you can find my solution of [Surfstudio internship test task](https://github.com/surfstudio/Surf-iOS-Developers/blob/master/Docs/Hiring/students-test-project.md).

<div align="center">
  <img src="https://github.com/AndreevIVdev/Surfstudio/blob/main/Surfstudio%20Lab/Surfstudio%20Lab/Assets.xcassets/Group.imageset/Group.png" width="900" height="900"/>
</div>

## Description

Application shows request-apply screen for internship program. User can get more detail information by dragging modal window up.

## UIFramework

The code is written on Swift, UI is based on UIKIt, without using storyboards, layout is constructed on NSLayoutConstraints.

## Implementation

The only one ViewController is called "RequestViewController", it contains several views.
The most interesting one is modalView. This is UIView with panGestureRecognizer. It contains contentView with two horizontal collection views. They have the same cells, but different layouts. Both of them use UICollectionViewFlowLayout.

The first collection view has infinite carousel effect, wich one was achieved by implementing scrollViewDidScroll function from UIScrollViewDelegate protocol, and manual change of the datasource and scrollView offset.

The second collection view uses custom implementation of UICollectionViewFlowLayout, which is called HorizontalTwoRowsWaterFlowLayout. 

## Conclusion

Project does not use any side code, or 3pl dependencies. Some mutually exclusive task requirements are skipped.
The codebase is verified with Swiftlint, using the Raywenderlinch style guide. 


## Screenshots

### Iphone 14 Pro Max:

![alt text](https://github.com/AndreevIVdev/Surfstudio/blob/main/Surfstudio%20Lab/Resources/iPhone%2014%20Pro%20Max.gif) 

### Iphone SE 3:

![alt text](https://github.com/AndreevIVdev/Surfstudio/blob/main/Surfstudio%20Lab/Resources/iPhone%20SE3%20.gif)
