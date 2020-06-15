<script>
  export let id;
  export let name;
</script>

<a href="/{id}">
  <img src="/{id}.png" alt="{name}" />
  <div class="name">
    <h3>{name}</h3>
    <p>
      <slot />
    </p>
  </div>
</a>

<style>
  a {
    display: flex;
    width: 30rem;
    padding: 0.5rem;
    margin-bottom: 1rem;
    text-decoration: none;
    border-radius: 0.4rem;
  }
  a:hover {
    background-color: #fff2e5;
  }
  a {
    font-size: 18;
    color: #333;
  }
  a h3 {
    margin-top: 0;
    margin-bottom: 0.4rem;
    color: var(--primary-color);
  }
  a p {
    margin: 0;
  }
  img {
    border: 1px solid #ccc;
    margin-right: 1rem;
  }
</style>
