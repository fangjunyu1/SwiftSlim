# Conhecendo o Xcode

## O que é o Xcode

Xcode é o ambiente de desenvolvimento integrado (IDE, Integrated Development Environment) oficial fornecido pela Apple, usado para desenvolver aplicativos para plataformas Apple, como iOS, macOS, watchOS e tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Durante todo o processo de ensino, usaremos o Xcode para escrever código e executar programas.

Nesta aula, aprenderemos como baixar o Xcode, criar o primeiro aplicativo iOS e conhecer inicialmente a estrutura da interface do Xcode.

## Baixar o Xcode

Atualmente, o Xcode pode ser instalado de duas formas:

1、Baixar pela [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2、Baixar pelo [site oficial do Apple Developer](https://developer.apple.com/xcode/)

As duas formas permitem baixar o Xcode. A diferença é que, no site oficial do Apple Developer, além da versão estável, também é possível baixar versões [Beta](https://developer.apple.com/download/all/?q=Xcode) ou versões antigas.

Se for apenas para aprender desenvolvimento, recomenda-se usar a versão estável. A versão Beta é usada principalmente para testar novos recursos e pode apresentar instabilidades.

## Criando o primeiro projeto

Depois de abrir o Xcode, você verá a tela inicial.

![Swift](../../RESOURCE/001_xcode1.png)

No lado esquerdo, há três opções comuns:

* Create New Project —— Criar novo projeto
* Clone Git Repository —— Clonar repositório Git
* Open Existing Project —— Abrir projeto existente

No lado direito, são exibidos os projetos Xcode abertos recentemente.

Vamos escolher a opção "Create New Project".

### Escolher o modelo do projeto

![Swift](../../RESOURCE/001_xcode2.png)

Ao entrar na tela de seleção de modelo de projeto, você verá várias plataformas (iOS, macOS etc.) e diferentes tipos de modelos de projeto.

Descrição dos modelos mais comuns:

* App —— O tipo de aplicativo mais básico (recomendado)
* Document App —— Aplicativo baseado em documentos
* Game —— Usado para desenvolvimento de jogos
* Framework —— Módulo reutilizável

Na fase inicial, escolheremos apenas o modelo "iOS" - "App", porque este é o tipo de aplicativo com interface.

Clique em "Next".

### Preencher as informações do projeto

Ao entrar na tela de preenchimento das informações do projeto, precisamos preencher os campos de acordo com o tipo de cada um.

![Swift](../../RESOURCE/001_xcode3.png)

O significado de cada campo:

* Product Name —— Nome do projeto, por exemplo: SwiftSlimTest
* Team —— Equipe de desenvolvedor; se você não tiver uma conta Apple Developer paga, pode deixar sem selecionar
* Organization Identifier —— Identificador da organização, normalmente usando o formato de domínio reverso, por exemplo:

  * com.yourname
  * com.yourcompany
  * Se você não tiver um domínio, pode usar o seu nome em inglês como identificador
* Bundle Identifier —— Identificador único do aplicativo, gerado automaticamente a partir de Organization Identifier e Product Name
* Interface —— Tecnologia de interface, selecione SwiftUI
* Language —— Linguagem de desenvolvimento, selecione Swift
* Testing System —— Por padrão, será criado um alvo de teste (Unit Tests), que pode ser ignorado na fase inicial
* Storage —— Framework de persistência de dados local, que pode integrar SwiftData ou Core Data automaticamente; na fase inicial, pode ser ignorado

Depois de preencher tudo, clique em "Next".

### Salvar o projeto

![Swift](../../RESOURCE/001_xcode4.png)

Escolha uma pasta adequada para salvar o projeto.

Clique no botão "Create", e o Xcode gerará automaticamente a estrutura do projeto.

## Estrutura do projeto Xcode

Depois de salvar o projeto Xcode, você poderá ver a pasta do projeto gerada no Finder.

![Swift](../../RESOURCE/001_xcode5.png)

* Assets.xcassets —— Pasta usada para armazenar imagens, ícones do aplicativo e outros recursos

* ContentView.swift —— Arquivo de visualização SwiftUI gerado por padrão; mais adiante, escreveremos aqui o código da interface.

* SwiftSlimTestApp.swift —— Arquivo de entrada do aplicativo (App Entry Point), responsável por iniciar o aplicativo; por enquanto, não precisamos entendê-lo.

* SwiftSlimTest.xcodeproj —— Arquivo do projeto Xcode; basta clicar duas vezes nele para abrir o projeto.

## Conhecendo a interface do Xcode

Clique duas vezes no arquivo .xcodeproj para abrir o projeto e, na área Navigator à esquerda, selecione o arquivo ContentView.swift.

A interface do Xcode é composta principalmente por cinco áreas:

* Navigator —— Área de navegação, usada para visualizar a estrutura de arquivos e pesquisar
* Editor —— Área de edição, usada para escrever código Swift ou SwiftUI
* Canvas —— Área de tela, usada para pré-visualização do SwiftUI
* Inspector —— Área de inspeção de propriedades, usada para visualizar e modificar propriedades do arquivo
* Debug Area —— Área de depuração, usada para visualizar logs de saída

![Swift](../../RESOURCE/001_xcode6.png)

Observação: o Canvas é usado principalmente para a pré-visualização de views do SwiftUI. Do ponto de vista da arquitetura oficial do Xcode, ele é um painel auxiliar de pré-visualização do Editor (Preview Pane). O Canvas só pode ser ativado ao abrir arquivos de view do SwiftUI; outros tipos de arquivo não exibem a função de pré-visualização.

Nas aulas seguintes, escreveremos principalmente código Swift e SwiftUI na área Editor.

Na primeira vez que você abrir um projeto Xcode, o Inspector e a Debug Area podem estar ocultos por padrão; você pode clicar nos botões no canto superior direito e no canto inferior direito para exibi-los.

![Swift](../../RESOURCE/001_xcode7.png)

Dica: a área Inspector é usada principalmente para visualizar e modificar propriedades de arquivos. No desenvolvimento real, essa área normalmente fica oculta para obter mais espaço de edição.

## Resumo

Nesta aula, aprendemos como baixar o Xcode, criar o primeiro projeto Xcode e entender a disposição básica da interface do Xcode.

Abaixo está o tempo de prática livre:

* Você pode tentar criar e excluir arquivos na área Navigator.
* Ver o código na área Editor e observar a estrutura do código.
* Ver os botões da área Canvas e tentar ampliar e reduzir a visualização de prévia.

Na próxima aula, começaremos a escrever alguns códigos simples, o que também nos ajudará a entender melhor o Xcode.
