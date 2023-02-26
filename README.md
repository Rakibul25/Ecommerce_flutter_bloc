#Ecommerce Search page with Flutter BLoC
# Introduction
This project offers users the ability to easily search for products within an ecommerce application. Additionally, users can view detailed information about products they are interested in. If a user wishes to purchase a product, they can easily add it to their cart using the provided feature.
# Feature List
- Search Product
- Add to cart

# Technology & Tools used in this project
- Flutter
- BLoC
- Stream
- REST API


# Developed by
[Rakibul Islam](https://github.com/Rakibul25)

# Documentation

### Initial Page

- The initial state of the application, the user will be asked to search for a product. They can easily do so by entering a search query using the provided search bar.
<img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/initial.jpg" width="330" height="660">

### Not Found Anything

- If no products matching the user's search query, this page will be displayed informing the user that no results were found. The user can then modify their search query or browse other products available on the website.
<img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/nothingsimilar.jpg" width="330" height="660">

### Found Product
 
- If there are products that match the user's search query, they will be displayed on the screen for the user to view. The user can then browse through the available products and select the one they are interested in.
<img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/nobottom.jpg" width="330" height="660">

### About Next and Previous Button

- In cases where there are a large number of products that match the user's search query, the application will initially load ten products and display a 'Next Page' button. Once the user presses the 'Next Page' button, the next ten products will be loaded and displayed on the screen. If there are still more products to be loaded, the application will display both 'Next' and 'Previous' buttons, allowing the user to navigate between different pages of products. Finally, if there are no additional products to load, the application will only display the 'Previous' button, allowing the user to navigate back to the previous page of products.
<table>
  <tr>
    <td>If Only Next Page Available</td>
     <td>If Both Page Available</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/nextpage.jpg" width="330" height="660"></td>
    <td><img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/nextprevboth.jpg" width="330" height="660"></td>
  </tr>
  <tr>
     <td>If Only Previous Page Available</td>
    <td>If Less Than Ten Product Available</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/prev.jpg" width="330" height="660"></td>
    <td><img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/lessthanten.jpg" width="330" height="660"></td>
  </tr>
 </table>

### If Product Is Not Available On Stock

- In situations where a product is out of stock, the application will display a message indicating that the product is not available. Additionally, the application will prevent the user from adding the product to their cart, ensuring that they are unable to purchase an out-of-stock item.
<img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/notavilable.jpg" width="330" height="660">

### If Tapped On Product Without Adding In Cart

- If a user selects a product without adding it to their cart, they will be taken to the product details page where they can view additional information about the product. The product details page will also include a 'Back' button, which will allow the user to navigate back to the search page and continue browsing for other products.
<img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/productviewdetails.jpg" width="330" height="660">

### Adding Product to Cart on Pressing 'Add' Button
 
- Once a user has added a product to their cart, a new button will be displayed allowing them to add additional items to their cart. Additionally, a 'Remove' button will be displayed next to the add button, allowing the user to remove the item from their cart if they wish. This feature allows the user to easily manage the contents of their cart and make changes as needed.
<table>
  <tr>
    <td>Add More</td>
     <td>Remove</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/increment.jpg" width="330" height="660"></td>
    <td><img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/productdwithcart.jpg" width="330" height="660"></td>
  </tr>
 </table>

### If Tapped On Product After Adding In Cart
 
- If a user has added a product to their cart and then selects that product again, they will be taken to the product details page with an added view of their cart. From this page, the user can finalize their decision. The page will include the 'Add More' and 'Remove' buttons to allow the user to make changes to their cart as needed.
<table>
  <tr>
    <td>Add More</td>
     <td>Remove</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/productdetailwithcart.jpg" width="330" height="660"></td>
    <td><img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/productdetailincremenr.jpg" width="330" height="660"></td>
  </tr>
 </table>
 
 
  Thank You :) ☕
