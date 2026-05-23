import "dart:io";

/// This is the item class, it takes in
/// name and price of the item. 
class Item {
	String? name;
	double? price;

	Item(this.name, this.price);
}

/// Creates the store inventory based on the itemsToCreate map.
/// Returns a map of item ID and the Item object. 
Map<int, Item> createStoreInventory() {
	// Items to put into the map.
	Map<String, double> itemsToCreate = {
		"Apple": 1.50,
		"Banana": 1.00,
		"Meat Pie": 4.50
	};

	Map<int, Item> returnableMap = {};

	// Loop over every item, create an item object,
	// and then add it to returnableMap as an item.
	int i = 0;
	for (var entry in itemsToCreate.entries) {
		i++;
		Item item_to_add = Item(entry.key, entry.value);
		returnableMap[i] = item_to_add;
	}

	return returnableMap;
}

/// Tries to obtain what exact item the user wants
int getUserInput(int amountOfItems) {
	// Gets user input and puts it in a nullable variable
	while (true) {
		print('');
		stdout.write("Enter the number of the item you want to buy: ");
		String userInput = stdin.readLineSync() ?? "";
		
		// When Dart tries to convert an input that is null or a string,
		// throw an error and say that is invalid input.
		try {
			int selection = int.parse(userInput);

			// Add 1 to amountOfItems because we add 1 extra option to the list
			// of items which is "Checkout & Exit"
			if (selection > amountOfItems + 1 || selection < 1) {
				throw RangeError("Selection is outside of range.");
			}
			return selection;
		} on RangeError { 
			print("Please select a number between 1 to $amountOfItems");
		} on FormatException {
			print("Invalid selection.\nPlease select a number between 1 to $amountOfItems");
		} catch (e) {
			print("An error occurred: $e");
		}
	}
	
}

/// Tries to obtain how many of that item the user wants.
int getAmount() {
	while (true) {
		stdout.write("How many would you like? ");
		
		// Step 1: Read input      ->  stdin.readLineSync()  ->  Could be "42", "banana", or null
		// Step 2: Handle null     ->  ?? ''                 ->  Ensures we have a String ("42", "banana", or "")
		// Step 3: Attempt parse   ->  int.tryParse(...)     ->  Returns 42 (for "42") or null (for "banana"/"")
		// Step 4: Final fallback  ->  ?? 0                  ->  If Step 3 returned null, it becomes 0
		int suggestedAmount = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

		if (suggestedAmount < 1) {
			print("Please enter an amount of 1 or above.");
		} else {
			return suggestedAmount;
		}
	}
}

void printReceipt(List<Item> purchasedItems) {
	print(purchasedItems);
}

void main() {
	print("=== Welcome to the Dart Truckshop ===");

	// Create store inventory, the list of purchased items, 
	// and the amount of purchasable items.
	Map<int, Item> storeInventory = createStoreInventory();
	List<Item> purchasedItems = [];
	int amountOfItems = storeInventory.length;

	bool userIsShopping = true;
	while (userIsShopping) {
		print('');

		// Get the amount of items.
		int userSelection = getUserInput(amountOfItems);
		
		// If the user selected "Checkout & Exit"
		if (userSelection == amountOfItems + 1) {
			userIsShopping = false;
			continue;
		}

		// Get the user selected item, and then add it to the list of 
		// purchased items. 
		Item? userSelectedItem = storeInventory[userSelection];
		
		if (userSelectedItem != null) {
			print("Selection does not exist in inventory.");
			continue;
		}
		
		
		
	}
}