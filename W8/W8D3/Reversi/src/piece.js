/**
 * Initializes the Piece with its color.
 */
function Piece (color) {
    this.color = color;
}

/**
 * Returns the color opposite the current piece.
 */
Piece.prototype.oppColor = function () {
    let oppositeColor;
    if (this.color === 'white') {
        oppositeColor = 'black';
    } else {
        oppositeColor = 'white';
    }
    return oppositeColor;
};

/**
 * Changes the piece's color to the opposite color.
 */
Piece.prototype.flip = function () {
    return this.color = this.oppColor();
};

/**
 * Returns a string representation of the string
 * based on its color.
 */
Piece.prototype.toString = function () {
    if (this.color === 'white') {
        return 'W';
    } else {
        return 'B';
    }
};

// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
    module.exports = Piece;
}
// DON'T TOUCH THIS CODE