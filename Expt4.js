function compareEquality() {
    const string1 = document.getElementById("equalString1").value;
    const string2 = document.getElementById("equalString2").value;
    const result = (string1 == string2)
      ? "The strings are equal using '=='."
      : "The strings are not equal using '=='.";
    document.getElementById("resultEqual").innerHTML = result;
  }
  
  function compareStrictEquality() {
    const string1 = document.getElementById("strictString1").value;
    const string2 = document.getElementById("strictString2").value;
    const result = (string1 === string2)
      ? "The strings are strictly equal using '==='."
      : "The strings are not strictly equal using '==='.";
    document.getElementById("resultStrict").innerHTML = result;
  }
  
  function compareLexicographical() {
    const string1 = document.getElementById("lexicoString1").value;
    const string2 = document.getElementById("lexicoString2").value;
    const comparison = string1.localeCompare(string2);
    let result;
    if (comparison < 0) {
      result = "String1 comes before String2 alphabetically.";
    } else if (comparison > 0) {
      result = "String2 comes before String1 alphabetically.";
    } else {
      result = "Both strings are alphabetically equal.";
    }
    document.getElementById("resultLexico").innerHTML = result;
  }
  
  function compareLength() {
    const string1 = document.getElementById("lengthString1").value;
    const string2 = document.getElementById("lengthString2").value;
    let result;
    if (string1.length > string2.length) {
      result = "String1 is longer than String2.";
    } else if (string1.length < string2.length) {
      result = "String2 is longer than String1.";
    } else {
      result = "Both strings have the same length.";
    }
    document.getElementById("resultLength").innerHTML = result;
  }
  
  function customComparison() {
    const string1 = document.getElementById("customString1").value;
    const string2 = document.getElementById("customString2").value;
    const result = (string1.toLowerCase() === string2.toLowerCase())
      ? "The strings are equal ignoring case."
      : "The strings are not equal ignoring case.";
    document.getElementById("resultCustom").innerHTML = result;
  }
  