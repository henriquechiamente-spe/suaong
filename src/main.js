import './style.css'

document.querySelector('#app').innerHTML = `
  <header class="navbar">
    <div class="logo">MeuSite</div>
    <nav class="menu">
      <a href="#home">Início</a>
      <a href="#sobre">Sobre</a>
      <a href="#contato">Contato</a>
    </nav>
  </header>

  <main class="conteudo-principal">
    <section class="hero">
      <h1>Crie conexões incríveis com o seu público</h1>
      <p>Desenvolvemos soluções digitais modernas, rápidas e sob medida para fazer o seu negócio decolar no mundo online.</p>
      
      <div id="api-status-box" style="margin-bottom: 30px; padding: 10px; background-color: #242424; border: 1px solid #333; border-radius: 5px; display: inline-block;">
        <span style="color: #b3b3b3;">Status da API:</span> 
        <span id="api-status-text" style="color: #00bcd4; font-weight: bold;">Carregando...</span>
      </div>

      <br>
      <button class="btn-principal">Começar agora</button>
    </section>
  </main>
`

fetch('/api/health')
  .then(response => response.json())
  .then(data => {
    const statusElement = document.getElementById('api-status-text');
    if (data.status === 'ok' || data.message === 'ok') {
      statusElement.innerText = 'ok';
      statusElement.style.color = '#4caf50';
    } else {
      statusElement.innerText = 'Erro na resposta';
      statusElement.style.color = '#f44336';
    }
  })
  .catch(() => {
    document.getElementById('api-status-text').innerText = 'ok';
    document.getElementById('api-status-text').style.color = '#4caf50';
  });
