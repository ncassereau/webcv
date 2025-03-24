<script module lang="ts">

export async function* generate() {
    const markdownTestData = [
    { 
        id: 1, 
        name: "# Titres et formatage de texte\n\n## Sous-titre h2\n\n### Sous-titre h3\n\nTexte normal avec **gras**, *italique*, et ***gras-italique***.\n\n~~Texte barré~~ et `code inline`.\n" 
    },
    { 
        id: 2, 
        name: "# Listes\n\n## Liste à puces\n\n- Premier élément\n- Deuxième élément\n  - Sous-élément imbriqué\n  - Autre sous-élément\n- Troisième élément\n\n## Liste numérotée\n\n1. Premier élément\n2. Deuxième élément\n   1. Sous-élément imbriqué\n   2. Autre sous-élément\n3. Troisième élément\n" 
    },
    { 
        id: 3, 
        name: "# Citations et séparateurs\n\n> Ceci est une citation.\n> \n> Elle peut contenir plusieurs paragraphes.\n\nTexte normal après la citation.\n\n---\n\nTexte après un séparateur horizontal.\n" 
    },
    { 
        id: 4, 
        name: "# Liens et images\n\n[Lien vers Google](https://www.google.com)\n\n<https://example.com> - Lien automatique\n" 
    },
    { 
        id: 5, 
        name: "# Tableaux\n\n| En-tête 1 | En-tête 2 | En-tête 3 |\n| --------- | --------- | --------- |\n| Cellule 1 | Cellule 2 | Cellule 3 |\n| Ligne 2   | Données   | Autres    |\n| Ligne 3   | Texte     | Contenu   |\n" 
    },
    { 
        id: 6, 
        name: "# Blocs de code\n\n```javascript\nfunction hello() {\n  console.log('Bonjour le monde!');\n  return true;\n}\n\n// Un commentaire\nconst test = 123;\n```\n\n```css\nbody {\n  font-family: sans-serif;\n  color: #333;\n  margin: 0;\n  padding: 20px;\n}\n```\n" 
    },
    { 
        id: 7, 
        name: "# Listes de tâches\n\n- [x] Tâche terminée\n- [ ] Tâche à faire\n- [ ] Autre tâche à faire\n  - [ ] Sous-tâche imbriquée\n  - [x] Sous-tâche terminée\n" 
    },
    { 
        id: 8, 
        name: "# Détails dépliables\n\n<details>\n  <summary>Cliquez pour afficher plus d'informations</summary>\n  \n  Ce contenu est masqué par défaut et s'affiche quand on clique sur le titre.\n  \n  - Il peut contenir du Markdown\n  - Comme des listes\n  - Ou du **texte formaté**\n</details>\n" 
    },
    { 
        id: 9, 
        name: "# Échappement de caractères spéciaux\n\nSymboles échappés: \\* \\_ \\~ \\` \\# \\[ \\] \\( \\) \\.\n\nEmojis: 👍 🎉 🚀 💡 ⚠️\n" 
    },
    { 
        id: 10, 
        name: "# Combinaison d'éléments\n\n## Liste avec code\n\n- Item avec `code inline`\n- Item avec **texte en gras**\n\n## Tableau avec formatage\n\n| *Italique* | **Gras** | `Code` |\n| ---------- | -------- | ------ |\n| Contenu    | Contenu  | Contenu |\n\n> Citation contenant une liste:\n> - Premier point\n> - Second point\n> \n> Et du `code inline`.\n" 
    }
    ];
    await new Promise(resolve => setTimeout(resolve, 1000));
    for (const item of markdownTestData) {
        await new Promise(resolve => setTimeout(resolve, 50));
        yield item;
    }
}

</script>
