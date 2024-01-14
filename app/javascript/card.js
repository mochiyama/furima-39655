const pay = () => {

  const publicKey = gon.public_key //1/13 20:00追記
  const payjp = Payjp(publicKey) //PAY.JPテスト公開鍵

  //このメソッドを使用することで、入力フォームを作成できる。この時、生成されたフォームはelementという種類のインスタンスになる
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  //引数で要素のid属性を指定し、指定した要素とelementインスタンスが情報を持つフォームとを置き換えるメソッド
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  form.addEventListener("submit", (e) => {

    //#戻り値としてカード情報のトークンを取得
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;

        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
    });

    e.preventDefault();    
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay); //1/13 20:00追記