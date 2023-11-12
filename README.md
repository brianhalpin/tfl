
# TFL iOS Coding Challenge  #

A simple app that accesses the TFL REST API at https://api.tfl.gov.uk, and will return an array of the current statuses of all tube lines.

##  Configuration & build ##

The app has been built in Xcode 14.3.1 & Swift 5.8.

The app needs to be configured with the API URL. This needs to be assigned in the APICredentials.swift file, to the statusURL variable (Make sure to include https in the URL).

```Swift
enum APICredentials {
    static let statusURL = ""
}
```

##  TFL Tube Status Overview ##

### *TFL Tube Status* ###

* APIClient - Protocol and class for handling API requests.
* TubeLine - **Model** definition, complies with Decodable keys from the JSON API.
* TubeViewModel - **ViewModel** calls the network layer and then assigns the results to the view lines array.
* TubeList - **View** which displays a list of TubeRow views in each row.
* TubeRow - **View** which displays two columns, one for the tube line and the other for the tube status.
* Configured for both Dark & Light mode.


### *TFL Supporting Files* ###

Contains configuration and necessary JSON files for the app to run tests, and a Color/String extension for colours.


##  Testing ##

There are two test targets, both of which can be run through the standard test menu functions in Xcode.

1. *APIClientTests* - standard unit tests for the model and the API. Tests both the live API and the test API feeds.

2. *UITests/* - BDD tests, these are tested using the Test JSON API using **XCUIApplication** launch arguments.

### Assumptions ###

For the purposes of this demo, I have assumed that:

* The app always has network connectivity.
* All urls are valid when lowercase and percent-encoded.

## Improvements ##

* Further tasks could include a drop-down animated effect on the status row cell to show the reason for a disruption.
