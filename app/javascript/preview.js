document.addEventListener('DOMContentLoaded', function(){
  // 新規投稿・編集ページのフォームを取得
  const formImage = document.getElementById('contents-form');
  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!formImage) return null;
  console.log("preview.jsが読み込まれました");
}); 