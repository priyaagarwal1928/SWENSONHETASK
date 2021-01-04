# SWENSONHETASK

This project have 4 Folder for each given Task.

Task 1 : - Add arithmetic operators (add, subtract, multiply, divide) to make the following expressions true. You can use any parentheses you’d like.
3 1 3 9 = 12

-> Solution - > ArethematicOperator -> Textfile with solutions in steps
-------------------------------------------------------------------------

************************************************************************************************************************************************************************************************************************************************************************************************************************************************

Task 2 : - Write a function/method utilizing Swift to determine whether two strings are anagrams or not (examples of anagrams: debit card/bad 
credit, punishments/nine thumps, etc.)

-> Solution - > Anagrams
------------------------

-> Run the project using any simulator where user can input 2 strings and when user click on chek results a popup will appear with result.
------------------------------------------------------------------------------------------------------------------------------------------
-> Test cases written for unit testing
--------------------------------------

************************************************************************************************************************************************************************************************************************************************************************************************************************************************


Task 3 : - Write a method in Swift to generate the nth Fibonacci number (1, 1, 2, 3, 5, 8, 13, 21, 34)

B. iterative approach
B. iterative approach

->Solution - > FibonacciSeries
------------------------------

-> Run the project using any simulator where user can input number of steps for the sequence and user clicks on check result to get the result.Two methods used (fibonacciIteration - B. iterative approach) & (fibonacciRecursion - B. iterative approach)
---------------------------------------------------------------------------------------------

************************************************************************************************************************************************************************************************************************************************************************************************************************************************


Task 4 : -  Which architecture would you use for the required task below? Why?

Solution -> 

-> Design pattern used for calling API and handling data coming from server is The Facade Design Pattern. The Facade design pattern provides a single interface to a complex subsystem. Instead of exposing the user to a set of classes and their APIs, you only expose one simple unified API.The user of the API is completely unaware of the complexity that lies beneath. This pattern is ideal when working with a large number of classes, particularly when they are complicated to use or difficult to understand. This is also useful if the classes under the facade are likely to change, as the facade class can retain the same API while things change behind the scenes.For example, if the day comes when you want to replace your backend service, you won’t have to change the code that uses your API, just the code inside your Facade.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-> Architecture used is MVVM as it was mentioned that (Consider this project as if you were developing a component within a large-scaled project) and for continious integration and development in large project its good to divide the project in modular approach so that at any point of time project is ready to add a new module.Moreover, this pattern is similar to MVC, which is perhaps why it is relatively simple to add it to an MVC codebase. All you need to do is simply add your view model classes to the existing codebase and use them to represent the data as you need it. This does minimize the role of the View Controller, which helps lift some weight off your View Controller classes. You too can avoid ‘Massive View Controller’.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

************************************************************************************************************************************************************************************************************************************************************************************************************************************************


Task 5 : -   Create a currency converter by utilizing data from the fixer.io API.

The currency converter must include a currency selector at the top to use as the base currency and display updated currency rates based on 
the selected base currency. When a user taps on a currency, a calculation view should appear with the selected currency and base currency.
Only the base currency field should be editable.

->Solution -> CurrencyConverter
-------------------------------

-> Run the project using any simulator for testing currency conversion
------------------------------------------------------------------------------------------------------------------------------------------

************************************************************************************************************************************************************************************************************************************************************************************************************************************************






