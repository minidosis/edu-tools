<script>
  let editing = false;

  const story = {
    title: "La Fada Serafina",
    body: [
      "Hi havia una vegada una fada que tenia por",
      "de volar i, per això no tenia amigues, i les",
      "altres fades se’n reien d’ella.",
      "A la fada Serafina li encantava anar amb",
      "moto. El vent li movia la falda. Un dia que",
      "feia molt de vent les faldes li van tapar la",
      "cara i, la fada Serafina, va caure damunt",
      "una paret de roques.",
      "Es va fer un bony al cap i va anar a",
      "l’hospital de fades perquè la curessin. Però la",
      "fada doctora no era allà, així que la Serafina",
      "es va tapar el bony amb un mocador ben",
      "vermell passat pel cap.",
      "I les altres fades, quan la varen veure, també",
      "volgueren dur un mocador pel cap. Així que,",
      "na Serafina es va posar a cosir mocadors,",
      "perquè cada matí, al seu portal es trobava",
      "amb una cua ben llarga de fades que volien",
      "un mocador."
    ]
  };

  $: annotatedBody = countWords(story.body);

  const countWords = body => {
    let partial = 0;
    let annotatedBody = [];
    for (let i = 0; i < body.length; i++) {
      annotatedBody.push({ partial, text: body[i] });
      const numWords = body[i].split(" ").filter(s => s.length > 0).length;
      partial += numWords;
    }
    return annotatedBody;
  };

  let titleElem;
  let textareaElem;

  const changeStory = () => {
    story.title = titleElem.textContent;
    story.body = textareaElem.value.split("\n");
    editing = false;
  };
</script>

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
          <button on:click="{changeStory}">
            <div class="check"></div>
          </button>
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
        <button on:click="{() => (editing = true)}">🖉</button>
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
  @font-face {
    font-family: Escolar;
    src: url(/escolar.ttf);
  }
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
    box-shadow: 1px 1px 5px #ccc;
    border-radius: 0.3rem;
    min-width: 28rem;
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
    padding-right: 0.6rem;
    color: gray;
  }
  .doc td:nth-child(2) {
    margin-top: 0;
    font-size: 1.4rem;
  }
  .doc h2 {
    margin-bottom: 0.5rem;
    margin-top: 0.2rem;
  }
  .doc button {
    position: absolute;
    display: flex;
    justify-content: center;
    align-items: center;
    top: 0.25rem;
    right: 0.25rem;
    width: 2.5rem;
    height: 2.5rem;
    padding: 0.4rem 0.6rem 0.3rem;
    background-color: orange;
    border: 1px solid white;
    border-radius: 1.25rem;
    font-size: 1.2rem;
  }
  .doc button:hover {
    border: 1px solid rgb(202, 138, 18);
  }
  .doc textarea {
    font-family: Escolar;
    min-width: 26rem;
    min-height: 35rem;
    font-size: 1.4rem;
    line-height: 1.3;
  }
  #stats {
    max-width: 9rem;
  }
  #stats table {
    border-collapse: collapse;
    margin-bottom: 1em;
  }
  #stats td,
  #stats th {
    border: 1px solid black;
    padding: 0.3rem 0.3rem 0;
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
    background-color: black;
  }

  @media print {
    .doc button {
      display: none;
    }
  }
</style>
