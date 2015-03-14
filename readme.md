A Tutorial on using Financial Force Enterprise Patterns

This is work in progress, released early to validate and to make sure I do release it : ). 

Feel free to comment, raise issues, questions in an Open Collaboration way.

## Why

I decided to create the simplest example I could think of - that uses every feature on the Library.

It took almost 3 months for me to completely grasp the pattern. I was able to use the Domain and Selector Pattern right away - but writing Mockable code and using the Unit of Work took longer.

The fflibs sample apps are too complicated with many moving parts - which is necessary when you want to use the library to it's full capacity. A simple demo like this will not have allowed me to see the full potential of the library - but then again the fflibs samples don't let me follow the code easily and write my first apps.

Other than that I wrote this sample to prepare for re-writing a mayor Force.com Custom ERP.

## What

So here is a simple case made up of two objects, Invoice and Product. Invoices need to be "activated" and when they are activated ( in bulk ) the inventory amounts of the product related to the invoice are reduced.

In order to simplify the example: Invoices can only have one product. In order to complicate the example to a realistic level ( and to figure out how to do it ): Invoices can be activated in Bulk.

## How

First thing to do is read everything about Financial Force Enterprise Patterns - a library that helps write complex applications in Salesforce.

In order to Mock and test properly every component: - Selector, Domain, Service - implements a Interface. Then we have a factory t3_Application that instantiates each component. This makes it possible to mock them and do real unit testing of each component. ( In unit test's we tell the factory to instantiate mocks instead of the real classes ).

Other than that - it's super simple. `t3_Invoice_Service.activateInvoices` takes a list of Invoice__c Id's.

From there just follow the Rabbit Hole - just remember that Services, Selectors and Domain classes are instantiated using `t3_Applicacion.[FACTORY].newInstance();`


## More Info

Writting Sample Tests that make sense is not easy - what I aim to do here is show the options that we have available rather than demostrate the best selection for each case. On a production App you'll be able to choose between DML and non DML Testing.

## Todo
- Write more tests


