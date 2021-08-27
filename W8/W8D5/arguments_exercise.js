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
    return (...calls) => this.apply(context, args.concat(calls));
}

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBindRest(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBindRest(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBindRest(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBindRest(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true