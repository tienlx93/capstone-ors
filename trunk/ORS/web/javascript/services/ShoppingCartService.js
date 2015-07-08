app.service('ShoppingCartService', function() {
    var productList = [];

    var addProduct = function(newObj) {
        var duplicate = false;
        for (var i =0; i < productList.length; i++) {
            if(newObj.rentalId === productList[i].rentalId) {
                productList[i].quantity += newObj.quantity;
                duplicate = true;
                break;
            }
        }
        if (!duplicate) {
            productList.push(newObj);
        }
    };

    var getProducts = function(){
        return productList;
    };

    var removeProduct = function(oldObj) {
      for(var i = 0; i < productList.length; i++) {
          if(oldObj.rentalId = productList[i].rentalId) {
              productList.splice(i, i + 1);
          }
      }
    };
    return {
        addProduct: addProduct,
        getProducts: getProducts,
        removeProduct: removeProduct
    };

});