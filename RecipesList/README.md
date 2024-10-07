# RecipesList

* Fetch take-home question, iOS implementation by Asaf Weinberg
* Project took about 3 hours to complete

## Build Tools & Versions Used

* Xcode 15.1
* Swift Package Manager
* iOS Simulator, iPhone 15 Pro iOS 17.2

## Dependencies - Installed with Swift package manager

### OHHTTPStubs

* https://github.com/AliSoftware/OHHTTPStubs

Used in order to facilitate network request stubbing for Unit testing. There are several similar libraries
available such as Mockingjay, I chose OHHTTPStubs as I'm familiar with it from my previous job and personal projects.

## Installation Notes

Project should compile and run with no issues out of the box. Please allow Swift Package Manager to fetch
the dependency automatically upon project first launch.

## Focus Areas

For this assignment, I focused on project structure and organization:

* Utilizing SwiftUI for a compact, modern and easy to understand approach
* Separation between ContentView/Protocol/Repository, loosely coupled design
* Utilizing Swift Codable type and JSON Decoder for model level 
* Contract defined in Protocol and implemented in Protocol extension
* Network layer and related logic implemented in Repository
* Modern Swift async/await logic passed between methods and layers for data and error propagation
* Unit testing of Protocol and Repository with different cases 
* UI elements are kept basic 

## Trade-Offs

* Preferring SwiftUI to UIKit - Simplicity of SwiftUI vs more UI customization available with UIKit

## Weakest point

* Similarly to Trade-Offs, SwiftUI might be a limitation in case a highly customized UI is requested

## Unit testing

Project includes several Unit tests to verify Protocol and Repository correct functioning with different states of data 
(valid/malformed/empty)
