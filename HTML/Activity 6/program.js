function addNewItem(){
    let ItemName = document.getElementById("item-to-add").value;
    let AddBy = document.getElementById("name-to-add").value;
    let ItemPrice = document.getElementById("price-to-add").value;
    let table = document.getElementById("main-table");
    let row = table.insertRow(table.rows.length-1);
    let cell1 =row.insertCell(0);
    let cell2 =row.insertCell(1);
    let cell3 =row.insertCell(2);
    cell1.innerHTML=ItemName;
    cell2.innerHTML=AddBy;
    cell3.innerHTML=ItemPrice;
    let cell4 = row.insertCell(3);
    cell4.innerHTML = '<button class="delete-row" onclick="DeleteRow(this);">ลบ</button>';


    // table.
}




function DeleteRow(row){
    var d = row.parentNode.parentNode.rowIndex;
    document.getElementById("main-table").deleteRow(d);


}
