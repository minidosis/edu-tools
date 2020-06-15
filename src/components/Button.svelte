<script>
  export let hint;
</script>

<button on:click title={hint}>
  <slot>ERROR: No button text!</slot>
</button>

<style>
  button {
    background-color: var(--primary-color);
    color: white;
    border-radius: 4px;
    padding: .5rem .8rem;
  }
  @media print {
    button {
      display: none;
    }
  }
</style>
