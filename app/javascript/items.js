if (document.URL.match( /items/ ) && document.URL.match( /new/ ) || document.URL.match( /edit/ )){
  window.addEventListener('load', function(){
    let priceInput = document.getElementById("item-price");
    let addTaxPrice = document.getElementById("add-tax-price");
    let profitPrice = document.getElementById("profit");
    // 販売手数料10%
    const tax = 0.1;
  
    // 価格が入力されたらイベント発火
    priceInput.addEventListener('keyup', function (){
      // 価格の取得
      let price = priceInput.value;
  
      // 価格の範囲指定での条件分岐
      if (price >= 300 && price <= 9999999 ) {
        // 手数料の計算
        const fee = price * tax;
        // 販売利益の計算
        let profit = price - fee;
        
        // 計算結果をビューに表示、小数点切り捨て
        addTaxPrice.innerHTML = Math.floor(fee);
        profitPrice.innerHTML = Math.floor(profit);

      } else {
        addTaxPrice.innerHTML = ' ー ';
        profitPrice.innerHTML = ' ー ';
      }
        console.log(addTaxPrice.innerHTML);
        console.log(profitPrice.innerHTML);
    });
  });
}

