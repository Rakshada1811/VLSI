function generateForTable() {
    const number = parseInt(document.getElementById("forInput").value);
    const count = parseInt(document.getElementById("forCount").value);
    const output = document.getElementById("forOutput");
  
    if (isNaN(number) || number <= 0 || isNaN(count) || count <= 0) {
      output.innerHTML = "<span class='error'>Please enter valid positive values for both fields.</span>";
      return;
    }
  
    let result = `<strong>Table using For Loop:</strong><br>`;
    for (let i = 1; i <= count; i++) {
      result += `${number} × ${i} = ${number * i}<br>`;
    }
    output.innerHTML = result;
  }
  
  function generateWhileTable() {
    const number = parseInt(document.getElementById("whileInput").value);
    const count = parseInt(document.getElementById("whileCount").value);
    const output = document.getElementById("whileOutput");
  
    if (isNaN(number) || number <= 0 || isNaN(count) || count <= 0) {
      output.innerHTML = "<span class='error'>Please enter valid positive values for both fields.</span>";
      return;
    }
  
    let result = `<strong>Table using While Loop:</strong><br>`;
    let i = 1;
    while (i <= count) {
      result += `${number} × ${i} = ${number * i}<br>`;
      i++;
    }
    output.innerHTML = result;
  }
  
  function generateDoWhileTable() {
    const number = parseInt(document.getElementById("doWhileInput").value);
    const count = parseInt(document.getElementById("doWhileCount").value);
    const output = document.getElementById("doWhileOutput");
  
    if (isNaN(number) || number <= 0 || isNaN(count) || count <= 0) {
      output.innerHTML = "<span class='error'>Please enter valid positive values for both fields.</span>";
      return;
    }
  
    let result = `<strong>Table using Do-While Loop:</strong><br>`;
    let i = 1;
    do {
      result += `${number} × ${i} = ${number * i}<br>`;
      i++;
    } while (i <= count);
    output.innerHTML = result;
  }
  