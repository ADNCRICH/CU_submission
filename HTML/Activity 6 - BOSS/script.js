var rowCounter = 0;
var addButton = document.getElementById("add-newrow");

var sumMember1 = 0;
var sumMember2 = 0;
var sumMember3 = 0;

var price1 = document.getElementById("member1").innerHTML = "0 บาท";
var price2 = document.getElementById("member2").innerHTML = "0 บาท";
var price3 = document.getElementById("member3").innerHTML = "0 บาท";

addButton.onclick = function() {
    rowCounter++;

    var itemString = document.getElementById("item-to-add").value;
    var nameString = document.getElementById("name-to-add").value;
    var priceString = document.getElementById("price-to-add").value;

    switch (nameString) {
        case "โชติพัฒน์ อัศวปยุกต์กุล":
            sumMember1 += parseInt(priceString);
            break;
        case "ณภัทร วารีเศวตสุวรรณ":
            sumMember2 += parseInt(priceString);
            break;
        case "ภูมิพัฒน์ ชัยประเสริฐสุด":
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
    button.onclick = function() {
        var targetTRID = this.getAttribute("rowID");
        var targetName = this.getAttribute("name");
        var targetPrice = this.getAttribute("price");
        var targetTR = document.getElementById(targetTRID);

        switch (targetName) {
            case "โชติพัฒน์ อัศวปยุกต์กุล":
                sumMember1 -= parseInt(priceString);
                break;
            case "ณภัทร วารีเศวตสุวรรณ":
                sumMember2 -= parseInt(priceString);
                break;
            case "ภูมิพัฒน์ ชัยประเสริฐสุด":
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