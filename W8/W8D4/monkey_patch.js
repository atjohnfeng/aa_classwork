function mergeSort(arr, callback) {
    if (arr.length <= 1) {
        return arr;
    };

    let mididx = Math.floor(arr.length / 2);
    let left = arr.slice(0, mididx);
    let right = arr.slice(mididx);
    let sortedLeft = mergeSort(left, callback);
    let sortedRight = mergeSort(right, callback);

    return merge(sortedLeft, sortedRight, callback);
};

function merge(left, right, callback) {
    let results = [];

    while (left.length && right.length) {
        if (callback(left[0], right[0])) {
            results.push(left.shift());
        } else {
            results.push(right.shift());
        };
    };

    results = results.concat(left, right);
    return results;
};

Array.prototype.bSearch = function(target) {

    if (this.length <= 1 && target !== this[0]) {
        return 'Target not found.'
    }

    let mididx = Math.floor(this.length / 2);
    if (target === this[mididx]) return mididx;

    let left = this.slice(0, mididx);
    let right = this.slice(mididx);

    if (this[mididx] > target) {
        return left.bSearch(target);
    } else {
        let right_search = right.bSearch(target);
        if (!right_search) {
            return 'Target not found.'; 
        } else if (right_search !== 'Target not found.') {
            return mididx + right_search;
        } else {
            return 'Target not found.'
        }
    }
}