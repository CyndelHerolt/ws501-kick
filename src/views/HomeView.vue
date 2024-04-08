<script setup>
</script>

<template>
  <main>
    <article class="home_head">
      <div class="titles">
        <h1>Une interface de visualisation de modèles 3D</h1>
        <h2>Pour mettre en avant les valeurs fortes de vos produits</h2>
      </div>
      <div class="panel">
        <figure style="width: 60%">
          <iframe src="/demo.mp4" width="100%" height="430px"></iframe>
          <figcaption>aperçu du prototype</figcaption>
        </figure>
        <div class="card">
          <div class="progress">
            <div class="progress-bar" style="width: 35%">
              <div class="text">
                <span>35%</span>
              </div>
            </div>
          </div>
          <div class="text">
            <p>17888 €</p>
            <small>Sur un objectif de 51 111 €</small>
          </div>
          <hr>
          <div class="text">
            <p>32</p>
            <small>contributeurs</small>
          </div>
          <hr>
          <div class="text">
            <p>92</p>
            <small>jours restants</small>
          </div>
          <hr>
          <button class="btn-primary">
            Soutenir ce projet
          </button>
          <small class="text-muted">* Ceci est un projet universitaire. Une preuve de concept proposée à une entreprise afin d'exposer le potentiel des technologies 3D dans le web. </small>
        </div>
      </div>
    </article>

    <div class="banner-infos">
      <div>
        <h4>Modularité</h4>
        <p>S'adapte à vos besoins grâce à un paramétrage simple</p>
      </div>
      <div>
        <h4>Simplicité</h4>
        <p>Propose une interface ergonomique et simple d'utilisation</p>
      </div>
      <div>
        <h4>Adaptabilité</h4>
        <p>S'intègre facilement dans vos outils numériques existants</p>
      </div>
    </div>

    <nav class="onglets">
      <RouterLink to="/concept" active-class="active-link">
        Concept
      </RouterLink>
      <RouterLink to="/recompenses" active-class="active-link">
        Récompenses
      </RouterLink>
    </nav>
    <router-view/>
  </main>
</template>

<style scoped>
.bloc {
  display: flex;
}

article .bloc {
  margin-bottom: 50px;
}

.middle {
  width: 50%;
}

figure {
  width: 50%;
  display: flex;
  flex-direction: column;
  align-items: center;

  img {
    width: 90%;
    //background-color: #ffaeae;
  }

  figcaption {
    font-size: small;
    opacity: .8;
  }
}
</style>
