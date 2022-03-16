var rowCounter = 0;
var addButton = document.getElementById("add-newrow");

var sumMember1 = 0;
var sumMember2 = 0;
var sumMember3 = 0;

var price1 = document.getElementById("member1").innerHTML = "0 บาท";
var price2 = document.getElementById("member2").innerHTML = "0 บาท";
var price3 = document.getElementById("member3").innerHTML = "0 บาท";

addButton.onclick = function () {
    rowCounter++;

    var itemString = document.getElementById("name").value;
    var nameString = document.getElementById("buyer").value;
    var priceString = document.getElementById("price").value;

    switch (nameString) {
        case "Sirapat Jariyanantakul":
            sumMember1 += parseInt(priceString);
            break;
        case "Akkharawat Burachokviwat":
            sumMember2 += parseInt(priceString);
            break;
        case "Naravit Namson":
            sumMember3 += parseInt(priceString);
            break;
    }
    var price1 = document.getElementById("member1").innerHTML = sumMember1.toString() + " บาท";
    var price2 = document.getElementById("member2").innerHTML = sumMember2.toString() + " บาท";
    var price3 = document.getElementById("member3").innerHTML = sumMember3.toString() + " บาท";

    //Crate ID for each tr for identification
    var tr = document.createElement("tr");
    tr.setAttribute("id", "row-" + rowCounter);

    //Column 1 : item
    var itemTD = document.createElement("td");
    itemTD.appendChild(document.createTextNode(itemString));
    tr.appendChild(itemTD);

    //[TODO] Column 2 : Name [variable = nameTD]
    var nameTD = document.createElement("td");
    nameTD.appendChild(document.createTextNode(nameString));
    tr.appendChild(nameTD);

    //[TODO] Column 3 : Price [variable = priceTD]
    var priceTD = document.createElement("td");
    priceTD.appendChild(document.createTextNode(priceString));
    tr.appendChild(priceTD);

    //Column 4 : Button [variable = buttonTD]
    var buttonTD = document.createElement("td");

    var button = document.createElement("button");
    button.classList.add("delete-row");
    button.setAttribute("rowID", "row-" + rowCounter);
    button.setAttribute("price", priceString);
    button.setAttribute("name", nameString);

    //Assign delete function into the button
    button.onclick = function () {
        var targetTRID = this.getAttribute("rowID");
        var targetName = this.getAttribute("name");
        var targetPrice = this.getAttribute("price");
        var targetTR = document.getElementById(targetTRID);

        switch (targetName) {
            case "Sirapat Jariyanantakul":
                sumMember1 -= parseInt(priceString);
                break;
            case "Akkharawat Burachokviwat":
                sumMember2 -= parseInt(priceString);
                break;
            case "Naravit Namson":
                sumMember3 -= parseInt(priceString);
                break;
        }
        var price1 = document.getElementById("member1").innerHTML = sumMember1.toString() + " บาท";
        var price2 = document.getElementById("member2").innerHTML = sumMember2.toString() + " บาท";
        var price3 = document.getElementById("member3").innerHTML = sumMember3.toString() + " บาท";

        targetTR.remove();
    }

    //[TODO] Create Text for button and append into tr
    button.appendChild(document.createTextNode("ลบ"));
    buttonTD.appendChild(button);
    tr.appendChild(buttonTD);

    //[TODO] Append tr into the tbody
    var itemBody = document.getElementById("main-table-body");
    itemBody.appendChild(tr);
}



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



// put Your SDK setup and configuration here (CDN version)
// =======================================================
import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.8/firebase-app.js";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
    apiKey: "AIzaSyBiEpQ6nJ4vGy6_Ga3Cn6LkhN-IYGwFHqA",
    authDomain: "starter-project-c6f5e.firebaseapp.com",
    projectId: "starter-project-c6f5e",
    storageBucket: "starter-project-c6f5e.appspot.com",
    messagingSenderId: "744982118303",
    appId: "1:744982118303:web:a30a0d0a920883342f07aa"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
// =======================================================
import {
    addDoc,
    collection,
    deleteDoc,
    doc,
    getDoc,
    getDocs,
    getFirestore,
    updateDoc,
} from 'https://www.gstatic.com/firebasejs/9.6.8/firebase-firestore.js';

const db = getFirestore();
const booksRef = collection(db, 'books');

async function getItems() {
    console.log('getItems');

    const items = await getDocs(booksRef);

    if (items) {
        const books = items.docs.map((item) => ({
            docId: item.id,
            ...item.data(),
        }));

        console.log(books);

        document.getElementById('firestore-holder').innerHTML =
            JSON.stringify(books);
    }
}

async function addItem() {
    console.log('addItem');

    const name = document.getElementById('name').value;
    const buyer = document.getElementById('buyer').value;
    const price = document.getElementById('price').value;

    addDoc(booksRef, {
        name,
        buyer,
        price,
    });
}

async function updateItem() {
    console.log('updateItem');

    const docId = document.getElementById('docId').value;

    const bookRef = await doc(db, `books/${docId}`);
    let bookInstance = await getDoc(bookRef);
    bookInstance = bookInstance.data();

    const title = document.getElementById('title').value;
    const author = document.getElementById('author').value;
    const isbn = document.getElementById('isbn').value;

    const bookData = {
        title: title ? title : bookInstance.title,
        author: author ? author : bookInstance.author,
        isbn: isbn ? isbn : bookInstance.isbn,
    };

    console.log(bookData);

    updateDoc(bookRef, bookData)
        .then(function () {
            console.log('success');
        })
        .catch(function (error) {
            console.log('failed', error);
        });
}

async function deleteItem() {
    console.log('deleteItem');

    const docId = document.getElementById('docId').value;
    const docRef = doc(db, `books/${docId}`);

    await deleteDoc(docRef);
}

// Let's make the buttons work!!
// Method 1: Export functions to window object
window.addItem = addItem;
window.getItems = getItems;

// Method 2: add eventLisnter to the button
document.getElementById('updateButton').addEventListener('click', updateItem);
document.getElementById('deleteButton').addEventListener('click', deleteItem);
