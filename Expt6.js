let originalArray = [];

function setArray() {
  const arrayLength = parseInt(document.getElementById('arrayLength').value);
  const arrayInput = document.getElementById('arrayInput').value.split(',').map(item => item.trim());

  if (isNaN(arrayLength) || arrayLength <= 0) {
    alert("Enter a valid array length.");
    return;
  }

  if (arrayInput.length > arrayLength) {
    alert(`Enter up to ${arrayLength} elements only.`);
    return;
  }

  originalArray = arrayInput;
  displayArray();
}

function displayArray(message = "") {
  const output = document.getElementById('output');
  output.innerHTML = `${message}\nArray: [${originalArray.join(', ')}]`;
}

function removeElement() {
  const element = document.getElementById('removeElement').value;
  const initialLength = originalArray.length;

  originalArray = originalArray.filter(item => item !== element);

  if (originalArray.length < initialLength) {
    displayArray(`'${element}' removed.`);
  } else {
    displayArray(`'${element}' not found.`);
  }
}

function checkElement() {
  const element = document.getElementById('checkElement').value;
  const indexes = [];

  originalArray.forEach((item, index) => {
    if (item === element) indexes.push(index);
  });

  if (indexes.length > 0) {
    displayArray(`'${element}' exists at index(es): ${indexes.join(', ')}`);
  } else {
    displayArray(`'${element}' now doesn't exist`);
  }
}

function emptyArray() {
  originalArray = [];
  displayArray("Array emptied.");
}

function resetArray() {
  const arrayInput = document.getElementById('arrayInput').value.split(',').map(item => item.trim());
  originalArray = arrayInput;
  displayArray("Array reset.");
}
