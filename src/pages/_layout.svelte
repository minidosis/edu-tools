<script>

</script>

<header>
  <a id="logo" href="/">Eines Educatives</a>
</header>

<div class="page">
  <slot />
</div>

<footer>&copy; Pau Fernández</footer>

<style>
  @font-face {
    font-family: Escolar;
    src: url(/escolar.ttf);
  }
  :global(:root) {
    --primary-color: rgb(255, 125, 38);
  }
  #logo {
    font-family: Escolar;
    font-weight: bold;
    color: white;
    font-size: 1.7rem;
  }
  #logo:hover {
    text-decoration: none;
  }
  header {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    height: 3rem;
    display: flex;
    align-items: center;
    padding-left: 1rem;
    border-bottom: 1px solid #eee;
    z-index: 1;
  }
  header {
    background-color: var(--primary-color);
  }
  .page {
    padding: 1rem;
    padding-top: 4rem;
    max-width: 48rem;
    margin: auto;
  }
  footer {
    color: var(--primary-color);
    font-size: 0.8rem;
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    padding: 0.8rem;
    display: flex;
    justify-content: center;
  }
  @media print {
    header {
      display: none;
    }
    footer {
      display: none;
    }
    .page {
      padding-top: 1rem;
    }
  }
</style>
