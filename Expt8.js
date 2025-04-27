const input = document.getElementById("inputField");
const header = document.getElementById("eventHeader");

function changeColorOnFocus() {
  document.body.style.backgroundColor = "lightblue";
  input.style.backgroundColor = "lightblue";
}

function resetColor() {
  document.body.style.backgroundColor = "";
  input.style.backgroundColor = "";
}

header.addEventListener("mouseover", () => {
  input.blur(); // Remove focus when hovering over heading
  resetColor(); // Reset colors
  document.body.style.backgroundColor = "lightgreen";
});

header.addEventListener("mouseout", () => {
  document.body.style.backgroundColor = "";
});

document.addEventListener("click", (e) => {
  if (e.target !== input) {
    resetColor();
  }
});
