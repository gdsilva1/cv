
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Gabriel D. Silva"
#let locale-catalog-page-numbering-style = context { "Gabriel D. Silva - Página " + str(here().page()) + " de " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Atualizado em Jul 2025"
#let locale-catalog-language = "pt"
#let design-page-size = "a4"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "XCharter"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 9pt
#let design-text-leading = 0.6em
#let design-text-font-family = "XCharter"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "XCharter"
#let design-header-name-font-size = 25pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "XCharter"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "◦"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = true
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Gabriel D. Silva

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Botucatu, SP],
  [#box(original-link("mailto:mail@mail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)mail\@mail.com])],
  [#box(original-link("tel:+55-99-99999-9999")[#fa-icon("phone", size: 0.9em) #h(0.05cm)\(99\) 99999-9999])],
  [#box(original-link("https://linkedin.com/in/gd-silva")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)gd-silva])],
  [#box(original-link("https://github.com/gdsilva1")[#fa-icon("github", size: 0.9em) #h(0.05cm)gdsilva1])],
)
#connections(connections-list)



== Educação


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Universidade Estadual Paulista \(UNESP\)]

#emph[Bacharelado em Engenharia Mecânica]
  ],
  right-content: [
    #emph[Ilha Solteira, SP, Brasil]

#emph[Ago 2018 – hoje]
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Experiência


#two-col-entry(
  left-content: [
    #strong[Estagiário de Manutenção Industrial]

#emph[Embraer SA]
  ],
  right-content: [
    #emph[Botucatu, SP, Brazil]

#emph[Jan 2024 – hoje]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Atuação corporativa em todas as unidades Brasil da Embraer na área de manutenção industrial. A área é responsável pela manutenção predial e dos sistemas vitais das fábricas. Auxiliei em todas as atividades da área, desde acompanhamento de atividades em campo, análise de dados para melhorias estratégicas na área, geração de relatórios, atuação conjunta com a área fiscal, etc.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Gestão de contratos],[Implantação de contratos],[Análise de dados de manutenção],[Visualização de dados \(dashboards\)],[Automatização de processos com Python \(RPAs\)],[Desenvolvimento de aplicativos web para gestão interna \(Django e Dash Plotly\)],[Desenvolvimento de métricas de KPIs de Manutenção],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Estagiário de Projetos de Máquinas]

#emph[IRBI Máquinas e Equipamentos]
  ],
  right-content: [
    #emph[Araçatuba, SP, Brazil]

#emph[Jan 2023 – Fev 2023]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Estágio de férias realizado em uma empresa metalúrgica. O principal produto desenvolvido pela empresa é a sonda oblíqua, usada para coletar amostras de cana-de-açúcar. Atuei no time de engenharia com detalhamentos e modelagem de peças referente aos projetos  de sondas, esteiras, desintegradores e outros produtos.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Modelagem 3D],[Detalhamento de peças],[Acompanhamento de produção das peças],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Assessor da Vice-Presidência]

#emph[Precisão Engenharia]
  ],
  right-content: [
    #emph[Ilha Solteira, SP, Brazil]

#emph[Mar 2020 – Mar 2021]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A empresa tem como objetivo não só ter um primeiro contato com o mundo empresarial, mas também despertar o desejo de empreender nos membros. As atuações principais eram a venda de serviços de engenharia mecânica, como projetos mecânicos, PMOC, ensaios, etc. Atuei principalmente nas áreas administrativas e jurídicas da empresa.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Operações financeiras e jurídicas],[Operações de Recursos Humanos],[Desenvolvimento de processos seletivos],[Assistência na transição entre diretorias],)
  ],
)



== Projetos


#two-col-entry(
  left-content: [
    #strong[Análise do Impacto de Diferentes Modelos de CFD em Parâmetros Aerodinâmicos Uma Abordagem Comparativa dos Resultados Numéricos]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Este projeto é o Trabalho de Conclusão de Curso. Nele, foi investigado o impacto de modelos transicionais em relação a modelos turbulentos em escoamentos em um perfil NACA. Diversas simulações em diferentes condições foram realizadas e os resultados comparados entre si e com dados experimentais.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Escoamento transicional \(laminar-turbulento\)],[Escoamento compressível],[Modelagem matemática],[Equações RANS],[OpenFOAM],)
  ],
  right-content: [
    #emph[Botucatu, SP]

#emph[Ago 2024 – hoje]
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Forecasting Embraer's Electrical Energy Consumption: A Prototype Using Machine Learning Techniques]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A pesquisa é parte do Seminário Embraer de Tecnologia e Inovação e tinha como princpal obejtivo prever o consumo de energia elétrica nos sites da Embraer atrvés do plano de produção. Por altoritmos de machine learning, foi desenvolvido um modelo embrionário, mas eficaz, capaz de prever o consumo mensal de energia elétrica para o site de Botucatu. O modelo tem potencial de ser expandido ao longo de todos os sites da Embraer.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Análise estatística],[Previsão baseada no plano de produção],[Potencial redução de custos],[Modelagem através de algoritmos de Machine Learning],)
  ],
  right-content: [
    #emph[Botucatu, SP]

#emph[Mar 2024 – Set 2024]
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Artificial Neural Networks applied to Unmanned Aerial Vehicle Control]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A pesquisa visa obter um modelo de rede neural artificial \(ANN\) para prever as forças a serem aplicadas em VANTs \(Veículos Aéreos Não Tripulados\) baseado na trajetória a ser percorrida. O projeto consistiu em treinar ANNs com um conjunto de amostras para prever as forças aplicadas no UAV, avaliando a capacidade das redes em acompanhar a trajetória desejada. Os resultados mostraram que, mesmo com uma arquitetura básica e poucos dados, as ANNs conseguiram predizer padrões satisfatórios de força, contribuindo para o controle efetivo do voo, podendo auxiliar no desenvolvimento de sistemas de voos autônomos.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Modelagem de redes neurais artificiais],[Técnicas de machine learning],[Controle de VANTs],[Programação em Python com ênfase em ciência de dados],)
  ],
  right-content: [
    #emph[Ilha Solteira, SP]

#emph[Abr 2023 – Set 2023]
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Determinação da Velocidade de Tráfego após Colisão de Automóveis: Influência dos Parâmetros]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A pesquisa é parte de uma demanda da Polícia Científica do Estado de São Paulo,com foco em verificar a capacidade de se determinar a velocidade de tráfego de veículos a partirde informações que podem ser coletadas por peritos após a colisão. A modelagem emprega umaabordagem Newtoniana, considerando a conservação de momento linear. A velocidade de tráfego éescrita em termos de características dos veículos, da desaceleração em função das forças de frenagem,e das distâncias percorridas. Simulações computacionais foram realizadas para calcular a velocidade detráfego de automóveis após a colisão, considerando a influência de incertezas.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Modelagem de Sistemas],[Dinâmica Veicular],[Engenharia Reversa],[Resolução de Acidentes de Trânsito],)
  ],
  right-content: [
    #emph[Ilha Solteira]

#emph[Set 2021 – Set 2022]
  ],
)



== Habilidades


#one-col-entry(
  content: [#strong[Programação:] Proficiência em Python, com análise\/ciência de dados \(Pandas, Scikit-Learn, PyTorch, Dash Plotly\) e desenvolvimento web \(Django\); ótimo entendimento de Linux e Git]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Ferramentas de produtividade:] ótimo conhecimeto em ferramentas Office \(Office 365 e LibreOffice\), proficiente em LaTeX para produção de relatórios e documentos científicos]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Engenharia:] Bom entendimento de ferramentas CAD 3D e workflow com simulações de CFD \(geração de malha, pré e pós processamento\); bom entendimento de softwares de fluidodinâmica computacional \(OpenFOAM\)]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Idiomas:] Inglês \(C1\), Português \(nativo\)]
)


