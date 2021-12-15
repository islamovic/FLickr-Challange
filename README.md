# FLickr-Challange

## Project Setup

1. Clone the project from this link `git@github.com:islamovic/FLickr-Challange.git`
2. run 'pod install' to install `Alamofire` and `KingFisher` pods
3. Open `Flickr.xcworkspace` then Build and Run the project. 

## Project Architecture 

I'm Using VIP Clean Code, you can read more about it from <a href="https://hackernoon.com/introducing-clean-swift-architecture-vip-770a639ad7bf" target="_blank">Here</a>

## Project Component

### Modules
- Is a Set of Scene, And Every Scene is a stand alone ViewController.
- Every Scene Has it's own `Interactor` Here is you can write all the business Logic.
- Every Scene Has it's own `Presenter` Here is you can write all the view Logic.

### Core
- Is a set of static Constants that application could use like `Base Url`, and `API Key`.

### Managers
- Is a set of Manager that could Handle or proccessed set of opertaion once. 
- We we have here is the `AppLibManager` this used to set the base url at the beginning of the application.

### Utils
- Has some functionalities not related to any logic on the application but can be used more than omce. for example here we have 2 extensions for `UITableView` and `UICollectionView` that handle registering and deque the cells.

### Networking
- Has all the network layer for the app to use.
Note: I know it's a bit complicated and over engineered and not related to the application size. BUT I did this before and this is the first time to try this in an application and this is an apportunity to work with modular component as you requsted this should be as like as a real application.

- To Implement API, you should create a `Requested Data` that return a dictionary. And `Resposne Data` that manage how to map your response. And a `Router` to create the request. And implment the `API service` it self to call the endpoint.
- You can use the use case that could related to API (find it `Domain` module).

### Domain
It has `Models` and `Use Cases`.
##

## Screenshots
<table>
  <tr>
     <td>Empty feed</td>
     <td>Search Screen with empty history</td>
     <td>Load feed with lazy loading after search</td>
     <td>Complete Feed With finiste scrolling</td>
     <td>Search History</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/1983631/146253979-83527416-24e7-41f2-8901-f4bcc2485bd9.png" width=270 height=480></td>
    <td><img src="https://user-images.githubusercontent.com/1983631/146253977-1af770f4-7ce0-473c-a36f-a5425296f1c4.png" width=270 height=480></td>
    <td><img src="https://user-images.githubusercontent.com/1983631/146253975-a3f7fe82-48c0-4fdd-82e4-5f63b98b5046.png" width=270 height=480></td>
    <td><img src="https://user-images.githubusercontent.com/1983631/146253958-dc3be94f-247b-4b7f-a4ff-afe2341a51f3.png" width=270 height=480></td>
    <td><img src="https://user-images.githubusercontent.com/1983631/146253953-ec89d6ae-3376-4f8a-8e73-d966b21286ea.png" width=270 height=480></td>
  </tr>
 </table>
 
 ##

## Test Cases
It could a lot better But The time with short as I did had some release at work :).
But here is what I did so far.

- [x] testFetchPhotosListAndPassToPresenter.
- [x] testSaveHistory.
- [x] testDeleteHistory
- [x] testClearAllHistory
