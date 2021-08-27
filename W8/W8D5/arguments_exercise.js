function sumUsingArgs() {
    let sum = 0;
    for (let i = 0; i < arguments.length; i++) {
        sum += arguments[i];
    }
    return sum;
}

function sumUsingRest(...nums) {
    let sum = 0;
    for (let i = 0; i < nums.length; i++) {
        sum += nums[i];
    }
    return sum;
}

console.log(sumUsingArgs(1, 2, 3, 4) === 10);
console.log(sumUsingRest(1, 2, 3, 4, 5) === 15);

Function.prototype.myBind = function(context) {
    const that = this;
    const toBind = Array.from(arguments).slice(1);
    return function boundFunction() {
        const calls = Array.from(arguments);
        return that.apply(context, toBind.concat(calls));
    }
}

Function.prototype.myBindRest = function (context, ...args) {
    return (...calls) => this.apply(context, bindArgs.concat(calls));
}