app.service('ShoppingCartService', function() {
    var productList = [];

    var addProduct = function(newObj) {
        var duplicate = false;
        for (var i =0; i < productList.length; i++) {
            if(newObj.rentalId === productList[i].rentalId) {
                productList[i].quantity += newObj.number;
                duplicate = true;
                break;
            }
        }
        if (!duplicate) {
            newObj.quantity = newObj.number;
            productList.push(newObj);
        }
    };

    var getProducts = function(){
        return productList;
    };

    var removeProduct = function(oldObj) {
      for(var i = 0; i < productList.length; i++) {
          if(oldObj.rentalId === productList[i].rentalId) {
              productList.splice(i, i + 1);
          }
      }
    };
    var resetProductList = function() {
        productList = [];
    };
    return {
        addProduct: addProduct,
        getProducts: getProducts,
        removeProduct: removeProduct,
        resetProductList: resetProductList
    };

});