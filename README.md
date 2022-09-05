# Checkout.com - Mobile iOS Developer Test

[![develop](https://github.com/krishanp-1986/Checkout3DSecurePayment/actions/workflows/develop.yml/badge.svg)](https://github.com/krishanp-1986/Checkout3DSecurePayment/actions/workflows/develop.yml)

This project is the outcome of Checkout.com developer Test. Tasks is to implement build a mobile app that does 3D Secure payments.
<br>
<br>
<p align="center">
<img src = "README Files/paymentform.png" height = 300 width="150">
<img src = "README Files/paymentformerror.png" height = 300 width="150">
<img src = "README Files/webredirect.png" height = 300 width="150">
<img src = "README Files/success.png" height = 300 width="150">
<img src = "README Files/failure.png" height = 300 width="150">
</p>

### Technical Description
Since this app is medium size, i have decided to implement using **MVVM**, and **Coordinator** pattern to decouple the navigation from view controller. No third party libraries have been used except **SnapKit** and **SwiftLint**.

Light version of Mobile Design System is used to showcase the knowledge in creating Design system.

Also CI/CD pipeline is setup with the help github Actions and fastlane.
<br>
<br>
<img src = "README Files/actions.png">



### Testing
Unit Tests are part of this assignment, and implemented using  [**Nimble/Quick**](https://github.com/Quick/Nimble), matcher framework for BDD. Around 70% of the cods have been covered using unit tests.
<br>
<br>
<img src = "README Files/testcoverage.png">

### Instructions
- Clone this develop branch.
- Run **pod install** to install all the dependencies.

###  Improvements
- Implement UITests and Snapshot testing.
- Implement Mock configuration to run app offline.
- Use babelish and SwiftGen to localize strings.
- Improve code coverage
