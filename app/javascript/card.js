const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  // フォーム送信時にイベントが発火するようにしましょう
  const form = document.getElementById("charge-form");

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    // フォームの情報を取得しましょう
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_form[number]"),
      exp_month: formData.get("order_form[exp_month]"),
      exp_year: `20${formData.get("order_form[exp_year]")}`,
      cvc: formData.get("order_form[cvc]"),
    // フォームの情報を取得しましょう
    };
    console.log(card)


  // カードの情報をトークン化しましょう
    Payjp.createToken(card, (status, response) => {
      console.log(status)

      if (status == 200) {
        const token = response.id;
     // トークンの値をフォームに含めましょう
        const renderDom = document.getElementById("charge-form");
         // トークンの値を非表示にしましょう
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
         // トークンの値を非表示にしましょう
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
     // トークンの値をフォームに含めましょう
  // カードの情報をトークン化しましょう
      }

      // クレジットカードの情報を削除しましょう
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      // クレジットカードの情報を削除しましょう

      // フォームの情報をサーバーサイドに送信しましょう
      document.getElementById("charge-form").submit();
      // フォームの情報をサーバーサイドに送信しましょう
    });
  });
};

// ページが読み込まれた時に、payという変数に代入したアロー関数が実行される
window.addEventListener("load",pay);