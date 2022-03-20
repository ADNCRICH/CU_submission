// Import the functions you need from the SDKs you need
import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.8/firebase-app.js";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyDRspzYP6bF_gh1ONfN0Zh9xYgRoiqysUk",
  authDomain: "cee7-95587.firebaseapp.com",
  projectId: "cee7-95587",
  storageBucket: "cee7-95587.appspot.com",
  messagingSenderId: "1095889059247",
  appId: "1:1095889059247:web:69d99bcf3e85181b20435a",
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

import {
  addDoc,
  collection,
  deleteDoc,
  doc,
  getDoc,
  getDocs,
  getFirestore,
  updateDoc,
} from "https://www.gstatic.com/firebasejs/9.6.8/firebase-firestore.js";

const db = getFirestore();
const items_ref = collection(db, "App");

async function showItemsInTable() {
  const table_body = document.getElementById("main-table-body");
  table_body.innerHTML = "";

  const collection = await getDocs(items_ref);
  const items = collection.docs;
  items.map((item) => {
    table_body.innerHTML += `
        <tr id="${item.id}">
	          <td>${item.data().product}</td>
            <td>${item.data().buyer}</td>
            <td>${item.data().price}</td>
            <td><button class="delete-row" onclick="deleteItem('${
              item.id
            }')">ลบ</button></td>
        </tr>
        `;
  });
}

document.addEventListener("DOMContentLoaded", function (event) {
  console.log("showing items from database");
  showItemsInTable();
});

function redrawDOM() {
  window.document.dispatchEvent(
    new Event("DOMContentLoaded", {
      bubbles: true,
      cancelable: true,
    })
  );
  document.getElementById("item-to-add").value = "";
  document.getElementById("name-to-add").value = "0";
  document.getElementById("price-to-add").value = "";
}

async function addItem() {
  console.log("addItem");
  const product = document.getElementById("item-to-add").value;
  const buyer = document.getElementById("name-to-add").value;
  const price = document.getElementById("price-to-add").value;

  addDoc(items_ref, {
    product: product,
    buyer: buyer,
    price: price,
  });

  await showItemsInTable();
}

// async function waitforadd(){
//   addItem().then(redrawDOM());
// }

var addButton = document.querySelector("#add-newrow");
addButton.onclick = async () => {
  addItem().then(() => {
    redrawDOM();
  });
};

async function deleteItem(docId) {
  console.log("delete item");

  const docRef = doc(db, "App/" + docId);
  await deleteDoc(docRef);
  await showItemsInTable();
}

window.deleteItem = deleteItem;

//---------------------------------------------------
// function deleteRow(idName) {
//   document.getElementById(idName).remove();
// }
// let total = 5;
// function newRow() {
//   addItem();
//   let table = document.getElementById("main-table");
//   let rowCount = table.rows.length;
//   let row = table.insertRow(rowCount - 1);
//   let newItem = row.insertCell(0);
//   let newName = row.insertCell(1);
//   let newPrice = row.insertCell(2);
//   let newBtn = row.insertCell(3);
//   total += 1;
//   row.setAttribute("id", `item${total}`);
//   let item = document.getElementById("item-to-add");
//   let name = document.getElementById("name-to-add");
//   let price = document.getElementById("price-to-add");
//   newItem.innerHTML = item.value;
//   newName.innerHTML = name.value;
//   newPrice.innerHTML = price.value;
//   newBtn.innerHTML = `<button class="delete-row" onclick="deleteRow('item${total}');">ลบ</button>`;
//   item.value = "";
//   name.value = "";
//   price.value = "";
// }
