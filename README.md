# Culinary-Delights
<img width="333" alt="image" src="https://github.com/Tursunpulat2002/Culinary-Delights/assets/44913069/5a6fead5-bd4e-4db6-a16f-aac673e1a317">

## Description
This is a native iOS app built with SwiftUI that allows users to browse recipes using the **MealDB API**. The app fetches data from the API to display a list of meals in various categories, and provides detailed information for each meal.

<img width="356" alt="image" src="https://github.com/Tursunpulat2002/Culinary-Delights/assets/44913069/c7937a7a-c472-430a-83c5-76b9acbb1d2f">


## Features
- Browse and explore a variety of recipes from different categories, including:
  - Beef
  - Breakfast
  - Chicken
  - Dessert
  - Goat
  - Lamb
  - Miscellaneous
  - Pasta
  - Pork
  - Seafood
  - Side
  - Starter
  - Vegan
  - Vegetarian
- Sort meals alphabetically for easy navigation
- Access detailed information about each recipe, including:
  - Meal name
  - Instructions
  - Ingredients with measurements
  - Origin country


## Installation
1. Ensure you have the latest version of Xcode installed on your machine.
2. Clone this repository to your local system or download the ZIP file.
3. Open the project in Xcode.


## Usage
1. Run the project in the iOS Simulator or on a physical iOS device.
2. On the home screen, you will see various categories of meals.
3. Tap on a category card to view the meals in that category.
4. Select a meal card to open a sheet displaying the recipe details.
5. In the recipe sheet, you can find the following information:
  - Image of the meal (placeholder image, replace with actual meal image)
  - Name of the meal
  - Origin country
  - List of ingredients and their measurements
  - Step-by-step instructions for preparing the meal


## API Endpoints
The app utilizes the following endpoints from the **MealDB API**:

**All Categories Endpoint:**

- Endpoint: https://themealdb.com/api/json/v1/1/categories.php
- Fetches the list of categories

**Category Meals Endpoint:**

- Endpoint: https://themealdb.com/api/json/v1/1/filter.php?c=CATEGORY_NAME
- Fetches the list of meals in the specified category.

**Meal Details Endpoint:**

- Endpoint: https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID
- Fetches the meal details based on the provided meal ID.


## Screenshots
**Home/Categories View**

<img width="356" alt="image" src="https://github.com/Tursunpulat2002/Culinary-Delights/assets/44913069/6a678e31-7edb-4c6f-a732-125088b51d12">

**Meal View**

<img width="359" alt="image" src="https://github.com/Tursunpulat2002/Culinary-Delights/assets/44913069/e6d41a80-fbbc-434b-9f60-3a72eeec3539">

**Recipe View**

<img width="361" alt="image" src="https://github.com/Tursunpulat2002/Culinary-Delights/assets/44913069/06a6fc12-1501-41c9-9d80-9b50b024f89f">
<img width="362" alt="image" src="https://github.com/Tursunpulat2002/Culinary-Delights/assets/44913069/2215efdc-8d2e-40c6-baa1-da04b3e8cb89">


