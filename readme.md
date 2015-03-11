A Tutorial on using Financial Force Enterprise Patterns

I decided to create the simplest case example I could think of - that uses very pattern and feature on the Library.

The reason for doing this is because it took almost 3 months for me to completely grasp the pattern. I was able to use the Domain and Selector Pattern right away - but writting Mockable code and using the Unit of Work took longer.

The reason for doing this is because the sample apps are too complicated with many moving parts - which is necessary when you want to use the library to it's full capacity. A simple demo like this will not have allowed me to see the full potential of the library - but then again the full samples don't let me follow the code easily and write my first apps.

So here is a simple case made up of two objects, Invoice and Product. Invoices need to be "activated" and when they are activated ( in bulk pattern ) the inventory amounts of the product related to the invoice are reduced.

In order to simplify the example: Invoices can only have one product. In order to complicate the example to a realistic level ( and to figure out how to do it ): Invoices can be activated in Bulk.



