# Mobile Applications for Public Health ThyroHealthiii
-------
## Project
This app is part of a course work project at the University of Applied Sciences Berlin. The project started in the context of mobile applications for public health. The goal was to make an app for mobile devices, using the flutter framework, that serves as a prototype to help people with a thyroid gland disease. The app offers customizable diary functions and a statistical analysis of the user supplied data. 

## Docs
- View docs
- view docs in the doc/api folder. Open the index.html in your browser.
- generate docs (https://github.com/dart-lang/dartdoc)
```
   $ pub global activate dartdoc
   $ dartdoc
```
## Getting Started
- install packages
```
   pub flutter get
```
- run application
```
   flutter run
```
## Additionally Planned Features
- extended statistical Analysis for partial correlations
- adding multiple Events to one diary entry without having to reselect the diary entry in the overview
- improved UX / UI

## Build with
- Dart v2.10.4
- Flutter 1.22.4
- Bloc/Cubit-Pattern
----------------------------------------------

# ThyroHealthiii User Guide
This user manual describes the user guidance through the app and suggests possible use. 
You will get useful information on the individual functionalities of fields and buttons. 
The purpose of this manual is to answer any questions you may have and to introduce you to the range of functions.


Collaborators:
 - Rico Stucke [rico-stucke](https://github.com/rico-stucke)
 - Florian Thom [FlorianTh2](https://github.com/FlorianTh2)
 - Jennifer Vormann [FrauMauz](https://github.com/fraumauz)


## What is this App for
When should you use this App and what is it for?
- if you have a Thyroid disease AND
- if you feel:
   - restless
   - restive
   - sleep badly
   - have no drive
   - tired
   - limp
   - irritated
   
or if you have a Thyroid disease and you:
   - have a weight problem
   - just not gaining weight
   
Your ThyroidHelpiii helps you to track your daily 
   - activities
   - sleep duration and quality
   - mood and symptoms
   - food 
   ...
 
and to visualize you possible coherences between those events. 
You get an overview over your events/entries and you are able to review them even months ago.
Also you can add new categories and entry types yourself to customize you App personally for you.

ATTENTION: Please be sure that you go to a doctor. This app does not replace a doctor's visit. 
In the case of thyroid diseases, always talk to your doctor and keep the preventive appointments.

## Getting Started
Download the App via your App/Play store. When you first start the app you will see a start screen. This disappears when clicking somewhere on the screen and you are directed to the home screen. The start screen only appears the very first time you start the app. At future starts you will see the home screen directly.

## Home screen
Now you landed on the home screen (little house icon). Welcome to your new App.
On this screnn you can see all your today´s events. In the top bar you see the current date like this:<br>
    < 12.01.2021 >

To change the day you want to have a look at you can click on the arrows on the right and left side of that date.<br>
    < backward<br>
    > forward<br>

The selected screen icon will aleays be white - the others grey. This way you alwys know where you are right now.
To really see all events the home screen is scollable.

## Statistics screen
When you click on the 3 III on the Buttom Bar you land on the Statistics screen. 
On the checkboxes on the top you can choose the graphs you want to have displayed. 

Beloy you see the Chart diyplayed.

The x-axis gives you the day and the y-axis the intensity of the EntryEvent. Soon there will be an extra feature available that allows you to see correlations directly displayed in this screen. 

For now you can see the data von the last 7 days, but the axis allows you to extend this to one month.

## Add (+) screen
On this screen you can add new events/entries to your dairy.
First you have to scoose a category:
   - Sport
   - Food (and Drinks)
   - Mood
   - Symptoms
   - Sleep

Soon you will be able to add extra categories to your Add Screen, to also track your medicine or what ever you need to be tracked. 
After clicking on the Category you can choose a sub-category f.e. after 'Sport' you are able to say what kind of sport you want to add to your Dairy - f.e. Jogging.

Then you will access the 'Add Event Screen' - where you by the way still see the current date in the top bar. 
Here you can:
- write a diary comment
- Specify the quantity you want to add (f.e. 500 (g - this you add later in the unit))
- Choose a unit from the dropdown (f.e. minutes, hours, g, km, ... or when it comes to mood the unit is named 'mood')

When you finished your entry, check it again and click the 'Save and finish' button and the buttom of your entry sheet.
Sfer finishing you will be redirected back to your home screen (you remember - the tiny house icon)

## Calender screen
The calender icon on the buttom bar - right next to the Add (+) button - guides you to a calender view of the current where you can directly choose and click an specific day you want to get displayed. You also have the option to see your moods for a whole month in this calender. Via the arrows you can switch to another month. You can also change the duration easily from a monthly vie to a 2 weeks or 1 week view. It should look like this in your top bar:<br>
< January     2 weeks > <br>

The day today has a light orange color and the one you selected has a deep orange color. Is you see just one orange bubble around a day - today is the selected day :)

Another really nice feature: in your calender you have a direct overview about the days you made an entry already and the ones you didn´t. how? Can you see the small black dots under some of the dates? These are the entries you made that day. 

You can also add another entry with cklicking first on a date and then on the + button (Add). You will see the selected day in the top bar of your adding screen.

## More (...) screen
When you click on the three dots on the buttom bar you will be guided to the 'More' screen. 

You see the options you have like:
- Adding a new Event-category
- Adding a Marker
- About (for informations)
- Legal Information 

These featurs will be soon available for you!! We keep you updated. 


<3<3<3<3<3<3<3<3<3<3 We hope you have fun using your brand new Thyro Healthiii App <3<3<3<3<3<3<3<3<3<3




