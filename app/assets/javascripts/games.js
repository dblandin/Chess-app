$('document').ready(function() {

  // Making chessboard height equal to width
  var chessBoard = $('#chessBoard');
  chessBoard.height(chessBoard.width());

  $(window).resize(function() {
    chessBoard.height(chessBoard.width());
    $('.chess-piece').height( 0.125 * 0.98 * chessBoard.width());
  });


  // End Making chessboard height equal to width

  // Move Chesspieces
  var isPieceSelected = false;
  var initialSquare;
  var initialSquareColorBegin;
  var initialSelectedPiece;

  $('.chess-dark-square, .chess-light-square').on('click', function() {
    if (isPieceSelected === false) {
      if ($(this).children().length > 0) {

        initialSquare = $(this);
        initialSelectedPiece = initialSquare.children(':first');
        initialSquareColorBegin = initialSquare.css('background-color');

        initialSquare.css('background-color', 'rgb(248, 155, 56)');
        isPieceSelected = true;
      }
    } else {
      initialSquare.css('background-color', initialSquareColorBegin);
      var finalSquare = $(this);
      var obstructingPiece = null;

      if (finalSquare.attr('id') != initialSquare.attr('id')) {
        if (finalSquare.children().length > 0) {
          obstructingPiece = finalSquare.children(':first');
        }

        // Ajax Request Here

        // Wrap in if success 200 code
        if (finalSquare.children().length > 0) {
          // use ajax response to tell javascript the piece is captured
          // with that info, adjust the sidebar captured pieces.

          finalSquare.children().fadeOut('fast', function() {
            finalSquare.empty();
          });
        }

        // Wrap this as well in success 200 code
        var finalSquarePosition = finalSquare.position();
        var initialSquarePosition = initialSquare.position();

        initialSelectedPiece.animate({
          top: finalSquarePosition.top - initialSquarePosition.top,
          left: finalSquarePosition.left - initialSquarePosition.left
        }, 'slow', function() {

          initialSelectedPiece.appendTo(finalSquare).css({'top': '0', 'left': '0'});
          initialSelectedPiece.height(finalSquare.height() * 0.98);

        });
      }
      isPieceSelected = false;
    }
  });

  // end of Move Chesspieces



}); // end of $(document).ready
