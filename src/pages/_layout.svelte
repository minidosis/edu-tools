<script>

</script>

<header>
  <a href="/">Inici</a>
</header>

<div class="page">
  <slot />
</div>

<footer>&copy; Pau Fernández</footer>

<style>
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
    z-index: 100;
    background-color: white;
  }
  .page {
    padding: 1rem;
    padding-top: 3rem;
    max-width: 48rem;
    margin: auto;
  }
  footer {
    color: #aaa;
    font-size: 0.9rem;
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
  }
</style>
