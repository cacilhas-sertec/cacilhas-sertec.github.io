  const canvas = document.getElementById("curves");
  const ctx = canvas.getContext("2d");
  canvas.width = window.innerWidth;
  canvas.height = 400;

  ctx.strokeStyle = "#7a4ab0";

  ctx.beginPath();
  ctx.moveTo(0, canvas.height); // start at the bottom left
  ctx.bezierCurveTo(
    canvas.width / 2, canvas.height / 2,
    canvas.width / 2, canvas.height / 2,
    canvas.width,     canvas.height
  ); // draw wider line
  ctx.lineWidth = 3;
  ctx.stroke();

  ctx.beginPath();
  ctx.moveTo(0, canvas.height);
  ctx.bezierCurveTo(
    canvas.width / 2, canvas.height / 2 + 50,
    canvas.width / 2, canvas.height / 2 + 50,
    canvas.width,     canvas.height
  ); // draw thinner line
  ctx.lineWidth = 1;
  ctx.stroke();

  ctx.beginPath();
  ctx.moveTo(0, canvas.height);
  ctx.bezierCurveTo(
    canvas.width / 2, canvas.height / 2 - 50,
    canvas.width / 2, canvas.height / 2 - 50,
    canvas.width,     canvas.height
  ); // draw thinner line
  ctx.lineWidth = 1;
  ctx.stroke();
