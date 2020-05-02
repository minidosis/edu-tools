<script>
  const UP = 0,
    RIGHT = 1,
    DOWN = 2,
    LEFT = 3;

  export let dir;
</script>

<svg width="6mm" height="6mm" viewBox="0 0 6 6" version="1.1" id="svg8">
  {#if dir === UP}
    <path
      style="fill:#000000;fill-opacity:1;stroke:none"
      d="M 11.337891,1.8652344 6.6168914,8.5577773 h 2.828125 V 20.011719 H
      13.232718 V 8.5577773 h 2.826172 z"
      transform="scale(0.26458333)"
    ></path>
  {:else if dir === DOWN}
    <path
      style="fill:#000000;fill-opacity:1;stroke:none"
      d="M 2.999817,5.2947673 1.7507192,3.524032 H 2.4989939 V 0.49350993 H
      3.5011566 V 3.524032 h 0.747758 z"
    ></path>
  {:else if dir === LEFT}
    <path
      style="fill:#000000;fill-opacity:1;stroke:none"
      d="M 0.59918822,2.8941385 2.3699235,4.1432363 V 3.3949616 H 5.4004456 V
      2.3927989 H 2.3699235 v -0.747758 z"
    ></path>
  {:else if dir === RIGHT}
    <path
      style="fill:#000000;fill-opacity:1;stroke:none"
      d="M 5.4004456,2.8941385 3.6297103,4.1432363 V 3.3949616 H 0.59918822 V
      2.3927989 H 3.6297103 v -0.747758 z"
    ></path>
  {:else}
    <span>Wrong arrow!</span>
  {/if}
</svg>
