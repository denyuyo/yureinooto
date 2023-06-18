// パスワード入力フォームのスラッシュ目アイコンをクリックするとpassのマスキングを解除
  function eyeslashClick(){
    $(".fa-eye-slash").on("click", function(){
      $(".fa-eye").off("click") // offを設定しないとクリックした回数分だけ重複作動してしまう為
      let input = $(this).parents(".form-group").find("input");
      input.attr("type", "text"); // typeをpasswordに変更しマスキングを解除する
      $(this).removeClass(); // 目を消す
      $(this).addClass("fas fa-eye"); // アイコンをスラッシュのない目に置き換える
      eyeClick(); // 追加したfas fa-eyeにクリックイベントを付与
    });
  }
  // パスワード入力フォームの目アイコンをクリックするとpassをマスキング
  function eyeClick(){
    $(".fa-eye").on("click", function(){
      $(".fa-eye-slash").off("click") // offを設定しないとクリックした回数分だけ重複作動してしまう為
      let input = $(this).parents(".form-group").find("input");
      input.attr("type", "password"); // typeをpasswordに変更しマスキングを有効にする
      $(this).removeClass(); // 目を消す
      $(this).addClass("fas fa-eye-slash"); // アイコンをスラッシュのある目に置き換える
      eyeslashClick(); // 追加したfas fa-eye-slashにクリックイベントを付与
    });
  }
  // 目アイコンのクリックイベント呼び出しをデフォルト化
  eyeslashClick();
  eyeClick();