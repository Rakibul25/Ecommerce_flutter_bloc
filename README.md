#Ecommerce Search page with Flutter BLoC
# Introduction
This project offers users the ability to easily search for products within an ecommerce application. Additionally, users can view detailed information about products they are interested in. If a user wishes to purchase a product, they can easily add it to their cart using the provided feature.
[Video Preview](https://www.linkedin.com/posts/rakibul-islam-9078b1187_flutter-flutterdeveloper-mobileappdevelopment-activity-7036768249266540544--Fs1?utm_source=share&utm_medium=member_desktop)
# Feature List
- Home Page
- Search Product
- View Details
- Add to cart

# The project's technology, tools, and techniques
- Flutter
- BLoC
- Stream
- Pagination
- REST API


# Developed by
[Rakibul Islam](https://github.com/Rakibul25)

# Documentation

### LogIn

<img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/login.jpg" width="330" height="660">

### Homepage
- Upon launching the application, users will be presented with a homepage that displays a variety of product types to choose from and products which are popular now. These product types can include categories such as rice, sugar, oil and more. The home page of this application, the user will be asked to search for a product. They can easily do so by entering a search query using the provided search bar.
<table>
  <tr>
    <td>Home Page</td>
     <td>Home Page</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/home1.jpg" width="300" height="550"></td>
    <td><img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/home2.jpg" width="300" height="550"></td>
  </tr>
 </table>

### Not Found Anything After Search

- If no products matching the user's search query, this page will be displayed informing the user that no results were found. 

<img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/nothingfound.jpg" width="330" height="660">

### Found Product
 
- If there are products that match the user's search query, they will be displayed on the screen for the user to view. The user can then browse through the available products and select the one they are interested in.
<img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/nobottom.jpg" width="330" height="660">

### Pagination

- In situations where there are numerous products matching the user's search query, the application will initially display a set of ten products. Subsequently, as the user scrolls down the page, an additional ten products will be dynamically loaded and displayed on the screen, providing the user with a continuous stream of results without having to manually navigate to another page or perform a new search query.
<table>
  <tr>
    <td>Initial</td>
     <td>After Scrolling</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/addedtocart.jpg" width="300" height="550"></td>
    <td><img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/pagination.jpg" width="300" height="550"></td>
  </tr>
 </table>

### If Product Is Not Available On Stock

- In situations where a product is out of stock, the application will display a message indicating that the product is not available. Additionally, the application will prevent the user from adding the product to their cart, ensuring that they are unable to purchase an out-of-stock item.
<img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/notavilable.jpg" width="330" height="660">

### If Tapped On Product Without Adding In Cart

- In the event that a user selects a product but does not immediately add it to their cart, they will be directed to the product details page, where they can find more detailed information about the item. Additionally, the product details page will feature a 'Back' button, enabling the user to return to the search page and resume browsing for other products.
Furthermore, the product details page will provide the user with the option to add the selected item to their cart.

<table>
  <tr>
    <td>Add To Cart</td>
     <td>Add More Or Remove</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/detailswithaddtocart.jpg" width="330" height="660"></td>
    <td><img src="https://github.com/Rakibul25/Ecommerce_flutter_bloc/blob/main/ss/productdetailincremenr.jpg" width="330" height="660"></td>
  </tr>
 </table>

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
