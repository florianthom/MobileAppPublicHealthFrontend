# API Documentation
Frontend-Project for Mobile-App in the area of Public Health. This project just consists of a Frontend-Project. No Backend-Project was needed.
APIs are programmed products or products consisting of machine-readable code. The API documentation is also  called 'technical documentation'. The most important aspect of technical documentation is the usability of content and form, which is also referred to as usability. Usability can be achieved through the user-centered design of content, among other things. This is the content and purpose of this file. 

Collaborators:
 - Rico Stucke [rico-stucke](https://github.com/rico-stucke)
 - Florian Thom [FlorianTh2](https://github.com/FlorianTh2)
 - Jennifer Vormann [FrauMauz](https://github.com/fraumauz)

## Getting Started
--

## Important commands
--

## TL;DR
--

## Build with
Flutter
Dart
Android Studio

## Acknowledgements
--

--------------------------------------------------

*was ist wo
*übergabe für neue MA
*genereller Aufbau 


# Structure
To make you familiar with this App, a short explanation your main and localization, to each screen, the models, the components, the database connector and so on. 

## main.dart


## app_localizations.dart

--------------------------------------------------
## Screens
All Screen have kind of the same structure. Each of them shows a screen that is visible for the users. After importing the important files and packages (internal and extermal), a class is created, which extends the StatefulWidget. Afterwards a underline-class is created that extends the State<> of the former class.  

### InitialAppInstallationScreen.dart

### Loading.dart

### AddNewEntryCategoryScreen.dart

### CalenderScreen.dart

### HomePageScreen.dart

### MoreScreen.dart

### StatisticsScreen.dart
The statistics screen is built in this file. The page itself is built in the class _StatisticsScreenState extends State <StatisticsScreen>. This procedure is identical to that of the other screens. In the container the child: NumericComboLinePointChart is added in which an object of the class NumericComboLinePointChart extends StatelessWidget is created.

Changes to the statistics can be made in this file. These changes are made in the NumericComboLinePointChart checkout.

__Animate the axis__
This could be done by changing the variable animate. This boolean is currently set to false.

__Changes to the axes of the graph__
These are carried out in the LinearSales class.
... is the x-axis
... is the y-axis 

__Change Data__
to change the data shown in the Statistic you have to make changes in the createSampleData() function 


__Change Color of graphs__
in the Return statement of the new charts.Series you can define the colors and change the addition of the axis. 

--------------------------------------------------
## Models
### DBO.dart
### Dairy.dart
### DairyEntry.dart
### EntryEvent.dart
### EntryType.dart
### Unit.dart


--------------------------------------------------
## Components
### CostumBottomFloatingButton.dart
### CustomBottomNavigationBar.dart
### HomeCategoryHeader.dart
### HomeCategoryItem.dart
### HomeCategoryList.dart
### StaticTopAppBar.dart
### TestBottomFloatingButton.dart
### TitleCardAddNewEntryCategory.dart
### TitleCardHome.dart
### TitleCardMore.dart
### TitleCardStatistics.dart
### TopAppBar.dart


--------------------------------------------------
## Database
### database_provider.dart


--------------------------------------------------
## l10n
### app_de.arb
### app_en.arb


--------------------------------------------------
## Cubit
??? ist das nötig, was passiert hier? 


--------------------------------------------------
## Test