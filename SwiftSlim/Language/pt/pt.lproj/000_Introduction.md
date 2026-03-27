# Introdução

## O que é Swift?

Antes de aprender Swift, vamos primeiro entender brevemente a linguagem de programação Swift. Swift é uma linguagem de programação moderna desenvolvida pela Apple, usada principalmente para criar aplicativos para plataformas Apple, como iOS, macOS, iPadOS e watchOS.

![Swift](../../RESOURCE/000_swift.png)

Em comparação com outras linguagens de programação, Swift tem uma sintaxe mais simples e dá mais ênfase à segurança e à legibilidade. Combinado com SwiftUI, fica mais fácil de aprender e compreender. Claro, como eu não havia estudado outras linguagens de programação antes, talvez ele seja um pouco mais difícil do que HTML.

Swift não serve apenas para desenvolver aplicativos nas plataformas Apple. A comunidade Swift está trabalhando para portar Swift para a plataforma [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/) e até mesmo executá-lo em outros ambientes, como [servidores](https://github.com/awslabs/swift-aws-lambda-runtime). Do ponto de vista do desenvolvimento a longo prazo, Swift tem um espaço de crescimento maior e, no futuro, pode ter a oportunidade de se tornar uma linguagem de programação multiplataforma semelhante ao Flutter e ao React Native.

## Conteúdo de aprendizagem

Este tutorial é focado principalmente nos conhecimentos básicos de Swift e SwiftUI.

Começaremos com variáveis simples e tipos de dados, construiremos interfaces com SwiftUI, entenderemos como os dados são armazenados e lidos e, por fim, talvez avancemos para conteúdos mais avançados, como SwiftData e sincronização com iCloud.

Cada capítulo será desenvolvido em torno de um caso prático, aprendendo conhecimentos de Swift em aplicações reais.

Alguns tutoriais podem primeiro explicar de forma concentrada uma grande quantidade de sintaxe e APIs, e só depois entrar na prática com projetos. Para iniciantes, isso é como uma criança aprender palavras a partir de um dicionário: memorizar uma grande quantidade de conteúdo sem um contexto de aplicação acaba apenas fazendo o iniciante perder o interesse.

Neste tutorial, o conhecimento será aprendido dentro de cenários reais de desenvolvimento, usando necessidades concretas para introduzir os pontos de conhecimento relacionados.

Depois de concluir este tutorial, você será capaz de desenvolver e executar de forma independente um aplicativo básico, instalá-lo em seus próprios dispositivos iOS / macOS e também publicá-lo na App Store.

## Como aprender do zero?

No começo, eu também era completamente iniciante. No início, apenas assisti a alguns episódios de [vídeos de ensino de Swift](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) no YouTube e percebi que desenvolver aplicativos iOS não era tão complicado, o que despertou certo interesse em mim. Depois disso, comecei a tentar aprender mais conhecimentos de Swift. Por exemplo, experimentei os jogos de programação do [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), li a [documentação oficial do Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) e estudei o [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Olhando agora, foi principalmente o [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) que me forneceu uma estrutura de aprendizagem, permitindo que eu estudasse SwiftUI de forma sistemática. No entanto, como o tutorial estava em inglês e eu não tinha base em programação, encontrei muitas dificuldades no processo de compreensão. Para isso, usei IA, como [ChatGPT](https://chatgpt.com/) e [Claude](https://claude.ai/?redirect=claude.com), para me ajudar a entender os pontos de conhecimento.

Durante o processo de aprendizagem, é inevitável encontrar conteúdos difíceis de entender. Lembro que, ao aprender UserDefaults, eu só sabia como salvar dados, mas não sabia que os dados precisavam ser lidos manualmente, a ponto de suspeitar que havia algum problema no meu código. Mesmo um ponto tão simples me fez perder vários dias.

Outro exemplo são conceitos como closures, thread principal e genéricos. No início do meu aprendizado, como eu não conseguia compreendê-los profundamente, quando encontrava esses conhecimentos novamente no desenvolvimento real, precisava gastar energia para estudá-los outra vez.

Por isso, meu conselho é:

**1. Complemente os conhecimentos básicos**

Na China existe um ditado que diz: “tudo é difícil no começo”. Para iniciantes absolutos em Swift, é inevitável encontrar alguns pontos difíceis de compreender durante o aprendizado — e, muitas vezes, isso não significa que o conteúdo em si seja tão complexo, mas sim que, na base dessa pirâmide de conhecimento, ainda existem conceitos mais fundamentais aos quais o iniciante ainda não teve contato.

Quando isso acontecer, você pode considerar usar ferramentas de IA, como [ChatGPT](https://chatgpt.com/) e [Claude](https://claude.ai/?redirect=claude.com), para preencher rapidamente os conhecimentos básicos que estão faltando.

**2. Entenda cada ponto de conhecimento**

Durante o aprendizado, o mais importante é tentar compreender cada ponto de conhecimento, mesmo que isso exija vários dias.

Se você optar por pular um conteúdo que não entendeu, é muito provável que volte a encontrá-lo no desenvolvimento futuro e que ele atrapalhe seu progresso. No fim, você ainda terá que investir tempo para estudá-lo novamente. Em vez de remediar depois, é melhor compreender bem o conhecimento ainda na fase de aprendizado.

Cada ponto de conhecimento é, em essência, uma ferramenta — quanto mais ferramentas você dominar, maior será sua capacidade de resolver problemas.

É como construir uma casa: se você tiver apenas uma ferramenta nas mãos, ainda poderá concluir a maior parte do trabalho com dificuldade, mas, diante de exigências de qualidade mais altas, isso se mostrará insuficiente. Dominar mais ferramentas é o que permite construir uma casa mais sólida.

**3. Mantenha a aprendizagem contínua**

Aprender exige persistência no longo prazo. Pouquíssimas pessoas estão realmente dispostas a dedicar alguns meses para estudar um tutorial com seriedade. Investir tempo de forma contínua é mais importante do que estudar com alta intensidade por um curto período.

Mesmo que você complete apenas um por cento por dia, em cem dias poderá concluir todo o objetivo de aprendizagem.

## Visão educacional

Este curso não ensinará uma quantidade excessiva de conhecimentos de Swift e SwiftUI, mas sim conduzirá o iniciante para a estrada da programação com Swift. É como montar blocos de construção — o tutorial é responsável por explicar como encaixá-los, e o restante do tempo será para você montar os seus próprios blocos.

O projeto já está disponível em código aberto no [GitHub](https://github.com/fangjunyu1/SwiftSlim), podendo ser baixado e usado gratuitamente. Ao mesmo tempo, também há uma versão na App Store para experimentação.

Esperamos ajudar mais pessoas sem formação técnica, mas que desejam mudar sua trajetória profissional, a obter novas possibilidades por meio do aprendizado de programação e do desenvolvimento de aplicativos.

## Atualizações de conteúdo

Este tutorial foi escrito com base na versão atual do Swift e do SwiftUI.

À medida que as plataformas Apple e as ferramentas forem sendo atualizadas, algumas APIs poderão mudar. Caso encontre problemas ou perceba que o conteúdo precisa ser atualizado, consulte a documentação oficial ou a versão mais recente do repositório open source.

---

Fang Junyu

2026-02-14
