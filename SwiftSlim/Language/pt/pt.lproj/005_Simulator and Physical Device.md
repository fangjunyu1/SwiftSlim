# Simulador e dispositivo físico

Até este ponto, já concluímos a construção das views básicas. O conteúdo principal desta aula é aprender como executar o app no simulador e em um dispositivo físico (Physical Device).

Ainda me lembro da primeira vez que instalei um app no iPhone. Fiquei muito feliz, porque pude ver meu resultado de desenvolvimento de forma mais direta. Esse é um tipo de retorno positivo: quando podemos usar o app que desenvolvemos, o interesse nos leva naturalmente a aprender mais.

Agora, abra o projeto de currículo pessoal concluído na aula anterior e prepare-se para executar no simulador e em um dispositivo físico.

## Simulador

O Xcode inclui vários simuladores, cobrindo diferentes modelos de iPhone, iPad e Apple Watch. O simulador pode ser usado para verificar diferenças de layout da interface em diferentes modelos ou versões.

### Escolher o simulador

Na lista de dispositivos na barra de ferramentas superior do Xcode, escolha um simulador, por exemplo, iPhone 16.

![Swift](../../RESOURCE/005_xcode.png)

### Executar no simulador

Depois, clique no botão de executar no canto superior esquerdo.

![Swift](../../RESOURCE/005_xcode1.png)

O Xcode irá construir o projeto automaticamente e iniciar o simulador.

![Swift](../../RESOURCE/005_xcode2.png)

### Fechar o simulador

Se precisar fechar o simulador, clique no botão de parar na barra de ferramentas do Xcode.

![Swift](../../RESOURCE/005_xcode3.png)

Também é possível fechar o simulador diretamente:

![Swift](../../RESOURCE/005_xcode17.png)

Se você fechar o simulador diretamente, o Xcode pode mostrar:

```swift
Thread 1: signal SIGTERM
```

Isso normalmente não é um erro de lógica do programa, mas ocorre porque o processo de depuração foi encerrado externamente. Em geral, pode ser ignorado e não pertence a um erro da lógica do app.

Em comparação com a pré-visualização do Xcode, o simulador está mais próximo do ambiente real de execução. Mas ainda assim ele não é um ambiente de dispositivo completo. Ele é adequado para validação de layout e testes de adaptação a vários modelos.

## Sobre a prioridade dos ambientes de teste

Em um fluxo de desenvolvimento real, a ordem de teste deve seguir esta prioridade:

dispositivo físico > simulador > pré-visualização do Xcode

A pré-visualização é adequada para ajustes rápidos de UI; o simulador é adequado para testes estruturais; a validação final precisa ser feita em um dispositivo físico, especialmente para operações relacionadas ao iCloud.

## Dispositivo físico

Tanto a pré-visualização do Xcode quanto o simulador podem apresentar resultados imprecisos. Por isso, o dispositivo físico tem importância decisiva. Comportamentos como permissões do sistema, desempenho e mecanismo de notificações só podem ser totalmente validados em um dispositivo físico.

### Ativar o modo de desenvolvedor

No iPhone:

Ajustes → Privacidade e Segurança → Modo de Desenvolvedor → Ativar

![Swift](../../RESOURCE/005_xcode4.png)

O sistema reiniciará o dispositivo à força. Se o modo de desenvolvedor não estiver ativado, não será possível executar a depuração.

### Configurar a equipe de desenvolvimento

O Xcode precisa configurar uma equipe de desenvolvimento; caso contrário, não conseguirá assinar e instalar o app.

Fluxo de configuração:

Nome do projeto → TARGETS → Signing & Capabilities → Team

Se aparecer "Add Account...", significa que ainda não foi adicionada uma conta Apple.

![Swift](../../RESOURCE/005_xcode5.png)

Clique no botão de adicionar e faça login com seu Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

Depois de entrar com o Apple ID, escolha a conta correspondente para concluir a configuração da equipe de desenvolvimento.

![Swift](../../RESOURCE/005_xcode7.png)

### Conectar o dispositivo

Use um cabo para conectar o iPhone ao Mac.

Na primeira conexão:

* O Mac perguntará se deve conectar o iPhone a este Mac
* O iPhone perguntará se este computador é confiável.

É obrigatório tocar em “Confiar” no iPhone e inserir a senha da tela bloqueada. Depois disso, escolha seu iPhone na lista de dispositivos do Xcode.

![Swift](../../RESOURCE/005_xcode9.png)

Clique no botão de executar no canto superior esquerdo.

![Swift](../../RESOURCE/005_xcode1.png)

O Xcode irá construir o app e instalá-lo no iPhone.

![Swift](../../RESOURCE/005_view.png)

**Depuração sem fio**

No iOS 11 e versões posteriores, o Xcode oferece suporte à depuração sem fio.

![Swift](../../RESOURCE/005_xcode18.png)

Pré-requisitos:

1. O primeiro pareamento entre iPhone e Mac deve ser feito com cabo de dados
2. O iPhone e o Mac devem estar na mesma rede Wi-Fi
3. Os dois dispositivos devem permanecer desbloqueados

Depois que o primeiro pareamento for concluído com cabo, nas próximas vezes, mesmo se o cabo for removido, ainda será possível executar diretamente enquanto estiverem na mesma rede.

Observações:

* Se o dispositivo não aparecer na lista, você pode reconectar o cabo
* A depuração por Wi-Fi às vezes é instável; se houver erro de conexão, reconectar o cabo costuma resolver
* Em redes corporativas ou redes isoladas, isso pode ser restrito

## Erros comuns e soluções

Ao conectar o iPhone ao Xcode para depuração, podem aparecer diferentes tipos de mensagens de erro. Abaixo estão alguns problemas comuns e suas soluções correspondentes, que podem ajudar a localizar e resolver rapidamente falhas de conexão.

**1. Pareamento não concluído**

```swift
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Isso significa que o pareamento de depuração entre o Xcode e o iPhone ainda não foi concluído.

Solução: confirme que você já tocou em "Confiar" no iPhone. Se o erro continuar, reinicie o Xcode e reconecte.

**2. Equipe de desenvolvimento não configurada**

```swift
Signing for "SwiftSlimTest" requires a development team.
```

Pode ser que a equipe de desenvolvimento não tenha sido configurada.

Solução: em Signing & Capabilities, selecione a conta já conectada.

**3. Não foi possível montar o Developer Disk Image**

```swift
Previous preparation error: The developer disk image could not be mounted on this device.
```

Isso costuma acontecer quando a instalação é interrompida, por exemplo, ao remover o cabo ou forçar a parada, gerando restrições na reinstalação e causando erro.

Solução: reinicie o iPhone e reconecte o cabo.

**4. Falha na conexão do túnel de depuração**

```swift
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Esse erro é comum quando há interferência de VPN ou proxy de rede.

Solução: desative a VPN ou o proxy de rede e tente novamente.

**5. Dispositivo bloqueado**

```swift
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

O dispositivo está bloqueado. Basta desbloquear o iPhone.

**6. Dispositivo não registrado**

```swift
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Isso significa que o dispositivo não foi adicionado à lista de dispositivos da conta de desenvolvedor, e o Xcode não consegue gerar um perfil de provisionamento válido para assinar e instalar o app.

Solução: clique em "Register Device" para registrá-lo automaticamente.

**7. Versão de implantação incompatível**

```swift
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Isso indica que a versão do sistema do dispositivo é inferior à versão mínima de implantação do projeto.

Caminho para alterar:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Ajuste a versão para um valor que não seja superior à versão do sistema do dispositivo.

Depois da alteração, limpe a pasta de build:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Depois de concluir a limpeza, execute novamente.
