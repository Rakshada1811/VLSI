let intervalId;

function startTimer() {
  const date = document.getElementById('dateInput').value;
  const time = document.getElementById('timeInput').value;

  if (!date || !time) {
    alert("Please select both date and time.");
    return;
  }

  const endDateTimeString = `${date}T${time}`;
  const countdownDate = new Date(endDateTimeString).getTime();

  if (isNaN(countdownDate)) {
    alert("Invalid date or time.");
    return;
  }

  if (intervalId) clearInterval(intervalId);

  intervalId = setInterval(() => {
    const now = new Date().getTime();
    const remainingTime = countdownDate - now;

    if (remainingTime <= 0) {
      clearInterval(intervalId);
      document.getElementById('timer').innerHTML = "Expired";
      return;
    }

    const days = Math.floor(remainingTime / (1000 * 60 * 60 * 24));
    const hours = Math.floor((remainingTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((remainingTime % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((remainingTime % (1000 * 60)) / 1000);

    document.getElementById('timer').innerHTML =
      `${days}d ${hours}h ${minutes}m ${seconds}s`;
  }, 1000);
}

function stopTimer() {
  clearInterval(intervalId);
}

function resetTimer() {
  clearInterval(intervalId);
  document.getElementById('timer').innerHTML = "00d 00h 00m 00s";
  document.getElementById('dateInput').value = "";
  document.getElementById('timeInput').value = "";
}
