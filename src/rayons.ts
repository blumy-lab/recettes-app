export const RAYONS = [
  'Fruits & légumes',
  'Viandes & poissons',
  'Crèmerie & œufs',
  'Boulangerie',
  'Épicerie salée',
  'Épicerie sucrée',
  'Surgelés',
  'Boissons',
  'Hygiène & beauté',
  'Entretien',
  'Autre',
] as const

export type Rayon = (typeof RAYONS)[number]

const KEYWORDS: Record<Rayon, string[]> = {
  'Fruits & légumes': [
    'tomate', 'tomates', 'salade', 'laitue', 'carotte', 'carottes', 'oignon', 'oignons',
    'ail', 'échalote', 'échalotes', 'poireau', 'poireaux', 'pomme de terre', 'pommes de terre',
    'patate', 'patates', 'courgette', 'courgettes', 'aubergine', 'aubergines', 'poivron',
    'poivrons', 'brocoli', 'chou', 'choux', 'épinard', 'épinards', 'haricot vert',
    'haricots verts', 'petit pois', 'petits pois', 'champignon', 'champignons',
    'pomme', 'pommes', 'poire', 'poires', 'banane', 'bananes', 'orange', 'oranges',
    'citron', 'citrons', 'fraise', 'fraises', 'raisin', 'mangue', 'avocat', 'avocats',
    'concombre', 'concombres', 'radis', 'persil', 'ciboulette', 'basilic', 'thym',
    'romarin', 'coriandre', 'menthe', 'gingembre', 'fenouil', 'céleri', 'navet',
    'betterave', 'asperge', 'asperges', 'artichaut', 'endive', 'endives', 'légume',
    'fruit', 'herbe', 'herbes',
  ],
  'Viandes & poissons': [
    'boeuf', 'bœuf', 'veau', 'porc', 'poulet', 'dinde', 'agneau', 'canard', 'lapin',
    'viande', 'viandes', 'steak', 'côte', 'côtes', 'filet', 'filets', 'escalope',
    'escalopes', 'saucisse', 'saucisses', 'saucisson', 'jambon', 'lardons', 'bacon',
    'chorizo', 'merguez', 'chipolata', 'nuggets', 'haché', 'hachée',
    'saumon', 'thon', 'cabillaud', 'crevette', 'crevettes', 'moule', 'moules',
    'coquille', 'sardine', 'sardines', 'anchois', 'hareng', 'truite', 'sole',
    'poisson', 'poissons', 'fruit de mer', 'fruits de mer', 'crabe', 'homard',
  ],
  'Crèmerie & œufs': [
    'lait', 'beurre', 'crème', 'fromage', 'fromages', 'yaourt', 'yaourts', 'yogourt',
    'œuf', 'œufs', 'oeuf', 'oeufs', 'gruyère', 'emmental', 'parmesan', 'mozzarella',
    'camembert', 'brie', 'roquefort', 'chèvre', 'feta', 'ricotta', 'mascarpone',
    'crème fraîche', 'crème liquide', 'lait de coco', 'margarine', 'cottage',
    'fromage blanc', 'petit suisse',
  ],
  'Boulangerie': [
    'pain', 'pains', 'baguette', 'baguettes', 'brioche', 'croissant', 'croissants',
    'viennoiserie', 'farine', 'levure', 'levures', 'chapelure', 'biscottes',
    'pain de mie', 'tortilla', 'tortillas', 'naan', 'pita',
  ],
  'Épicerie salée': [
    'pâte', 'pâtes', 'riz', 'spaghetti', 'macaroni', 'tagliatelle', 'gnocchi',
    'quinoa', 'boulgour', 'lentille', 'lentilles', 'pois chiche', 'pois chiches',
    'haricot rouge', 'haricots rouges', 'haricot blanc', 'haricots blancs',
    'conserve', 'boîte de', 'concentré', 'coulis', 'sauce tomate',
    'huile', 'huile d\'olive', 'vinaigre', 'moutarde', 'mayonnaise', 'ketchup',
    'sel', 'poivre', 'épice', 'épices', 'curry', 'cumin', 'paprika', 'cannelle',
    'curcuma', 'bouillon', 'cube', 'soupe', 'bouquet garni',
    'cornichon', 'cornichons', 'câpre', 'câpres', 'olive', 'olives',
    'pesto', 'tapenade', 'sauce soja', 'nuoc mam', 'tabasco',
    'chips', 'biscuit apéritif', 'crackers',
  ],
  'Épicerie sucrée': [
    'sucre', 'miel', 'confiture', 'confitures', 'chocolat', 'chocolats', 'cacao',
    'vanille', 'extrait de vanille', 'sirop', 'caramel', 'nutella', 'pâte à tartiner',
    'biscuit', 'biscuits', 'gâteau', 'gâteaux', 'cookie', 'cookies', 'céréale',
    'céréales', 'muesli', 'compote', 'fruit sec', 'fruits secs', 'raisin sec',
    'amande', 'amandes', 'noisette', 'noisettes', 'noix', 'pistache', 'pistaches',
    'fécule', 'maïzena', 'gélatine', 'agar', 'levure chimique',
  ],
  'Surgelés': [
    'surgelé', 'surgelée', 'surgelés', 'surgelées', 'congelé', 'congelée',
    'glace', 'sorbet', 'pizza surgelée',
  ],
  'Boissons': [
    'eau minérale', 'eau gazeuse', 'soda', 'limonade', 'bière', 'vin blanc', 'vin rouge',
    'champagne', 'cidre', 'café', 'thé vert', 'thé noir', 'infusion', 'lait végétal',
    'boisson énergisante', 'jus d\'orange', 'jus de pomme', 'jus d\'ananas', 'nectar', 'smoothie',
  ],
  'Hygiène & beauté': [
    'shampoing', 'savon', 'dentifrice', 'brosse à dents', 'rasoir', 'déodorant',
    'crème hydratante', 'gel douche', 'après-shampoing', 'maquillage',
  ],
  'Entretien': [
    'lessive', 'liquide vaisselle', 'nettoyant', 'éponge', 'sac poubelle',
    'papier toilette', 'essuie-tout', 'film alimentaire', 'papier aluminium',
  ],
  'Autre': [],
}

export function detectRayon(name: string): Rayon {
  const lower = name.toLowerCase()
  for (const [rayon, keywords] of Object.entries(KEYWORDS) as [Rayon, string[]][]) {
    if (rayon === 'Autre') continue
    if (keywords.some((kw) => lower.includes(kw))) return rayon
  }
  return 'Autre'
}
