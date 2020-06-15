<script>
  export let hint;
</script>

<button on:click title="{hint}">
  <slot />
</button>

<style>
  button {
    position: absolute;
    display: flex;
    justify-content: center;
    align-items: center;
    top: 0.25rem;
    right: 0.25rem;
    width: 2.5rem;
    height: 2.5rem;
    padding: 0.4rem 0.6rem 0.3rem;
    background-color: var(--primary-color);
    color: white;
    border: 1px solid white;
    border-radius: 1.25rem;
    font-size: 1.2rem;
  }
  button:hover {
    border: 1px solid rgb(202, 138, 18);
  }
</style>
