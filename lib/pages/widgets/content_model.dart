class UnboardingContent {
  String image = "";
  String title = "";
  String descrip = "";
  UnboardingContent(
      {required this.descrip, required this.image, required this.title});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      descrip: "Discover Fresh Products",
      image: "assets/screen1.jpeg",
      title:
          "Explore a wide range of fresh fruits, vegetables, and groceries."),
  UnboardingContent(
      descrip: "Cash on delivery ",
      image: "assets/screen2.png",
      title: "Quick Deliver you food at you Doorsteps"),
  UnboardingContent(
      descrip: "Fast Delivery",
      image: "assets/screen3.png",
      title: "Conveniently pay with cash upon delivery"),
];
List<UnboardingContent> icecreamList = [
  UnboardingContent(
      descrip: "Kwality Wall's Choco Brownie Fudge Ice Cream",
      image: "assets/icecream1.jpg",
      title: " Brownie Fudge"),
  UnboardingContent(
      descrip: "Amul Shalimar Ice Cream - Real Milk 125 ml Plastic IML Cup",
      image: "assets/icecream2.jpg",
      title: "Amul Shalimar"),
  UnboardingContent(
      descrip:
          "Amul Sugar Free Ice Cream - Vanilla, With Chocolate Sauce 125 ml Cup",
      image: "assets/icecream3.jpg",
      title: "SugarFree Ice"),
];

List<UnboardingContent> saladList = [
  UnboardingContent(
      descrip:
          "Crunchy roasted almonds and creamy avocado add amazing textural contrast to this simple salad. My zippy lemon vinaigrette ties it all together!",
      image: "assets/green-salad-1.jpg",
      title: " Green Salad"),
  UnboardingContent(
      descrip:
          "This chopped salad is so flavorful that even salad skeptics will pile their plates with seconds! The key ingredients? A punchy dressing, pepperoncini, and TWO types of cheese.",
      image: "assets/salad4.png",
      title: "Italian Salad"),
  UnboardingContent(
      descrip:
          "Juicy roasted grapes, toasted almonds, and shaved Parm give this simple salad an elevated twist",
      image: "assets/arugula-salad-1.jpg",
      title: "Lemon salad"),
];

List<UnboardingContent> burgerList = [
  UnboardingContent(
      descrip:
          "Smoky, melty pimentón cheese, crispy jamón serrano, and a savory-sweet aioli top beef patties in this towering tapas-inspired burger from Urdaneta, a popular tapas spot in Portland, Oregon.",
      image: "assets/burger1.jpg",
      title: "Urdaburger"),
  UnboardingContent(
      descrip:
          "The secret to chef Dan Kluger's super-moist turkey burgers? A quick brown sugar brine. Add a sofrito of onion, garlic, and jalapeño and top with a zingy lemon aioli and sweet barbecue sauce, and you've got a next-level turkey burger.",
      image: "assets/burger2.jpg",
      title: "Turkey Burgers"),
  UnboardingContent(
      descrip:
          "Juicy roasted grapes, toasted almonds, and shaved Parm give this simple salad an elevated twist",
      image: "assets/burger3.jpg", // Corrected image path
      title: "Arugula burger "), // Corrected title
];
