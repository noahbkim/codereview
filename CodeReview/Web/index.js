const theme = document.getElementById("theme");
const raw = document.getElementById("raw");
const numbers = document.getElementById("numbers");

function communicate(key, value) {
  webkit.messageHandlers[key].postMessage(value);
}

function number(n) {
  const span = document.createElement("span");
  span.innerText = n;
  return span;
}

function reload() {
  hljs.initHighlighting();
  const lines = raw.innerText.split("\n").length;
  for (let i = 0; i < lines; i++)
    numbers.appendChild(number(i + 1));
}

function style(name) {
  theme.setAttribute("href", name + ".css");
  const color = window.getComputedStyle(raw, null).getPropertyValue("background-color");
  communicate("background", color);
}

reload();
style("solarized-dark");
