  const canvas = document.getElementById("lines");
  const ctx = canvas.getContext("2d");
  canvas.width = window.innerWidth; // full width
  canvas.height = 400; // example height

  ctx.strokeStyle = "gray"; // set stroke color

  ctx.beginPath();
  ctx.moveTo(0, canvas.height); // start at the bottom left
  ctx.bezierCurveTo(
    canvas.width / 2,
    canvas.height / 2,
    canvas.width / 2,
    canvas.height / 2,
    canvas.width,
    canvas.height
  ); // draw large line
  ctx.lineWidth = 3; // set line width
  ctx.stroke();

  ctx.beginPath();
  ctx.moveTo(0, canvas.height);
  ctx.bezierCurveTo(
    canvas.width / 2,
    canvas.height / 2 + 50,
    canvas.width / 2,
    canvas.height / 2 + 50,
    canvas.width,
    canvas.height
  ); // draw small line
  ctx.lineWidth = 1; // set line width
  ctx.stroke();

  ctx.beginPath();
  ctx.moveTo(0, canvas.height);
  ctx.bezierCurveTo(
    canvas.width / 2,
    canvas.height / 2 - 50,
    canvas.width / 2,
    canvas.height / 2 - 50,
    canvas.width, canvas.height
  ); // draw small line
  ctx.lineWidth = 1; // set line width
  ctx.stroke();
