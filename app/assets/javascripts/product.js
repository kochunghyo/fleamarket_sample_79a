//消費税計算
$(function(){
  $('.input-price-box').on('input',function(){
    let tax = $('.input-price-box').val();
    if (tax < 300){
      $('.fee').text("ー");
      $('.profit').text("ー");
    } else{
      $('.fee').text("¥" + Math.floor(tax * 0.1).toLocaleString());
      $('.profit').text("¥" + Math.ceil(tax - (tax * 0.1)).toLocaleString());
    }
  });
});