<script>
  import ActionButton from "../../components/ActionButton.svelte";
  import Button from "../../components/Button.svelte";
  import Help from "../../components/Help.svelte";
  import { KEY_VELOCITAT_LECTURA } from "../../config";
  import placeholderStory from "./placeholderStory";

  let editing = false;
  let story;

  const loadStory = () => {
    try {
      const storyJson = localStorage.getItem(KEY_VELOCITAT_LECTURA);
      story = JSON.parse(storyJson);
      if (!story) {
        story = placeholderStory;
      }
    } catch (e) {
      story = placeholderStory;
    }
  };

  loadStory();

  $: annotatedBody = countWords(story.body);

  const countWords = (body) => {
    let partial = 0;
    let annotatedBody = [];
    for (let i = 0; i < body.length; i++) {
      annotatedBody.push({ partial, text: body[i] });
      const numWords = body[i].split(" ").filter((s) => s.length > 0).length;
      partial += numWords;
    }
    return annotatedBody;
  };

  let titleElem;
  let textareaElem;

  const changeStory = () => {
    story = {
      title: titleElem.textContent,
      body: textareaElem.value.split("\n"),
    };
    localStorage.setItem(KEY_VELOCITAT_LECTURA, JSON.stringify(story));
    editing = false;
  };
</script>

<Help id="dibuix-instruccions">
  <ul>
    <li>
      <strong>Clica el llapis</strong>
      per poder editar el títol i el text.
    </li>
    <li>
      Els
      <strong>salts de línia</strong>
      els has de posar tu manualment. Els comptatges de paraules es recalculen
      automàticament.
    </li>
    <li>
      Quan hagis acabat, clica el botó de confirmació i simplement
      <strong>imprimeix</strong>
      la pàgina.
    </li>
    <li>
      Per generar un PDF, instal·la algun programa que et permeti
      <strong>imprimir a PDF</strong>
      en comptes de la impressora.
    </li>
  </ul>
</Help>

<div class="root">
  <div class="header">
    <h1>Velocitat Lectora</h1>
    <div id="signatura">
      <span class="nom">Nom:</span>
      <p class="nom" contenteditable="true"></p>
      <span class="data">Data:</span>
      <p class="data" contenteditable="true"></p>
    </div>
  </div>

  <div id="main">
    <div class="doc">
      {#if editing}
        <div class="edit">
          <h2 contenteditable="true" bind:this="{titleElem}">{story.title}</h2>
          <textarea
            bind:this="{textareaElem}"
            value="{story.body.join('\n')}"
          ></textarea>
          <ActionButton on:click="{changeStory}" hint="Salva">
            <div class="check"></div>
          </ActionButton>
        </div>
      {:else}
        <table>
          <tr>
            <td></td>
            <td>
              <h2>{story.title}</h2>
            </td>
          </tr>
          {#each annotatedBody as line}
            <tr>
              <td>
                <span>{line.partial}</span>
              </td>
              <td>{line.text}</td>
            </tr>
          {/each}
        </table>
        <ActionButton on:click="{() => (editing = true)}" hint="Edita">
          🖉
        </ActionButton>
      {/if}

    </div>

    <div id="stats">
      <p>Lectura de tot el text (temps en minuts)</p>
      <table>
        <tr>
          <th>El 1r dia</th>
          <td></td>
        </tr>
      </table>

      <p>Cada dia llegeixo durant 1 minut i compto les paraules</p>
      <table>
        <tr>
          <th>Dia 1</th>
          <td></td>
        </tr>
        <tr>
          <th>Dia 2</th>
          <td></td>
        </tr>
        <tr>
          <th>Dia 3</th>
          <td></td>
        </tr>
        <tr>
          <th>Dia 4</th>
          <td></td>
        </tr>
        <tr>
          <th>Dia 5</th>
          <td></td>
        </tr>
        <tr>
          <th>Dia 6</th>
          <td></td>
        </tr>
        <tr>
          <th>Dia 7</th>
          <td></td>
        </tr>
      </table>

      <p>Lectura de tot el text (temps en minuts)</p>
      <table>
        <tr>
          <th>Últim dia</th>
          <td></td>
        </tr>
      </table>
    </div>
  </div>
</div>

<style>

  .root {
    margin: auto;
    font-size: 1.4rem;
    font-family: Escolar;
    padding: 0.5rem;
  }
  h1 {
    margin: 0;
  }
  .header {
    margin-bottom: 2.5rem;
    font-size: 1.2rem;
  }
  .header h1 {
    margin-bottom: 1rem;
    border-bottom: 1px solid black;
  }
  #signatura {
    display: flex;
    justify-content: center;
    font-size: 1.5rem;
  }
  #signatura p {
    flex: 1;
    margin: 0;
    border-bottom: 1px solid #ccc;
  }
  #signatura span {
    font-weight: bold;
    color: #777;
    margin-right: 1rem;
  }
  #signatura p.nom {
    flex: 3;
  }
  #signatura p.data {
    flex: 2;
  }
  #signatura span.data {
    margin-left: 2rem;
  }
  #main {
    display: flex;
    flex-direction: row;
    justify-content: center;
  }
  .doc {
    padding: 2rem 2rem 2rem 0.5rem;
    box-shadow: 0px 2px 5px #ccc;
    min-width: 30rem;
  }
  .doc {
    position: relative;
    margin-bottom: 2rem;
    margin-right: 1.5rem;
    display: flex;
    flex-direction: row;
  }
  .doc td {
    vertical-align: baseline;
  }
  .doc td:nth-child(1) {
    text-align: right;
  }
  .doc td:nth-child(1) span {
    padding-right: 0.8rem;
    color: rgb(158, 158, 158);
    font-size: 0.6em;
  }
  .doc td:nth-child(2) {
    margin-top: 0;
    font-size: 1.4rem;
    font-weight: 500;
    color: black;
  }
  .doc h2 {
    margin-bottom: 0.5rem;
    margin-top: 0.2rem;
  }
  .doc textarea {
    font-family: Escolar;
    min-width: 29rem;
    min-height: 35rem;
    font-size: 1.4rem;
    line-height: 1.3;
  }
  #stats {
    max-width: 9rem;
    font-size: 0.8em;
  }
  #stats table {
    border-collapse: collapse;
    margin-bottom: 1em;
  }
  #stats td,
  #stats th {
    border: 1px solid black;
    padding: 0.3rem 0.5rem 0;
  }
  #stats td {
    width: 2.5rem;
    height: 2rem;
  }

  .edit {
    margin-left: 2rem;
  }
  .edit h2 {
    border: 2px solid rgba(255, 166, 0, 0.527);
  }
  .edit textarea {
    border: 2px solid rgba(255, 166, 0, 0.527);
  }
  div.check {
    width: 1rem;
    height: 1rem;
    clip-path: polygon(0 44%, 33% 79%, 100% 0, 100% 23%, 34% 100%, 0 65%);
    background-color: white;
  }

  @media print {
    .doc button {
      display: none;
    }
    .root * {
      color: black;
    }
  }
</style>
