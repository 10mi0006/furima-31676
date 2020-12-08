window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    console.log(addTaxDom)
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    const input_addTaxDom = addTaxDom.value;
    console.log(input_addTaxDom);
    const Profit = document.getElementById("profit");
    console.log(Profit)
    console.log(inputValue - input_addTaxDom);
    Profit.innerHTML = Math.floor(inputValue * 0.9)

  })
});


// $(function(){
//   $( document ).on( 'keyup', "item-price", function(){ 
//     // 販売価格の入力欄に入力すると動きます
//     let amount = $( this ).val();
//     // 販売価格の入力欄に入力された値を変数「amount」に代入
//     let tax = Math.ceil(amount * 0.1);
//     // 販売手数料は10%としています。またMath.ceilメソッドで1円単位に切り上げています。
//     // 計算結果を変数「tax」に代入
//     let profit = Math.floor(amount * 0.9);
//     // 利益は残りの金額。Math.floorメソッドで、1円単位で切り捨てておけば「販売価格 = 販売手数料 + 販売利益」が成り立ちます。
//     // 計算結果は変数「profit」に代入。
//     $("add-tax-price").html(tax);
//     // htmlメソッドを使って販売手数料の欄を丸ごと書き換えます。
//     $("profit").html(profit);
//     // 同じように販売利益の欄も書き換えます。
//   });
//  });