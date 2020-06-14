<script>
  export let id;

  import { fade } from "svelte/transition";
  import HelpIcon from "./HelpIcon.svelte";

  const scaleParams = {
    duration: 300
  };

  let visible = localStorage.getItem(id) === null;

  $: if (!visible) {
    localStorage.setItem(id, false);
  }
</script>

{#if visible}
  <div class="outside" transition:fade on:click={() => (visible = false)}>
  </div>
  <div class="help text" transition:fade="{scaleParams}">
    <HelpIcon />
    <div>
      <h1>Ajuda</h1>
      <div class="closeButton" on:click="{() => (visible = false)}">❌</div>
      <slot />
    </div>
  </div>
{:else}
  <div class="help collapsed" on:click="{() => (visible = true)}">
    <HelpIcon />
    <span>Ajuda</span>
  </div>
{/if}

<style>
  h1 {
    margin: 0;
    margin-bottom: 0.8rem;
    font-size: 1.5rem;
  }
  .outside {
    z-index: 9;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
  }
  .help {
    z-index: 10;
    position: fixed;
    left: calc(50% - 20rem);
    top: 0.3rem;
    background-color: rgb(255, 226, 172);
    padding: 0.5rem;
    border-radius: 0.2rem;
  }
  .help.text {
    display: flex;
    flex-direction: row;
    box-shadow: 0 0.5rem 0.8rem #bbb;
    width: 40rem;
  }
  .help.text div {
    flex: 1;
    margin-left: .3rem;
    padding: .3rem;
  }
  .help.collapsed {
    padding: 0.4rem;
    left: calc(50% - 2rem);
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    font-weight: bold;
    box-shadow: 0 0.2rem 0.2rem #bbb;
  }
  .help.collapsed span {
    margin-left: .2rem;
  }
  .help :global(p) {
    margin: 0 0 0.5rem;
  }
  .help :global(p:last-child) {
    margin-bottom: 0;
  }
  .help :global(li) {
    margin-bottom: .6rem;
  }
  .help :global(li:last-child) {
    margin-bottom: 0;
  }
  .help :global(ul) {
    padding-left: 1rem;
    margin: 0;
  }
  .closeButton {
    position: absolute;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 1.6rem;
    height: 1.6rem;
    right: 0.3rem;
    top: 0.3rem;
    box-sizing: border-box;
    cursor: pointer;
    color: rgba(0, 0, 0, 0.25);
    font-size: 1.2rem;
  }
  .closeButton:hover {
    color: black;
  }
  @media print {
    .help {
      display: none;
    }
  }
</style>
