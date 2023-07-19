$(document).ready(function() {
  $('.bookmark-link').click(function() {
    // クリックされたいいねボタン以外のいいねボタンを無効化する
    $('.bookmark-link').not(this).attr('disabled', 'disabled');
  });
});
