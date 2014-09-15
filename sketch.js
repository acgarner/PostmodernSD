function setup() {
  createCanvas(640, 480);
}

function draw() {
  if (mouseIsPressed) {
    fill(250);
  } else {
    fill(0);
  }
  square(mouseX, mouseY, 40, 40);
}