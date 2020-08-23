if (document.URL.match( /items/ ) && document.URL.match( /new/ ) || document.URL.match( /edit/ )){
  window.addEventListener('load', function(){
    let priceInput = document.getElementById("item-price")
    let addTaxPrice = document.getElementById("add-tax-price")
    let profitPrice = document.getElementById("profit")
    // 販売手数料10%
    const tax = 0.1;
  
    // ①価格が入力されたらイベント発火
    priceInput.addEventListener('keyup', function (){
      // ②価格の取得
      let price = priceInput.value;
  
      // ⑥価格の範囲指定での条件分岐
      if (price >= 300 && price <= 9999999 ) {
  
        // ③手数料の計算
        let fee = price * tax;
        // ④販売利益の計算
        let profit = price - fee;
  
        // ⑤計算結果をビューに表示、小数点切り捨て
        addTaxPrice.innerHTML = Math.floor(fee);
        profitPrice.innerHTML = Math.floor(profit);
    
        console.log(addTaxPrice.innerHTML)
        console.log(profitPrice.innerHTML)
  
      } else {
        addTaxPrice.innerHTML = ' ー ';
        profitPrice.innerHTML = ' ー ';
  
        console.log(addTaxPrice.innerHTML)
        console.log(profitPrice.innerHTML)
      }
  
    });
  });
}

