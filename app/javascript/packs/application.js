// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// bootstrap追加記述
import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// フラッシュメッセージ（一定時間で消す）
$(function(){  //メソッド定義
  $('.js-flash').fadeOut(5000);  //5秒かけて消えていく
});

// viewを読み込んだ後に実行（イベントを使用する場合は使用する場合が多い）
$(document).on('turbolinks:load', function() {
  // 画像アップロードフィールドの変更イベントが発生したときの処理
  $('#imageField').on('change', (e) => {
    // console.log(e);
    // 選択されたファイルを取得（ver=変数宣言）
    // 画像選択したら発火（０＝１枚）
    // e.target.files.lengs(for文３７〜４２)（画像複数投稿
    var file = e.target.files[0];
    // FileReaderオブジェクトを作成
    // FileReader()：JavaScriptのプログラム　new:classをオブジェクトに作成
    var reader = new FileReader();
    // 読み込み完了時に処理（file＝＞f）
    reader.onload = (f) => {
      // プレビュー画像のsrc属性を選択した画像ファイルのDataURLに設定=>viewへ
      // IDが一つしかないから工夫してあげる（画像複数投稿）
      $('#imagePreview').attr('src', f.target.result)
    }
    // 画像ファイルをDataURL形式で読み込む
    reader.readAsDataURL(file);
  });

});