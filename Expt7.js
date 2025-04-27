let arr = [];
let arraySize = 0;

function setArraySize() {
    const size = parseInt(document.getElementById("arraySize").value);
    if (isNaN(size) || size < 1) {
        alert("Please enter a valid array size.");
        return;
    }
    arraySize = size;
    arr = [];
    displayArray("Array size set to " + arraySize + ". Array reset.");
}

function addToArray() {
    if (arraySize === 0) {
        alert("Please set the array size first.");
        return;
    }

    if (arr.length >= arraySize) {
        alert("Array is already filled to the specified size.");
        return;
    }

    const input = document.getElementById("objectInput").value.trim();
    if (input === "") {
        alert("Please enter a value.");
        return;
    }

    try {
        const elements = eval("[" + input + "]"); // safe only for learning context
        const spaceLeft = arraySize - arr.length;

        if (elements.length > spaceLeft) {
            alert(`You can only add ${spaceLeft} more element(s).`);
            return;
        }

        arr.push(...elements);
        displayArray(`${elements.length} element(s) added.`);
    } catch (e) {
        alert("Invalid input! Use comma-separated objects or arrays.\nExample: {key:'val'}, [1,2]");
    }
}

function checkObject() {
    const index = parseInt(document.getElementById("checkObject").value);
    let message = "";

    if (isNaN(index) || index < 0 || index >= arr.length) {
        message = "Index out of bound.";
    } else {
        const value = arr[index];
        message = Array.isArray(value)
            ? `Element at index ${index} is an array.`
            : `Element at index ${index} is not an array.`;
    }

    displayArray(message);
}

function displayArray(extraMessage) {
    // Update to show just the array elements, without index
    const arrayString = arr.map(obj => JSON.stringify(obj)).join(", ");
    document.getElementById("output").innerHTML = `Array: [${arrayString}]<br>${extraMessage || ""}`;
}
