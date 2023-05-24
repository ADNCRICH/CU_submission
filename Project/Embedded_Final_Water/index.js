import { initializeApp } from "firebase/app";
//FireStore
import { getFirestore, collection, getDocs, doc, addDoc } from "firebase/firestore";
//RTOS
import { getDatabase, set, ref, get } from "firebase/database";
//express setup
import express from "express";
import bodyParser from "body-parser";
import { firebaseConfig } from "./firebaseConfig.js";

var appE = express();
appE.use(bodyParser.json());
appE.use(bodyParser.urlencoded({ extended: true }));
var server = appE.listen(3000, console.log("Server is running on port 3000"));

const app = initializeApp(firebaseConfig);
const db = getFirestore(app);
const dbRTOS = getDatabase(app);

//get All firestore Document
appE.get("/api/getFIRE", async (req, res) => {
    try {
        const waterCol = collection(db, "Water History");
        const waterSnap = await getDocs(waterCol);
        const waterList = waterSnap.docs.map((doc) => ({
            ID: doc.id,
            Data: doc.data(),
        }));
        return res.status(200).json({
            RespCode: 200,
            RespMessage: "Found, Nice my buddy.",
            Result: waterList,
        });
    } catch (err) {
        console.log(err);
        return res.status(500).json({
            RespCode: 500,
            RespMessage: err.message + " in get's catch ",
        });
    }
});

// push sensor value with input Location to FireBase
appE.post("/api/createFIRE", async (req, res) => {
    var DissolvedO2 = req.body.DissolvedO2_Value;
    var TDS = req.body.TDS_Value;
    var Thermo = req.body.Thermo_Value;
    var Location = req.body.Location;
    var Time = new Date();
    var TimeString =
        (Time.getDate() < 10 ? "0" : "") +
        Time.getDate() +
        (Time.getMonth() < 9 ? "/0" : "/") +
        (Time.getMonth() + 1) +
        "/" +
        Time.getFullYear() +
        (Time.getHours() < 10 ? " 0" : " ") +
        Time.getHours() +
        (Time.getMinutes() < 10 ? ":0" : ":") +
        Time.getMinutes() +
        (Time.getSeconds() < 10 ? ":0" : ":") +
        Time.getSeconds();
    try {
        console.log(DissolvedO2, TDS, Thermo, Location, TimeString);
        await addDoc(collection(db, "Water History"), {
            DissolvedO2_Value: DissolvedO2,
            TDS_Value: TDS,
            Thermo_Value: Thermo,
            Location: Location,
            Time: TimeString,
        });

        return res.status(200).json({
            RespCode: 200,
            RespMessage: "Good job my guy :)",
        });
    } catch (err) {
        console.log(err);
        return res.status(500).json({
            RespCode: 500,
            RespMessage: err.message + " in post's catch ",
        });
    }
});

//get sensor value from RTOS
appE.get("/api/getRTOS", async (req, res) => {
    try {
        get(ref(dbRTOS))
            .then(async (snap) => {
                if (snap.exists()) {
                    console.log(typeof snap.val());
                    console.log(snap.val());
                    return res.status(200).json({
                        RespCode: 200,
                        RespMessage: "Found, Nice my buddy.(Maybe Posting)",
                        Result: snap.val(),
                    });
                } else {
                    return res.status(200).json({
                        RespCode: 200,
                        RespMessage: "I try my best to find :(",
                        Result: "Not found",
                    });
                }
            })
            .catch((err2) => {
                console.log(err2);
                return res.status(500).json({
                    RespCode: 500,
                    RespMessage: err2.message + " in get's call back catch",
                });
            });
    } catch (err) {
        console.log(err);
        return res.status(500).json({
            RespCode: 500,
            RespMessage: err.message + " in get's catch ",
        });
    }
});

// >>>>> debugger for get document from FireStore <<<<<
// async function getTest() {
//     let res = await fetch("http://127.0.0.1:3000/api/getFire");
//     let data = await res.json();
//     return data;
// }
// getTest().then((x) => console.log(x.Result));

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// try NestJS next time

// >>>> this is how to call api and don't forget to add Header!!! <<<<
// try {
//     await fetch("http://127.0.0.1:3000/api/createFIRE", {
//         method: "POST",
//         headers: {
//             "Content-Type": "application/json",
//         },
//         body: JSON.stringify(snap.val()),
//     });
//     console.log("GET from RTOS and Added to FireBase");
// } catch (err) {
//     console.log(err);
//     return res.status(500).json({
//         RespCode: 500,
//         RespMessage: err.message + " in getRTOS -> create's catch ",
//     });
// }
