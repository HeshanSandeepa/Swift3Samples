//: Playground - noun: a place where people can play

//TUPLES


//tuple
var products = ("Nokia", "C9", 50000)
products.0
products.2

//named tuple
var productsNamed = (brand: "Nokia", model: "C9", price: 50000)
productsNamed.brand
productsNamed.price

//return and access tuple
func getProducts() -> (brand: String, model: String, price: Double) {
    let brand = "Samsung"
    let model = "Galaxy"
    let price = 75000.00
    
    return (brand, model, price)
}

var myProducts = getProducts()
myProducts.brand

var myProductArray = [myProducts, myProducts, myProducts]
for (brand, model, price) in myProductArray {
    print("Product brand " + brand)
}


