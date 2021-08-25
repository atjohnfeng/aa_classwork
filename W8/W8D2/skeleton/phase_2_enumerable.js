Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    }
}

// NUMS = [1, 2, 3, 4, 5]

// let square = function(num) {
//     console.log(`square of ${num} is ${num * num}`)
// }

// NUMS.myEach(square);

Array.prototype.myMap = function(callback) {
    const newarr = []

    this.MyEach(ele => {
        newarr.push(callback(ele));
    });

    return new arr
}