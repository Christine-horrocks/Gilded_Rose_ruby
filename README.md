# Gilded Rose Tech Test

## Here is the challenge:

*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

* “Conjured” items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."*

## My Approach to the Task

* I analysed the challenge to identify all the key information relating to each item.

* I diagrammed the conditions for each item for clarification.

* I set up the project folder with spec and lib folders, as well as creating a Gemfile.

* I reviewed the existing code to identify exactly what was happening in each section of the code and matched it to the descriptions in the challenge for clarification where necessary.

* I printed out the textest_fixture output and saved it to a text file to use as a reference later.

* I added test for each of the possible out comes of the original update_quality method and any specific outliers which could have caused issues. This also helped to cement the information provided in the challenge.

* I ran the test and then reviewed how the code could be broken down in to separate method for each of the items on sale.

* I wrote a method for each of the possible items. I then went back to the tests and worked out how these additional methods would break the tests if I added them to the original method without deleting any of the functionality.

* Once I understood how each test should break in a controlled manor I introduced each of the new methods without deleting the old methods and checked that the tests failed in the way I had predicted.

* Once I had introduced all of the new methods I commented out all of the original methods to check that all the tests passed.  

* I ran the texttest_fixture to ensure that the output of my refactored code matched the original output.

* I then added the a method which gave update_quality method the ability to fulfil the requirements for the new "conjured" items.

* I then went through and refactored the new methods by adding methods to DRY up the code.

* I looked at implementing stubs and mocks into the test, but ran out of time.

* I would have also liked to have taken more time to refactor the if/else statements which are currently quite long and could be written more succinctly.

## Texttest Updated Output 
![Alt text](texttest_fixture_output_update.png?raw=true)


## Example of Use
![Alt text](running_code_irb.png?raw=true)

## Tech Stack

* Ruby
* Rspec
* Rubocop
* Simplecov
