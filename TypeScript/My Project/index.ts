let a: string = "Hiiii";
a = "Hello";
console.log(a);
console.log("Hello World");

let num : number[] = [1,2,3,4,5];
num.push(6);
console.log(num);

interface Person {
    name: string;
    age: number;
    cute: boolean;
}

const person: Person = {
    name: "John",
    age: 30,
    cute: true
};

console.log(person,person.age);


class Person2 {
    name: string;
    age: number;
    cute: boolean;
    constructor(name: string, age: number, cute: boolean) {
        this.name = name;
        this.age = age;
        this.cute = cute;
    }
}

const person2:Person2 = new Person2("John",30,true);

console.log(person2);

// == check value
// === check value and type

let nummm: number[] = [9845,68541,98645,98645,456]
for(let a in nummm){
    console.log(a);
}
nummm.forEach((item)=>{
    console.log(item);
    });
for(let a of nummm){
    console.log(a);
}