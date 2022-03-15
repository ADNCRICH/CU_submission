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

    const title = document.getElementById('title').value;
    const author = document.getElementById('author').value;
    const isbn = document.getElementById('isbn').value;

    addDoc(booksRef, {
        title,
        author,
        isbn,
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
