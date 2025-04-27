function reverseString() {
    const str = document.getElementById('stringToReverse').value;
    let reversedStr = '';
  
    for (let i = str.length - 1; i >= 0; i--) {
      reversedStr += str[i];
    }
  
    document.getElementById('reverseOutput').innerHTML = "Reversed String: " + reversedStr;
  }
  
  function replaceCharacters() {
    const originalStr = document.getElementById('originalString').value;
    const charToReplace = document.getElementById('charToReplace').value;
    const replacementChar = document.getElementById('replacementChar').value;
  
    if (charToReplace.length !== 1 || replacementChar.length !== 1) {
      document.getElementById('replaceOutput').innerHTML = "Please enter single characters only.";
      return;
    }
  
    let modifiedStr = '';
    for (let i = 0; i < originalStr.length; i++) {
      modifiedStr += originalStr[i] === charToReplace ? replacementChar : originalStr[i];
    }
  
    document.getElementById('replaceOutput').innerHTML = "Modified String: " + modifiedStr;
  }
  
  function checkPalindrome() {
    const str = document.getElementById('palindromeString').value.toLowerCase().replace(/[^a-z0-9]/g, '');
    const len = str.length;
    let isPalindrome = true;
  
    for (let i = 0; i < len / 2; i++) {
      if (str[i] !== str[len - 1 - i]) {
        isPalindrome = false;
        break;
      }
    }
  
    const result = isPalindrome ? "The string is a palindrome." : "The string is not a palindrome.";
    document.getElementById('palindromeOutput').innerHTML = result;
  }
  