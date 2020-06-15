<button on:click>
  <slot>ERROR: No button text!</slot>
</button>

<style>
  button {
    background-color: orange;
    border-radius: 4px;
    padding: .5rem .8rem;
  }
  @media print {
    button {
      display: none;
    }
  }
</style>
