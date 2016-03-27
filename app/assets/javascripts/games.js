// Set chessboard height equal to width
$('document').ready(function() {

  var chessBoard = $('#chessBoard');
  chessBoard.height(chessBoard.width());

  $(window).resize(function() {
    chessBoard.height(chessBoard.width());
  });

});
