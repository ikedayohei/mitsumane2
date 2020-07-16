$(function(){
  $("input,#profit").change(function(){
    var sell_price = $("#sell_price").val();
    var purchase_price= $("#purchase_price").val();

    var s= parseInt(sell_price);
    var p = parseInt(purchase_price); 

    if(!s){
      $("#profit").val("");
      return false
    };
    if(!p){
      $("#profit").val("");
      return false
    }
    $("#profit").val(s - p);
  });
  $("input,#sell_price_total").change(function(){
    var quantity = $("#quantity").val();
    var sell_price = $("#sell_price").val();

    var s = parseInt(sell_price);
    var q = parseInt(quantity); 

    if(!s){
      $("#sell_price_total").val("");
      return false
    };
    if(!q){
      $("#sell_price_total").val("");
      return false
    }
    $("#sell_price_total").val(s*q);
  });
  $("input,#profit_total").change(function(){
    var quantity = $("#quantity").val();
    var profit = $("#profit").val();

    var p = parseInt(profit);
    var q = parseInt(quantity); 

    if(!p){
      $("#profit_total").val("");
      return false
    };
    if(!q){
      $("#profit_total").val("");
      return false
    }
    $("#profit_total").val(p*q);
  });
});