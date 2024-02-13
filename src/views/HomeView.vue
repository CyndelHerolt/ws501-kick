<script setup>
</script>

<template>
  <main>
    <article class="home_head">
      <h1>Une interface de visualisation en 3D</h1>
      <h2>Mettre en avant les valeurs fortes des produits</h2>
      <small>Shams Benhamou - Sam Cherpin - Cyndel Herolt</small>
    </article>
    <div class="chevron">
      <img src="/chevron-down-solid.svg" alt="scroll down" width="40">
    </div>
<!--    <div class="bloc">-->
      <article>
        <h2>
          Concept
        </h2>
        <p>
          <em>
            Un viewer 3D universel et configurable.
          </em>
        </p>
        <p>
          Notre plateforme offre une expérience immersive où les utilisateurs peuvent importer facilement leurs propres
          modèles 3D et enrichir chaque détail avec des informations spécifiques. Imaginez pouvoir explorer un modèle
          architectural complexe et ajouter des annotations directement sur chaque élément structurel, ou annoter des
          caractéristiques critiques sur un prototype de produit en développement. Notre viewer 3D offre une interface
          intuitive qui permet à quiconque, des amateurs aux professionnels, d'interagir avec des modèles 3D de manière
          informative et engageante. Rejoignez-nous dans cette aventure pour façonner le futur de la visualisation 3D !"
        </p>
        <p>
          Utilisable aussi bien comme support d'informations qu'en configurateur, l'outil offre une interface de
          configuration afin de le façonner en fonction de vos besoins. Sa modularité permet des utilisations bien
          distinctes.
        </p>
      </article>
<!--      <figure>-->
<!--        <img src="/configurateur.png" alt="aperçu du prototype">-->
<!--        <figcaption>aperçu du prototype</figcaption>-->
<!--      </figure>-->
<!--    </div>-->

    <article>
      <h2>
        Déclinaisons d'utilisation
      </h2>
      <div class="bloc">
        <div class="middle">
          <h3>Visualisation avant l'achat</h3>
          <p>
            Avant l’achat d’un produit, le client souhaite bien entendu pouvoir savoir ce qu’il achète et ce parfois
            même
            avant la fabrication du dit produit. Or, il n’a souvent pour cela qu’accès à des photos ou des
            représentations
            statiques sans grande interactivité. C’est là que la 3D peut jouer son rôle : avec une représentation
            dynamique
            et en 3D d’un produit, le, client est en mesure de le manipuler, d’en observer les proportions, et de
            comparer
            les différents modèles. Il est donc mieux armé pour faire son choix. Ainsi, l’expérience proposée n’est pas
            seulement utile, elle est aussi ludique, ce qui peut aussi pousser plus facilement à l’achat.
          </p>
        </div>
        <figure>
          <img src="/configurateur1.png" alt="">
          <figcaption>

          </figcaption>
        </figure>
      </div>

      <div class="bloc">
        <figure>
          <img src="/configurateur.png" alt="">
          <figcaption>

          </figcaption>
        </figure>
        <div class="middle">
          <h3>Visualisation des composants d'un produit</h3>
          <p>
            Les clients sont de plus en plus intéressés par les processus de fabrication et les composants des produits
            dont
            ils font l’acquisition. Ces aspects sont d’ailleurs devenus de véritables arguments de vente, notamment dans
            le
            cas de fabricants qui axent leur communication sur des processus de production locaux et/ou éco-responsable.
            <br>
            La 3D permet de simplifier cette communication autour de la fabrication ou même du fonctionnalité d’un
            produit.
            L’interactivité offerte par la 3D permet au client avec un simple geste de sa souris sur un élément de
            l’objet
            d’accéder à des information supplémentaire.
          </p>
        </div>
      </div>
      <h3>Personnalisation de produits</h3>
      <div class="bloc">
        <div class="middle">
          <h4>Pour le client</h4>
          <p>
            Il arrive que plusieurs déclinaisons possibles d’un même produit soient proposées au client, qu’il s’agisse
            de
            couleurs ou même de matériaux différents. En plus d’une simple visualisation, on peut facilement imaginer
            des
            cas ou le client souhaite être impliqué dans les choix et les combinaison des différents aspects modifiables
            du
            produit qu’il souhaite acheter. Ainsi, qu’il s’agisse d’aspects modifiables prédéfinis ou d’objets fabriqués
            sur
            mesure, la 3D permet au client de visualiser directement ses choix et de tester des combinaisons dans le
            périmètre de limites seulement définies par le fabricant.
          </p>
        </div>
        <figure>
          <img src="/configurateur3.png" alt="">
          <figcaption>

          </figcaption>
        </figure>
      </div>
      <div class="bloc">
        <figure>
          <img src="/configurateur2.png" alt="">
          <figcaption>

          </figcaption>
        </figure>
        <div class="middle">
          <h4>Pour l'entreprise</h4>
          <p>
            La configuration interactive en 3D s’intègre aussi parfaitement au processus de conception, durant lequel on
            a
            souvent besoin de tester et de simuler différents éléments de création avant de passer à la production
            matérielle. On peut alors se projeter avant d’engager des coûts réels.
          </p>
        </div>
      </div>
    </article>
    <article>
      <h2>Où en est le projet ?</h2>
      <p>
        Le projet ayant été lancé mi-février 2024, nous avons pour l'instant commencé à développer un premier prototype
        qui n'en est qu'à ses balbutiements. Nous avons malgré tout pris le temps de mettre à plat les besoins et
        ambitions relatifs à l'outil afin de pouvoir suivre un processus de développement organisé qui va à l'essentiel.
      </p>
    </article>
    <article>
      <h2>La Team</h2>

    </article>
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
