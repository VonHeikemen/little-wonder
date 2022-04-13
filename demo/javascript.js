'use strict'
import {Base} from './path';

class Sale extends Base.Other {
  constructor(price) {
    super();
    ;[this.decoratorsList, this.price] = [[], price]
  }

  decorate(decorator) {
    if (!Sale[decorator]) throw new Error(`decorator not exist: ${decorator}`)
    this.decoratorsList.push(Sale[decorator])
  }

  static quebec(price) {
    // this is a comment
    return price + price * 7.5 / 100
  }
}


var test = () => {

};

new Promise();
require('test');

let sale = new Sale(100)
sale.decorate('fedtax')
sale.decorate('quebec')
console.log(sale.getPrice()) //112.88

getPrice()

//deeply nested

async function asyncCall() {
  var result = await resolveAfter2Seconds();
}

for (let i=0; i <10; i++) {
  continue;
}

if (true) {}

while (true) {}

switch(2) {
  case 2:
    break;
  default:
    break;
}

try {

} catch(e) {

}
