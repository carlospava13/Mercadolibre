### MercadoLibre Test

------------

this is application about show categories and products. the intention from application is selection process to mercadolibre company. this application was created in **Swift** and also the interfaces was created with **UIKit** framework.

### Features

------------


- **MVP Architecture:**
When compared to the View and Controller in the MVC pattern, the View and Presenter present in the MVP pattern are fully decoupled from each other and they communicate by means of an interface. (The Presenter interact with the Views via View interface, it means that the Presenter can perform all presentation and navigation tasks without any dependency on the actual UI technology being used)

And we have sequence diagram of MVP pattern: [![](https://ducmanhphan.github.io/img/Architecture-pattern/MVP-pattern/Sequence-diagram-MVP-pattern.png)](https://ducmanhphan.github.io/img/Architecture-pattern/MVP-pattern/Sequence-diagram-MVP-pattern.png)

- **Coordinator pattern:**

The coordinator pattern is a structural design pattern for organizing flow logic between view controllers. It involves the following components:


[![](https://cdn-images-1.medium.com/max/671/1*lnFReIMZOx5zJZOU0f9JNA.png)](https://cdn-images-1.medium.com/max/671/1*lnFReIMZOx5zJZOU0f9JNA.png)



- **Test Doubles:**

Test Double is a generic term for any case where you replace a production object for testing purposes. There are various kinds of double that Gerard lists:

**Dummy** objects are passed around but never actually used. Usually they are just used to fill parameter lists.

**Stubs** provide canned answers to calls made during the test, usually not responding at all to anything outside what's programmed in for the test.

**Spies** are stubs that also record some information based on how they were called. One form of this might be an email service that records how many messages it was sent.
**Mocks** are pre-programmed with expectations which form a specification of the calls they are expected to receive. They can throw an exception if they receive a call they don't expect and are checked during verification to ensure they got all the calls they were expecting.

for more information [Test Doubles](https://martinfowler.com/bliki/TestDouble.html "Test Doubles")


### Requirements

------------
- iOS 14.0+
- Xcode 12.2+
- Swift 5.1+

### Installation

------------
first step is clone the mercadolibre repository.

```
git clone https://github.com/carlospava13/Mercadolibre.git
```

after that:
```ruby
pod install
```
