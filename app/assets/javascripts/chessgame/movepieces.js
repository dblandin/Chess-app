$(document).ready(function() {

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

        var params = {
          initial_square: initialSquare.attr('id'),
          final_square: finalSquare.attr('id'),
          selected_piece: initialSelectedPiece.attr('id'),
        }

        // Move piece ajax request begin
        $.ajax({
          method: 'patch',
          url: '/games/1',
          data: params,
          success: function(data) {
            if (data.validMove === true) {
              // Wrap in if success 200 code
              if (finalSquare.children().length > 0) {
                // use ajax response to tell javascript the piece is captured
                // with that info, adjust the sidebar captured pieces in this
                // code block here.

                finalSquare.children().fadeOut('fast', function() {
                  finalSquare.empty();
                });
              }

              var finalSquarePosition = finalSquare.position();
              var initialSquarePosition = initialSquare.position();

              initialSelectedPiece.animate({
                top: finalSquarePosition.top - initialSquarePosition.top,
                left: finalSquarePosition.left - initialSquarePosition.left
              }, 'slow', function() {

                initialSelectedPiece.appendTo(finalSquare).css({'top': '0', 'left': '0'});
                initialSelectedPiece.height(finalSquare.height() * 0.98);

              });
            } // if validMove === true end
          } // ajax success function end
        }); // ajax request end
      } // if final square != initial square end

      isPieceSelected = false;

    } // if pieceSelected === false end
  }); // Move piece functionality end
});
