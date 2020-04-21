<script>
  import { onMount } from "svelte";

  let canvas = {
    grid: null,
    path: null
  };
  let ctx;

  const colors = {
    closedPath: "red"
  };

  const UP = 0,
    RIGHT = 1,
    DOWN = 2,
    LEFT = 3;

  const STORE_KEY = "DibuixInstruccions:path";

  const loadData = () => {
    const data = localStorage.getItem(STORE_KEY);
    return data
      ? JSON.parse(data)
      : {
          init: { x: 1, y: 1 },
          path: []
        };
  };

  const saveData = () => {
    localStorage.setItem(STORE_KEY, JSON.stringify(data));
  };

  let data = loadData();

  const L = 20;

  let compressedPath;
  $: {
    compressedPath = [];
    if (data.path.length > 0) {
      let curr = { instr: data.path[0], times: 1 };
      for (let i = 1; i < data.path.length; i++) {
        if (data.path[i] == curr.instr) {
          curr.times++;
        } else {
          compressedPath.push(curr);
          curr = { instr: data.path[i], times: 1 };
        }
      }
      compressedPath.push(curr);
    }
  }

  const clearPath = () => {
    data.path = [];
    redraw();
  };

  const reverseInstruction = {
    [UP]: DOWN,
    [LEFT]: RIGHT,
    [RIGHT]: LEFT,
    [DOWN]: UP
  };

  const addInstruction = instr => {
    const lastInstruction = data.path[data.path.length - 1];
    if (lastInstruction == reverseInstruction[instr]) {
      data.path = data.path.slice(0, data.path.length - 1);
    } else {
      data.path = [...data.path, instr];
    }
    saveData();
    redraw();
  };

  const onKeyDown = e => {
    switch (e.key) {
      case "ArrowUp":
        addInstruction(UP);
        break;
      case "ArrowRight":
        addInstruction(RIGHT);
        break;
      case "ArrowLeft":
        addInstruction(LEFT);
        break;
      case "ArrowDown":
        addInstruction(DOWN);
        break;
    }
  };

  const drawBackground = () => {
    ctx = canvas.grid.getContext("2d");
    ctx.clearRect(0, 0, canvas.grid.width, canvas.grid.height);
    ctx.lineWidth = 1;
    ctx.strokeStyle = "#ddd";

    for (let i = 0; i < canvas.grid.height / L; i++) {
      ctx.beginPath();
      ctx.moveTo(0, i * L);
      ctx.lineTo(canvas.grid.width, i * L);
      ctx.closePath();
      ctx.stroke();
    }
    for (let i = 0; i < canvas.grid.width / L; i++) {
      ctx.beginPath();
      ctx.moveTo(i * L, 0);
      ctx.lineTo(i * L, canvas.grid.height);
      ctx.closePath();
      ctx.stroke();
    }
    drawPoints(ctx, [data.init]);
  };

  const drawPoints = (ctx, ptarray) => {
    for (let p of ptarray) {
      ctx.beginPath();
      ctx.arc(p.x * L, p.y * L, 5, 0, Math.PI * 2);
      ctx.fillStyle = "black";
      ctx.fill();
    }
  };

  const equalPoints = (a, b) => {
    return a.x === b.x && a.y === b.y;
  };

  const setCenter = e => {
    data.init.x = Math.round(e.offsetX / L);
    data.init.y = Math.round(e.offsetY / L);
    drawBackground();
    drawPath();
    saveData();
  };

  const drawPath = () => {
    const ctx = canvas.path.getContext("2d");
    ctx.clearRect(0, 0, canvas.path.width, canvas.path.height);
    ctx.beginPath();
    let curr = { x: data.init.x, y: data.init.y };
    ctx.moveTo(curr.x * L, curr.y * L);
    for (let instr of data.path) {
      switch (instr) {
        case UP:
          curr.y -= 1;
          break;
        case DOWN:
          curr.y += 1;
          break;
        case RIGHT:
          curr.x += 1;
          break;
        case LEFT:
          curr.x -= 1;
          break;
      }
      ctx.lineTo(curr.x * L, curr.y * L);
    }
    const closedPath = equalPoints(curr, data.init);
    ctx.lineWidth = closedPath ? 2 : 1;
    ctx.strokeStyle = "black";
    ctx.stroke();
    drawPoints(ctx, [curr]);
  };

  const redraw = () => {
    drawPath();
  };

  const symbol = {
    [UP]: "🠑",
    [DOWN]: "🠓",
    [RIGHT]: "🠒",
    [LEFT]: "🠐"
  };

  onMount(() => {
    drawBackground();
    redraw();
  });
</script>

<svelte:window on:keydown="{onKeyDown}" />

<button on:click="{clearPath}">Esborra</button>
<div class="content">
  <div class="layers">
    <canvas
      class="grid"
      width="{500}"
      height="{500}"
      bind:this="{canvas.grid}"
    ></canvas>
    <canvas
      class="path"
      width="{500}"
      height="{500}"
      bind:this="{canvas.path}"
      on:click="{setCenter}"
    ></canvas>
  </div>

  <div class="instructions">
    {#each compressedPath as { instr, times }}
      <div class="instr">
        <span>{times}</span>
        <span class="symbol">{symbol[instr]}</span>
      </div>
    {/each}
  </div>
</div>

<style>
  canvas {
    border: 1px solid black;
  }
  .instructions {
    margin-top: 1em;
    font-size: 1.5rem;
    max-width: 500px;
    margin: 1em auto 0 auto;
  }
  div.instr {
    display: inline-flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    width: 4.2rem;
    margin-bottom: 0.3rem;
  }
  span.symbol {
    margin-left: 0.2rem;
    font-weight: bold;
    height: 2rem;
    width: 1.2rem;
  }
  .content {
  }
  .layers {
    position: relative;
    width: 500px;
    height: 500px;
    margin: auto;
  }
  .layers canvas {
    position: absolute;
    top: 0;
    left: 0;
  }
  @media print {
    canvas.path,
    button {
      display: none;
    }
  }
</style>
