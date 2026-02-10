# minilogo
Um mini interpretador de logo escrito em MSX Basic

[![English](https://img.shields.io/badge/language-English-blue)](README.md) [![Português](https://img.shields.io/badge/language-Português-green)](README.pt.md)

# O quê é isso?

Você usa comandos para mover uma tartaruga triangular na tela do seu computador e desenhar.

# Por quê?

Eu acordei com vontade de escrever algo. Gosto de LOGO, gosto de BASIC, gosto de MSX, então por que não?

# Como?

Execute o programa no seu MSX favorito. Ele aceita os seguintes comandos:

- qt: sair para o BASIC
- fw &lt;n&gt;: Mover a tartaruga para frente n pixels
- bk &lt;n&gt;: Mover a tartaruga para trás n pixels
- rg &lt;n&gt;: Virar a tartaruga à direita n graus
- lf &lt;n&gt;: Virar a tartaruga à esquerda n graus
- pr &lt;w&gt;: Imprimir uma única palavra na tela
- rp &lt;n&gt; [ ... ]: repetir n vezes os comandos dentro de []. atualmente não suporta aninhamento
- cl: limpar a tela
- dr &lt;n&gt;: liga (1) ou desliga (0) o desenho
- xy &lt;n&gt; &lt;n&gt;: mover a tartaruga para uma posição na tela. não afeta o ângulo

# Por que as mensagens de erro estão em português se os comandos estão em inglês?

Sei lá. É como meu cérebro funciona.

# O que vem depois?

- Transformar a tartaruga triangular em uma tartaruga de verdade
- Fazer ela girar dependendo do ângulo
- Criar uma tabela fixa de seno diretamente em graus (0-89) em vez de usar funções trigonométricas
- Permitir pelo menos um nível de aninhamento
- Variáveis inteiras
- Permitir números negativos

