<script>
  import ToolButton from "../components/ToolButton.svelte";
</script>

<ul>
  <li>
    <ToolButton id="dibuix-instruccions" name="Dibuix Instruccions">
      Per preparar siluetes en una graella per dibuixar amb instruccions amunt,
      avall, dreta i esquerra.
    </ToolButton>
  </li>
  <li>
    <ToolButton id="velocitat-lectura" name="Velocitat de Lectura">
      Per preparar fulls de velocitat de lectura per nens de 1r de primària
    </ToolButton>
  </li>
</ul>

<style>
  ul {
    margin: 0;
    padding-left: 0;
    list-style-type: none;
  }
  li {
    display: inline-block;
    margin-right: .5rem;
  }
</style>
