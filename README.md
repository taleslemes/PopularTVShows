# PopularTVSeries
This application displays to the user a list of popular TV series. More details are revealed on a new screen when selecting one of them.
The application is fed with content from The Movie Database API.
The API documentation can be found here: ​https://developers.themoviedb.org/3.

## App Screenshots

   ![Alt text](https://i.imgur.com/4xmMIiA.png)
   ![Alt text](https://i.imgur.com/BWRoJgE.png)

Xcode 11.1  
Swift 5

## Architecture

### MVP(Clean Architecture)
Model-View-Presenter architectural pattern is used in this project.
In order to access the remote data a Service Layer is used.
The app navigation is handled using a Router component.

## Layout

The layout was designed using XIBs and the screens were developed to fit well on different iPhone models.

## External Dependencies
There are no external dependencies in this application.
