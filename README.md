# Self Assessment 1
Self assessment section 1 for the INFO1111 advanced assignment. 

# Task description: The Handy Inventory Manager

This is a small, manageable command-line challenge designed to test core Dart concepts in a single file. 

## The Challenge
Build a mini command-line application that lets a user manage a small shop inventory (like a fruit stall or a tuckshop), calculate totals, and print a receipt.

### What the App Needs to Do
1. Hold a pre-defined collection of items and their prices.
2. Ask the user what they want to buy and how many.
3. Calculate the total cost, applying a small discount if they buy multiple items.
4. Print out a neat receipt.

---

## Technical Requirements Checked

To successfully complete this task, your code must implement the following Dart features:

* **Object-Oriented Programming (OOP):** Create an `Item` class with properties for `name` and `price`.
* **Maps:** Use a `Map<int, Item>` to store the shop's inventory, where the *key* is an item ID and the *value* is the `Item` object.
* **Lists:** Maintain a `List<Item>` (or a shopping cart list) to track what the user has chosen to buy.
* **User Input:** Use `stdin.readLineSync()` from the `dart:io` library to ask the user for the item ID and the quantity.
* **Type Conversion:** Convert the user's string inputs into `int` values using `int.parse()` or `int.tryParse()`.
* **Loops:** Use a `while` loop to keep the shop open until the user chooses to exit/checkout, and a `for` loop to iterate through the cart to print the receipt.
* **Functions:** Write at least one separate function, such as `calculateTotal(List<Item> cart)`, to handle the math and return the final price.

---

## Expected Workflow Example

When you run your program, it should look something like this in the terminal:

```text
=== Welcome to the Dart Tuckshop ===
1. Apple - $1.50
2. Banana - $1.00
3. Meat Pie - $4.50
4. Checkout & Exit

Enter the number of the item you want to buy: 1
How many would you like? 3
Added 3x Apple to your cart.

Enter the number of the item you want to buy: 4

=== Your Receipt ===
* Apple ($1.50)
* Apple ($1.50)
* Apple ($1.50)
-------------------
Subtotal: $4.50
Total after 10% discount: $4.05
Thank you for shopping with us!