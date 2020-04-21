<script>
  import VelocitatLectora from "./tools/VelocitatLectora.svelte";
  import DibuixInstruccions from "./tools/DibuixInstruccions.svelte";

  const tools = {
    "Velocitat Lectora": VelocitatLectora,
    "Dibuix per instruccions": DibuixInstruccions
  };

  let currTool = null;
</script>

<main>
  {#if currTool}
    <span class="link" on:click="{() => (currTool = null)}">&lt; Eines</span>
    <svelte:component this="{currTool}" />
  {:else}
    <h1>Eines</h1>
    {#each Object.entries(tools) as [name, tool]}
      <div>
        <span class="link" on:click="{() => (currTool = tool)}">{name}</span>
      </div>
    {/each}
  {/if}
</main>

<style>
  main {
    padding: 1em;
    margin: 0 auto;
  }
  h1 {
    margin-top: 0;
    font-size: 3em;
    font-weight: 400;
  }
  .link {
    cursor: pointer;
    color: blue;
  }
</style>
