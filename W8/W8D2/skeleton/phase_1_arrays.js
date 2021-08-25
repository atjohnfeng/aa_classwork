// Array.prototype.uniq = function () {
//     let result = [];
//     this.forEach(num => {
//         if (!result.includes(num)) {
//             result.push(num);
//         }
//     })
//     return result;
// }

// console.log([1,2,3].uniq())

// Array.prototype.twoSum = function (arr, target) {
//     let results = [];

//     for (let i = 0; i < arr.length; i++) {
//         for (let j = i + 1; j < arr.length; j++) {
//             if (arr[i] + arr[j] === target) {
//                 let pair = [];
//                 pair.push(arr[i]);
//                 pair.push(arr[j]);

//                 results.push(pair);
//             }
//         }
//     }
//     return results;
// }

// console.log(Array.prototype.twoSum([0,1,2,3,4,5], 5))

Array.prototype.transpose = function() {
    let results = [];

    for (let i = 0; i < this.length; i++) {
        let sub = [];
        for (let j = 0; j < this[i].length; j++) {
            sub.push(this[j][i]);
        }
        results.push(sub);
    }

    return results;
}

console.log([[1, 2], [2, 3], [3, 4]].transpose())