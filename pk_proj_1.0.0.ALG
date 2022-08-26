ALGORITMO "pk_PROJ"

// Criado por Isaque Lis.

VAR

// =============================================================================
//  => MAPA DAS MATRIZES.
// =============================================================================

//  STATUS POKEMON  | Numeracao | ATAQUE FISICO | ATAQUE ESPECIAL | VELOCIDADE | DEFESA | VIDA | SORTE |
// -----------------|-----------|---------------|-----------------|------------|--------|------|-------|
//  POKEMON JOGADOR |       a11 |           a12 |             a13 |        a14 |    a15 |  a16 |   a17 |
// -----------------|-----------|---------------|-----------------|------------|--------|------|-------|
//  POKEMON   RIVAL |       a21 |           a22 |             a23 |        a24 |    a25 |  a26 |   a27 |



//  STATUS ATAQUES  | Numeracao |     TIPO | FORCA | PRECISAO | CATEGORIA |  USO |
// -----------------|-----------|----------|-------|----------|-----------|------|
//  PRIMEIRO ATAQ.  |       a11 |      a12 |   a13 |      a14 |       a15 |  a16 |
// -----------------|-----------|----------|-------|----------|-----------|------|
//  SEGUNDO  ATAQ.  |       a21 |      a22 |   a23 |      a24 |       a25 |  a26 |
// -----------------|-----------|----------|-------|----------|-----------|------|
//  TERCEIRO ATAQ.  |       a31 |      a32 |   a33 |      a34 |       a35 |  a36 |
// -----------------|-----------|----------|-------|----------|-----------|------|
//  QUARTO   ATAQ.  |       a41 |      a42 |   a43 |      a44 |       a45 |  a46 |


//  DICIONARIO POKE |      NOME |          TIPO |
// -----------------|-----------|---------------|
//  POKEMON JOGADOR |       a11 |           a12 |
// -----------------|-----------|---------------|
//  POKEMON   RIVAL |       a21 |           a22 |


//  DICIONARIO ATAQ |      NOME | DESCRICAO MENU |
// -----------------|-----------|----------------|
//  PRIMEIRO ATAQ.  |       a11 |            a12 |
// -----------------|-----------|----------------|
//  SEGUNDO  ATAQ.  |       a21 |            a22 |
// -----------------|-----------|----------------|
//  TERCEIRO ATAQ.  |       a21 |            a22 |
// -----------------|-----------|----------------|
//  QUARTO   ATAQ.  |       a21 |            a22 |


// =============================================================================
//  => TIPOS E SUAS EFETIVIDADES.
// =============================================================================

//  POKEMON/ ATAQUE | NORMAL    | PLANTA  | FOGO    | AGUA    | PEDRA  | INSETO | ELETRICO | LUTADOR |
// -----------------|-----------|---------|---------|---------|--------|--------|----------|---------|
//  AGUA            |      x1.0 |    x1.5 |    x0.5 |    x1.0 |   x0.5 |   x1.0 |     x1.5 |    x1.0 |
// -----------------|-----------|---------|---------|---------|--------|--------|----------|---------|
//  FOGO            |      x1.0 |    x0.5 |    x1.0 |    x1.5 |   x1.0 |   x0.5 |     x1.0 |    x1.0 |
// -----------------|-----------|---------|---------|---------|--------|--------|----------|---------|
//  PLANTA          |      x1.0 |    x1.0 |    x1.5 |    x0.5 |   x0.5 |   x1.5 |     x1.0 |    x1.0 |

//        EFETIVO       -> x1.0
//        POUCO EFETIVO -> x0.5
//        SUPER EFETIVO -> x1.5


// =============================================================================
//  => VARIAVEIS GLOBAIS.
// =============================================================================

   dicioPk: vetor [1..2, 1..2] de caractere // Nomes e tipos dos Pokemon.
   statusPk: vetor [1..2, 1..7] de real     // Dados numericos dos Pokemon.


   dicioAtqJogador: vetor [1..4, 1..2] de caractere // Nomes e legendas dos ataques (Jogador).
   sttsAtqJogador: vetor [1..4, 1..6] de real // Dados numericos dos ataques (Jogador).

   dicioAtqRival: vetor [1..4, 1..2] de caractere // Nomes e legendas dos ataques (Rival).
   sttsAtqRival: vetor [1..4, 1..6] de real // Dados numericos dos ataques (Rival).

   inAtq: vetor [1..2] de inteiro // Ataques escolhidos pelo Jogador e pelo Rival.
   danoBtl: vetor [1..2] de real  // Dano gerado dos ataques dos Pokemon.
   vidaBtl: vetor [1..2] de real  // Vida do Pokemon dos pokemon durante a batalha.

   dicioAtqUp: vetor [1..2, 1..2] de caractere
   statusAtqUp: vetor [1..2, 1..6] de real

   inJogador, inMenu: inteiro // Entradas para selecao de opcoes.
   indice: inteiro // Para alternar entre as linhas das matrizes.
   enter: caractere // Para gerar pausas na leitura do algoritmo.
   dificuldade: inteiro // Nivel de dificuldade das partidas.
   saida: logico // Para saida do jogo.

   atqPreced: inteiro // Guarda acertou os ataques e vai atacar primeiro.
   atqEfetiv: inteiro // Guarda a informacao sobre a efetividade do ataque.
   contMsg: inteiro // Dita a quantia de quadros de exibidos nas batalhas.

   criticVerif: logico // Verifica efeito do critico.
   verifUso: logico // Verifica uso dos ataques.
   powerUpBusca: logico // Ativa busca de ataques para o powerup.

// =============================================================================
//  => TELAS DE ABERTURA E MENU PRINCIPAL.
// =============================================================================

   procedimento recomendaTela() // Aviso para expansao da tela.
               var
               inicio
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ")
escrevaL("   |                                                       |")
escrevaL("   |                           ^                           |")
escrevaL("   |                           |                           |")
escrevaL("   |                           |                           |")
escrevaL("   |                                                       |")
escrevaL("   |        UTILIZE A VERAO MAIS RECENTE DO VisualG        |")
escrevaL("   |                                                       |")
escrevaL("   | <---------       MAXIMIZE O CONSOLE        ---------> |")
escrevaL("   |                           &                           |")
escrevaL("   |                    TECLE    [ENTER]                   |")
escrevaL("   |                                                       |")
escrevaL("   |                           |                           |")
escrevaL("   |                           |                           |")
escrevaL("   |                                                       |")
escrevaL("   |                           v                           |")
escreva("   | _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ |")
                     leia(enter)
   fimProcedimento

   procedimento abertura() // Exibe animacao inicial.
               var
               inicio
                     recomendaTela()
timer(60)
limpatela
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                             *                                                                |")
escrevaL("   |                           *                    _,........__                                                                                  |")
escrevaL("   |                                             ,-'            '`-.                                                                              |")
escrevaL("   |                                           ,'                   `-.                     *                                                     |")
escrevaL("   |                                         ,'                        \                                                                          |")
escrevaL("   |                                       ,'                           .                                                                         |")
escrevaL("   |                                       .'\               ,''.       `                                                                         |")
escrevaL("   |                                 *    ._.'|             / |  `       \         *                                                              |")
escrevaL("   |                        *             |   |            `-.'  ||       `.                            *                                         |")
escrevaL("   |                                      |   |            '-._,'||       | \                                                                     |")
escrevaL("   |                                      .`.,'             `..,'.'       , |`-.                                                                  |")
escrevaL("   |                                      l                       .'`.  _/  |   `.            *                          POKEMON EM PORTUGOL      |")
escrevaL("   |                                      `-.._'-   ,          _ _'   -' \  .     `                                                               |")
escrevaL("   |                                 `.'''''-.`-...,---------','         `. `....__.                                                              |")
escrevaL("   |                                 .'        `'-..___      __,'\          \  \     \                                                            |")
escrevaL("   |                                 \_ .          |   `'''''    `.           . \     \                                                           |")
escrevaL("   |                                   `.          |              `.          |  .     L                                                          |")
escrevaL("   |                                     `.        |`--...________.'.        j   |     |          *                                               |")
escrevaL("   |                                       `._    .'      |          `.     .|   ,     |                                                          |")
escrevaL("   |                        *                 `--,\       .            `7''' |  ,      |                                                          |")
escrevaL("   |                                             ` `      `            /     |  |      |    _,-''''`-.                                            |")
escrevaL("   |                                              \ `.     .          /      |  '      |  ,'          `.                                          |")
escrevaL("   |                                      *        \  v.__  .        '       .   \    /| /              \                                         |")
escrevaL("   |                                                \/    `''\'''''''`.       \   \  /.''                |                                        |")
escrevaL("   |                                                 `        .        `._ ___,j.  `/ .-       ,---.     |                                        |")
escrevaL("   |                                                 ,`-.      \         .'     `.  |/        j     `    |                                        |")
escrevaL("   |                                                /    `.     \       /         \ /         |     /    j                                        |")
escrevaL("   |                 *                             |       `-.   7-.._ .          |'          '         /                                         |")
escrevaL("   |                                 *             |          `./_    `|          |            .     _,'                                          |")
escrevaL("   |                                               `.           / `----|          |-............`---'                                             |")
escrevaL("   |                                                 \          \      |          |                                                               |")
escrevaL("   |                                                ,'           )     `.         |                                                               |")
escrevaL("   |                                                 7____,,..--'      /          |                                                               |")
escrevaL("   |                                                                   `---.__,--.'mh                                                             |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escreva
escreva // Sequencia de escrevas para a tela ser exibida por mais alguns segundos antes de limpar a tela.
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
limpatela
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                             *                                |")
escrevaL("   |                                             	  	                           ..-`''--._                                             |")
escrevaL("   |                                                                          *          .`          ''                                           |")
escrevaL("   |                                                                                   .`  __          ''                                         |")
escrevaL("   |                                                                                  /   __ '          |\          *                             |")
escrevaL("   |        DESENVOLVIDO POR                                                 *       .   .| \           | '                                       |")
escrevaL("   |                        ISAQUE LIS                                               |   |'._!          ''|                                       |")
escrevaL("   |                                                             *                   |   |   '             ''                                     |")
escrevaL("   |                                               *                    *            |   |'--`|              \     *                              |")
escrevaL("   |                                                                                 |   '---`                |                                   |")
escrevaL("   |                                                       .''                       |                   '   .             *                      |")
escrevaL("   |                                                      ` / ' '                    |  '_           '     _.                                     |")
escrevaL("   |                                                     |''   '`'        .'__       |    ''---...'___...-`.` ..`                                 |")
escrevaL("   |                                                    /    '   .        \ .-'-.__  .   '.'-'_        _.`. -` '|                                 |")
escrevaL("   |                                                    .   | \-`        .` \      '`       <.'._--..-` .`     ..:-                               |")
escrevaL("   |                                                   '''  |   |         ''              .`     '''''         '`    *                            |")
escrevaL("   |                                                   \| .'|    '          \            '            '      .`                                   |")
escrevaL("   |                                                    ''       |           '-'_       /              |   .`                                     |")
escrevaL("   |                                                     |      .    *           /''   /               '_.`                                       |")
escrevaL("   |                                                *    ''  _.`                /     '                |                                          |")
escrevaL("   |                                                       |'.                 /     '                 |                                          |")
escrevaL("   |                                                       | |                /      .                 |        *                                 |")
escrevaL("   |                                                       | ''              '       |                 |                                          |")
escrevaL("   |                                                       '   \             |       |                 `                                          |")
escrevaL("   |                                                        \   ''           |       |                /             *                             |")
escrevaL("   |                                                   *    ''    '-..'___..-' _.._  |               / ''                                         |")
escrevaL("   |                                                         '''             !`      .             .     \                                        |")
escrevaL("   |                                                           \'.           .        \          .`       \                                       |")
escrevaL("   |                                                            '.'._        |         \       .`          .                                      |")
escrevaL("   |                                                              '._''------|          '---'`'          .`                                       |")
escrevaL("   |                                                                 ''-----'''                '_     _'`.'_                                      |")
escrevaL("   |                                                                           /'      '.     .`       '    _-'_                                  |")
escrevaL("   |                                                                          |._  _  _ |     ''_         .`\ '-                                  |")
escrevaL("   |                                                                           \ !| !' '`        ''''''---'--''mh                                 |")
escrevaL("   |                                                                            '- ' '`                                                           |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escreva
escreva  // Sequencia de escrevas para a tela ser exibida por mais alguns segundos antes de limpar a tela.
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
limpatela
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                              *                                                                               |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                    *                                                         |")
escrevaL("   |                                      *                                 /                                                                     |")
escrevaL("   |                                                     _,.------....___,.' ',.-.                                                                |")
escrevaL("   |                    *                             ,-'          _,.--'        |                                                                |")
escrevaL("   |                                                ,'         _.-'              .                                                                |")
escrevaL("   |                                      *        /   ,     ,'                   `            *                                                  |")
escrevaL("   |                                              .   /     /                     ``.                                                             |")
escrevaL("   |                                              |  |     .                       \.\                                                            |")
escrevaL("   |                                    ____      |___._.  |       __               \ `.                                                          |")
escrevaL("   |                                  .'    `---''       ``'-.--''`  \               .  \                                                         |")
escrevaL("   |                            *    .  ,            __               `              |   .                                                        |")
escrevaL("   |                                 `,'         ,-''  .               \             |    L                                                       |")
escrevaL("   |                                ,'          '    _.'                -._          /    |       *                                               |")
escrevaL("   |                               ,`-.    ,'.   `--'                      >.      ,'     |                                                       |")
escrevaL("   |                              . .'\'   `-'       __    ,  ,-.         /  `.__.-      ,'                                                       |")
escrevaL("   |                              ||:, .           ,'  ;  /  / \ `        `.    .      .'/                                                        |")
escrevaL("   |                              j|    \          `--'  ' ,'_  . .         `.__, \   , /                                                         |")
escrevaL("   |                             / L:_  |                 .   ' :_;                `.'.'                                                          |")
escrevaL("   |                             .    '''                  ''''''                    V    *                                                       |")
escrevaL("   |                              `.                                 .    `.   _,..  `                                                            |")
escrevaL("   |                                 `,_   .    .                _,-'/    .. `,'   __  `                                                          |")
escrevaL("   |                    *            ) \`._        ___....----''  ,'   .'  \ |   '  \  .        *                                                 |")
escrevaL("   |                                /   `. '`-.--''         _,' ,'     `---' |    `./  |                                                          |")
escrevaL("   |                               .   _  `'''--.._____..--'   ,             '         |                                                          |")
escrevaL("   |                               | .' `. `-.                /-.           /          ,                                                          |")
escrevaL("   |                               | `._.'    `,_            ;  /         ,'          .                                                           |")
escrevaL("   |                              .'          /| `-.        . ,'         ,           ,                                                            |")
escrevaL("   |                              '-.__ __ _,','    '`-..___;-...__   ,.'\ ____.___.'                                                             |")
escrevaL("   |                        *   mh`'^--'..'   '-`-^-''--    `-^-'`.'''''''`.,^.`.--'          'COMO ESCULPIR A VENUS DE MILO EM UMA BATATA'       |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escreva
escreva // Sequencia de escrevas para a tela ser exibida por mais alguns segundos antes de limpar a tela.
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva

   fimProcedimento

   procedimento menuPrincipal() // Exibicao grafica do MENU principal.

            var
            inicio
                  limpatela
                  timer(30)
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                       ,'\                                                                    |")
escrevaL("   |                                         _.----.        ____         ,'  _\   ___    ___     ____                                             |")
escrevaL("   |                                     _,-'       `.     |    |  /`.   \,-'    |   \  /   |   |    \  |`.                                       |")
escrevaL("   |                                     \      __    \    '-.  | /   `.  ___    |    \/    |   '-.   \ |  |                                      |")
escrevaL("   |                                      \.    \ \   |  __  |  |/    ,','_  `.  |          | __  |    \|  |                                      |")
escrevaL("   |                                       \    \/   /,' _`.|      ,' / / / /   |          ,' _`.|     |  |                                       |")
escrevaL("   |                                        \     ,-'/  /   \    ,'   | \/ / ,`.|         /  /   \  |     |                                       |")
escrevaL("   |                                      .. \    \ |   \_/  |   `-.  \    `'  /|  |    ||   \_/  | |\    |                                       |")
escrevaL("   |                             ...1111111111\    \1\      /       `-.`.___,-' |  |\  /| \      /  | |   |                                       |")
escrevaL("   |                        ..1111111111111111/\    \1`.__,1|  |--._    `|      |__| \/ |  `.__,'|  | |   |                                       |")
escrevaL("   |                     ./00000000|111111|1111/\_.-'1111111|__|11111-._ |VisualG Version-.|     '-.| |   |                                       |")
escrevaL("   |                  .00000000000000|1111111111111111111111111111111111`'                            '-._|                                       |")
escrevaL("   |               ..0000000000000000&|1111111111111111111111111111111111/..                               1.0.0                                  |")
escrevaL("   |             ..(0000000000000000011111111|111111111111111111111111111111..                                                                    |")
escrevaL("   |            .|/00000000000000000|1111111111111111111111111111111111111111/.                                                                   |")
escrevaL("   |          .|11/000000000000000|11111111111111111111*,|1111111111111111111111.                                                                 |")
escrevaL("   |         .|111111000000000|1111111111111111/,.************..|1111111111111111.             _  ____   _____          _____                     |")
escrevaL("   |        .|11111111111111111111111111111111.*****.100000,.****.|11111111111111/.           | |/ __ \ / ____|   /\   |  __ \                    |")
escrevaL("   |       .*|111111111111111111111111111111.****.000.00000.000.***.|11111111111111.          | | |  | | |  __   /  \  | |__) |                   |")
escrevaL("   |       .|1111111111111111...,***************.000000000000%00.***.|111111111111/.      _   | | |  | | | |_ | / /\ \ |  _  /                    |")
escrevaL("   |      .*|111111/..,************************.00.00000000000.0&*********,..|111111.    | |__| | |__| | |__| |/ ____ \| | \ \   (1)              |")
escrevaL("   |      .|/..*********************************.0&0000000000000.***************,.,/.     \____/ \____/ \_____/_/__ _\_\_|__\_\_ ____             |")
escrevaL("   |      .,,,***********************,.......****.00*0000001000.********************.                        |_   _| \ | |  ____/ __ \            |")
escrevaL("   |      .,,,,,********...&00000000000000000.*****..0000000.,****.0*..,************.                          | | |  \| | |__ | |  | |           |")
escrevaL("   |      .,,,,,..(1111100000000000000000000000%.**************,.000000000000..,****.                          | | | . ` |  __|| |  | |           |")
escrevaL("   |       .111111111111100000000000000000000000000&...,,...10000000000000000000000.                   (2)    _| |_| |\  | |   | |__| |           |")
escrevaL("   |        .111111111111100000000000000000000000000000000000000000000000000000000.             _____        |_____|_|_\_|_|    \____/            |")
escrevaL("   |        .,1111111111111000000000000000000000000000000000000000000000000000000..            / ____|  /\   |_   _|  __ \                        |")
escrevaL("   |         ..11111111111111000000000000000000000000000000000000000000000000000..            | (___   /  \    | | | |__) |                       |")
escrevaL("   |           .111111111111111000000000000000000000000000000000000000000000000.               \___ \ / /\ \   | | |  _  /                        |")
escrevaL("   |            .*1111111111111111000000000000000000000000000000000000000000%..                ____) / ____ \ _| |_| | \ \  (3)                   |")
escrevaL("   |              .(1111111111111111100000000000000000000000000000000000011/.                 |_____/_/    \_\_____|_|  \_\                       |")
escrevaL("   |                ..111111111111111111100000000000000000000000000001111..                                                                       |")
escrevaL("   |                   ./111111111111111111111111&0000000000&111111111*.                                                                          |")
escrevaL("   |                      ..111111111111111111111111111111111111111..                                                                             |")
escrevaL("   |                          ..*11111111111111111111111111111*..                                                                                 |")
escrevaL("   |                                ....(1111111111111/....                                                                                       |")
escrevaL("   |                                                                                                                                              v")
escreva("   |_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _DIGITE AQUI => ")

            leia(inMenu) // Le opcao escolhida do MENU.

            escolha (inMenu)
                   caso(1)
                       menuPk() // SubMenu de escolha de Pokemon Inicial.
                   caso(2)
                       menuInfo() // SubMenu para ver informacoes sobre o jogo.
                   caso(3)
                       saida <- verdadeiro
                   outroCaso
                            limpaTela // Caso a entrada seja incorreta, limpa a tela e a reimprime.
            fimEscolha
   fimProcedimento

   procedimento menuPk() // Exibicao do MENU de escolha dos pokemon iniciais.
            var
            inicio
                  repita // Repeticao caso a entrada do usuario seja incorreta.
limpatela
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                             _ _                                            _     __                          _       _      _       _        |")
escrevaL("   |                            | | |                                          | |   /_/                         (_)     (_)    (_)     | |       |")
escrevaL("   |          ___  ___  ___ ___ | | |__   __ _    ___  ___ _   _    _ __   ___ | | _____ _ __ ___   ___  _ __     _ _ __  _  ___ _  __ _| |       |")
escrevaL("   |         / _ \/ __|/ __/ _ \| | '_ \ / _` |  / __|/ _ \ | | |  | '_ \ / _ \| |/ / _ \ '_ ` _ \ / _ \| '_ \   | | '_ \| |/ __| |/ _` | |       |")
escrevaL("   |        |  __/\__ \ (_| (_) | | | | | (_| |  \__ \  __/ |_| |  | |_) | (_) |   <  __/ | | | | | (_) | | | |  | | | | | | (__| | (_| | |       |")
escrevaL("   |         \___||___/\___\___/|_|_| |_|\__,_|  |___/\___|\__,_|  | .__/ \___/|_|\_\___|_| |_| |_|\___/|_| |_|  |_|_| |_|_|\___|_|\__,_|_|       |")
escrevaL("   |                                                               | |                                                                            |")
escrevaL("   |                                                               |_|                                                                            |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                  *                                   *                                                                       |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                        *                                                                                     |")
escrevaL("   |                       *                                           *                                                                          |")
escrevaL("   |                                            *                           *                             *                                       |")
escrevaL("   |                            .----------.                   _____---___                 *                                                      |")
escrevaL("   |                           /  _      _  \            *    /           \                         *                                             |")
escrevaL("   |                          / (. )   (. )  \               /  _\`  ´/_   \   *                                                                  |")
escrevaL("   |                  *       |  ```   ```   |               |             |                                   *                                  |")
escrevaL("   |                           \     -(     /     *          /    \/       |           *     /\______/\MMMMMM                                     |")
escrevaL("   |                        ^___\__     __ /___             (___  ____    /                 /          \/ \  \                                    |")
escrevaL("   |                       \          /     /\/\___        |\--/ /    \   ----/|           (-\ ´  /-)        |                                    |")
escrevaL("   |                        --____   /  _   \/\/   \        -__           ___-            /   **        L_/ _/                                    |")
escrevaL("   |                            |    \_/    /\/\| @           / /      \ \    ^$*        (   __-__   D     \/                                     |")
escrevaL("   |                            | -- -+- -- \/\/\\_/          |/        \| ___$^*         \               O \                                     |")
escrevaL("   |                            |> - -+- - </\/\/            /\|        / \    /@         (           b     )                                     |")
escrevaL("   |                             \___/\____/ __/             | |________  |___/           \   |---/ * /-\   /                                     |")
escrevaL("   |                              /         |                \   /     \  |                \* |  /   / | | /                                      |")
escrevaL("   |                            /___/    \___\               _v__       __v_                _W_  _w_/ \w /w                                       |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                           1.SQUIRTLE (AGUA)            2.CHARMANDER (FOGO)           3.BULBASAUR (PLANTA)                                    |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                         'A TARTARUGA BIPEDE          'A LAGARTIXA COM              'O SAPO COM UM                                            |")
escrevaL("   |                           COM CALDA ENROLADA'                  FOGO NO RABO'            REPOLHO NAS COSTAS'                                  |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              v")
escreva("   |_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _DIGITE AQUI => ")
  timer(0)
                  leia(inJogador) // Le escolha do usuario, que refere-se a numeracao do Pokemon escolhido.

                  ate ((inJogador >= 1) e (inJogador <=3)) // Condicao para executar as proximas instrucoes.

                  indice <- 1 // Indice refere-se de quem sao os dados que serao buscados, 1 para Jogador, 2 para Rival.
                  pokeDex() // Procedimento para coletar dados do pokemon escolhido
                  batalhaArena() // Entra no procedimento principal das batalhas.
   fimProcedimento

   procedimento menuInfo() // MENU de informações sobre o Jogo.
              var
                 inInfo: inteiro // Entrada do usuario para selecionar opcoes do MENU.
                 saidaInfo: logico // Para sair do MENU.

              inicio
                    saidaInfo <- falso // Saida para MENU de informacoes comeca recebendo falso.

                    repita // Laco de repeticao caso o usuario de uma entrada nao reconhecida.
limpaTela
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                   !                                 !                                                        |")
escrevaL("   |                                                                  !                                                     !                     |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                    !                                                                                                         |")
escrevaL("   |                                                                     !                                                                        |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                              !                                               |")
escrevaL("   |                        !               ____       _        ____                                                                              |")
escrevaL("   |                                       |  _ \ ___ | | _____|  _ \  _____  __          !                                  !                    |")
escrevaL("   |                                       | |_) / _ \| |/ / _ \ | | |/ _ \ \/ /                                                                  |")
escrevaL("   |                                       |  __/ (_) |   <  __/ |_| |  __/>  <  (1)                                                              |")
escrevaL("   |                                       |_|   \___/|_|\_\___|____/ \___/_/\_\           ____                                                   |")
escrevaL("   |                                                        / \ | |_ __ _  __ _ _   _  ___|  _ \  _____  __                                       |")
escrevaL("   |                                                       / _ \| __/ _` |/ _` | | | |/ _ \ | | |/ _ \ \/ /                                       |")
escrevaL("   |                !                !                (2) / ___ \ || (_| | (_| | |_| |  __/ |_| |  __/>  <                                        |")
escrevaL("   |                                             ____    /_/ _ \_\__\__,_|\__, |\__,_|\___|____/ \___/_/\_\                                       |")
escrevaL("   |                                            | __ )  __ _| |_ __ _| | |__ |_|_ _ ___|_ _|_ __  / _| ___                                        |")
escrevaL("   |                                            |  _ \ / _` | __/ _` | | '_ \ / _` / __|| || '_ \| |_ / _ \                                       |")
escrevaL("   |                                    !       | |_) | (_| | || (_| | | | | | (_| \__ \| || | | |  _| (_) | (3)               !                  |")
escrevaL("   |                                            |____/ \__,_|\__\__,_|_|_| |_|\__,_|___/___|_| |_|_|  \___/      __                               |")
escrevaL("   |                            !                         |  ___/_/  _ __ _ __ ___  _   _| | __ _ ___|_ _|_ __  / _| ___                          |")
escrevaL("   |                                                   (4)| |_ / _ \| '__| '_ ` _ \| | | | |/ _` / __|| || '_ \| |_ / _ \                         |")
escrevaL("   |                                             ____     |  _| (_) | |  | | | | | | |_| | | (_| \__ \| || | | |  _| (_) |                        |")
escrevaL("   |                                            / ___|  __|_(_)\___/|_|  |_| |_| |_|\__,_|_|\__,_|___/___|_| |_|_|  \___/                         |")
escrevaL("   |                                            \___ \ / _` | | '__|                                                                              |")
escrevaL("   |                                             ___) | (_| | | |    (5)                         !                                                |")
escrevaL("   |                     !                      |____/ \__,_|_|_|                                                                                 |")
escrevaL("   |                                                                                                                   !                          |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                  !                                     !                      !                                              |")
escrevaL("   |                                                             !                                                                                |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              v")
escreva("   |_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _DIGITE AQUI => ")
timer(0)

                    leia(inInfo) // Le opcao definida pelo usuario.

                    escolha(inInfo)

                           caso(1)
                               infoPokeDex() // Inicia proc. de Informacoes sobre os Pokemon.
                           caso(2)
                               infoAtqDex() // Inicia proc. de Informacoes sobre os Ataques dos Pokemon.
                           caso(3)
                               infoBatalha() // Inicia proc. de Informacoes e instrucoes sobre batalha.
                           caso(4)
                               infoFormulas() // Inicia proc de informacoes sobre as formulas das batalhas.
                           caso(5)
                               saidaInfo <- verdadeiro // Opcao de selecao de saida do MENU info.
                           outrocaso
                                    limpaTela // Caso selecionado uma opcao que nao esteja no MENU, limpa a tela e repete procedimento.
                    fimEscolha

                    ate (saidaInfo = verdadeiro) // Condicao para sair do MENU de Info.

   fimprocedimento

   procedimento infoPokeDex() // Nomes, tipos, vantagens, fraquezas, ataques e status dos Pokemon.
               var
               inicio
                     limpaTela // Limpa tela anterior.
timer(30)
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |    ____       _        ____                                                                                                                  |")
escrevaL("   |   |  _ \ ___ | | _____|  _ \  _____  __                                                                             .----------.             |")
escrevaL("   |   | |_) / _ \| |/ / _ \ | | |/ _ \ \/ /                                                                            /  _      _  \            |")
escrevaL("   |   |  __/ (_) |   <  __/ |_| |  __/>  <                                                                            / (. )   (. )  \           |")
escrevaL("   |   |_|   \___/|_|\_\___|____/ \___/_/\_\                                                                           |  ```   ```   |           |")
escrevaL("   |                                                                                                                    \     -(     /            |")
escrevaL("   |                                                                                                                 ^___\__     __ /___          |")
escrevaL("   |                                                                                                                \          /     /\/\___      |")
escrevaL("   |                                                                                                                 --____   /  _   \/\/   \     |")
escrevaL("   |   NOME: SQUIRTLE                        | ATAQ. FISICO   :  52 + BONUS                                              |    \_/    /\/\| @      |")
escrevaL("   |   TIPO: AGUA                            | ATAQ. ESPECIAL :  56 + BONUS                                              | -- -+- -- \/\/\\_/     |")
escrevaL("   |                                         | VELOCIDADE     :  44                             ______>                  |> - -+- - </\/\/        |")
escrevaL("   |   FRACO A          : PLANTA e ELETRICO  | DEFESA         :  56 + BONUS                    /                          \___/\____/ __/         |")
escrevaL("   |   FORTE A          : FOGO e PEDRA       | PONTOS DE VIDA :  52                           /                            /         |            |")
escrevaL("   |   ATAQUES INICIAIS : BUBBLE e TACKLE    | SORTE          :  52                          /                           /___/    \___\           |")
escrevaL("   |  ______________________________________________________________________________________/                              _____---___            |")
escrevaL("   |                                                                                                                      /           \           |")
escrevaL("   |                                                                                                                     /  _\`  ´/_   \          |")
escrevaL("   |                                                                                                                     |             |          |")
escrevaL("   |                                                                                                                     /    \/       |          |")
escrevaL("   |                                                                                                                    (___  ____    /           |")
escrevaL("   |                                                                                                                   |\--/ /    \   ----/|      |")
escrevaL("   |   NOME: CHARMANDER                      | ATAQ. FISICO   :  52                                                     -__           ___-        |")
escrevaL("   |   TIPO: FOGO                            | ATAQ. ESPECIAL :  60 + BONUS                                               / /      \ \    ^$*     |")
escrevaL("   |                                         | VELOCIDADE     :  56 + BONUS                     ______>                   |/        \| ___$^*     |")
escrevaL("   |   FRACO A          : AGUA e PEDRA       | DEFESA         :  48                            /                         /\|        / \    /@     |")
escrevaL("   |   FORTE A          : PLANTA e INSETO    | PONTOS DE VIDA :  44                           /                          | |________  |___/       |")
escrevaL("   |   ATAQUES INICIAIS : EMBER e TACKLE     | SORTE          :  52 + BONUS                  /                           \   /     \  |           |")
escrevaL("   |  ______________________________________________________________________________________/                            _v__       __v_          |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                        /\______/\MMMMMM      |")
escrevaL("   |                                                                                                                       /          \/ \  \     |")
escrevaL("   |                                                                                                                      (-\ ´  /-)        |     |")
escrevaL("   |   NOME: BULBASAUR                       | ATAQ. FISICO   :  48                                                      /   **        L_/ _/     |")
escrevaL("   |   TIPO: PLANTA                          | ATAQ. ESPECIAL :  56 + BONUS                                             (   __-__   D     \/      |")
escrevaL("   |                                         | VELOCIDADE     :  48                             ______>                  \               O \      |")
escrevaL("   |   FRACO A          : FOGO e INSETO      | DEFESA         :  48                            /                         (           b     )      |")
escrevaL("   |   FORTE A          : AGUA e PEDRA       | PONTOS DE VIDA :  56 + BONUS                   /                          \   |---/ * /-\   /      |")
escrevaL("   |   ATAQUES INICIAIS : VINE WHIP e TACKLE | SORTE          :  56 + BONUS                  /                            \* |  /   / | | /       |")
escrevaL("   | _______________________________________________________________________________________/                              _W_  _w_/ \w /w        |")
escrevaL("   |                                                                                                                                              v")
escreva("   |_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ > TECLE ENTER PARA VOLTAR < ")
timer(0)

                     leia(enter) // Recebe qualquer entrada para sair do procedimento.
   fimProcedimento

   procedimento infoAtqDex() // Numeracao, nomes, tipos, categorias, forca, precisao e uso dos Ataques.
               var
               inicio
                     limpaTela // Limpa tela anterior.
timer(30)
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |     _   _                         ____                                                                                                       |")
escrevaL("   |    / \ | |_ __ _  __ _ _   _  ___|  _ \  _____  __                                                                                           |")
escrevaL("   |   / _ \| __/ _` |/ _` | | | |/ _ \ | | |/ _ \ \/ /                                                                                           |")
escrevaL("   |  / ___ \ || (_| | (_| | |_| |  __/ |_| |  __/>  <                                                                                            |")
escrevaL("   | /_/   \_\__\__,_|\__, |\__,_|\___|____/ \___/_/\_\                                                                                           |")
escrevaL("   |                     |_|                                                                                                                      |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |   Nº  NOME           TIPO      CATEG.    FORC. PREC.  USO                                                                                    |")
escrevaL("   |  ----------------------------------------------------------                                                                                  |")
escrevaL("   |  |01. BUBBLE       | AGUA    | ESPECIAL |  40 |  80 |   3 |                                                                                  |")
escrevaL("   |  |--------------------------------------------------|-----|                                                                                  |")
escrevaL("   |  |02. EMBER        | FOGO    | ESPECIAL |  45 |  80 |   3 |                                                                                  |")
escrevaL("   |  |--------------------------------------------------|-----|                                                                                  |")
escrevaL("   |  |03. TACKLE       | NORMAL  | FISICO   |  35 |  80 |   6 |                                                                                  |")
escrevaL("   |  |--------------------------------------------------|-----|                                                                                  |")
escrevaL("   |  |04. SPARK        | ELETRICO| ESPECIAL |  40 |  70 |   4 |                                                                                  |")
escrevaL("   |  |--------------------------------------------------|-----|                                                                                  |")
escrevaL("   |  |05. VINE WHIP    | PLANTA  | ESPECIAL |  40 |  80 |   3 |                                                                                  |")
escrevaL("   |  |--------------------------------------------------|-----|                                                                                  |")
escrevaL("   |  |06. ROCK TOMB    | PEDRA   | ESPECIAL |  60 |  65 |   3 |                                                                                  |")
escrevaL("   |  |--------------------------------------------------|-----|                                                                                  |")
escrevaL("   |  |07. MEGAHORN     | INSETO  | FISICO   |  80 |  70 |   3 |                                                                                  |")
escrevaL("   |  |--------------------------------------------------|-----|                                                                                  |")
escrevaL("   |  |08. KARATE CHOP  | LUTADOR | FISICO   |  55 |  80 |   4 |                                                                                  |")
escrevaL("   |  |--------------------------------------------------|-----|                                                                                  |")
escrevaL("   |  |09. QUICK ATTACK | NORMAL  | FISICO   |  50 | +99 |   3 |                                                                                  |")
escrevaL("   |  |--------------------------------------------------|-----|                                                                                  |")
escrevaL("   |  |10. SUPERPOWER   | LUTADOR | FISICO   |  90 |  40 |   4 |                                                                                  |")
escrevaL("   |  |--------------------------------------------------|-----|                                                                                  |")
escrevaL("   |  |11. THUNDER      | ELETRICO| ESPECIAL |  75 |  40 |   3 |                                                                                  |")
escrevaL("   |  |--------------------------------------------------|-----|                                                                                  |")
escrevaL("   |  |12. SIGNAL BEAM  | INSETO  | ESPECIAL |  60 |  80 |   3 |                                                                                  |")
escrevaL("   |  |--------------------------------------------------|-----|                                                                                  |")
escrevaL("   |  |13. AQUA TAIL    | AGUA    | FISICO   |  65 |  80 |   2 |                                                                                  |")
escrevaL("   |  |--------------------------------------------------|-----|                                                                                  |")
escrevaL("   |  |14. FIRE PUNCH   | FOGO    | FISICO   |  70 |  75 |   2 |                                                                                  |")
escrevaL("   |  |--------------------------------------------------|-----|                                                                                  |")
escrevaL("   |  |15. LEAF BLADE   | PLANTA  | FISICO   |  60 |  80 |   2 |                                                                                  |")
escrevaL("   |  ----------------------------------------------------------                                                                                  |")
escrevaL("   |                                                                                                                                              v")
escreva("   |_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ > TECLE ENTER PARA VOLTAR < ")
timer(0)
                     leia(enter) // Recebe qualquer entrada para sair do procedimento.
   fimProcedimento

   procedimento infoBatalha() // Informacoes e instrucoes das batalhas.
               var
               inicio
                     limpaTela // Limpa tela anterior.
timer(30)
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |   ____        _        _ _           ___        __                                                                                           |")
escrevaL("   |  | __ )  __ _| |_ __ _| | |__   __ _|_ _|_ __  / _| ___                                                                                      |")
escrevaL("   |  |  _ \ / _` | __/ _` | | '_ \ / _` || || '_ \| |_ / _ \                                                                                     |")
escrevaL("   |  | |_) | (_| | || (_| | | | | | (_| || || | | |  _| (_) |                                                                                    |")
escrevaL("   |  |____/ \__,_|\__\__,_|_|_| |_|\__,_|___|_| |_|_|  \___/                                                                                     |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |  GUIA E INSTRUCOES DE BATALHA POKEMON.                                                                                                       |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |  1. Escolha qual ataque usar para derrotar o Pokemon Rival zerando sua vida.                                                                 |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |  2. Existem tipos de ataques que causam mais dano nos Pokemon inimigo, a depender de seu tipo.                                               |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |  3. Cada ataque tem sua forca, que influencia na quantidade de dano que ele causa.                                                           |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |  4. Cada ataque tambem possui sua propria precisao, que determina a chance do pokem acertar o golpe.                                         |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |  5. Os ataques possuem limite de quantas vezes podem ser usados, fique de olho em quantas vezes pode usa-los.                                |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |  6. Caso venca o primeiro Round, escolha com sabedoria qual ataque deseja ensinar ao seu pokemon.                                            |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |  7. Ataques Fisicos sao mais poderosos em pokemon que tem bastante velocidade!                                                               |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |  8. Ataques especiais sao mais eficazes em sobrepujar a defesa dos pokemon inimigos!                                                         |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |  9. Divirta-se jogando!                                                                                                                      |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              v")
escreva("   |_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ > TECLE ENTER PARA VOLTAR < ")
timer(0)
                     leia(enter) // Recebe qualquer entrada para sair do procedimento.
   fimProcedimento

   procedimento infoFormulas() // Formulas utilizadas nas batalhas
               var
               inicio
                     limpaTela // Limpa tela anterior.
timer(30)
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |    _____ __                       _           ___        __                                                                                  |")
escrevaL("   |   |  ___/_/  _ __ _ __ ___  _   _| | __ _ ___|_ _|_ __  / _| ___                                                                             |")
escrevaL("   |   | |_ / _ \| '__| '_ ` _ \| | | | |/ _` / __|| || '_ \| |_ / _ \                                                                            |")
escrevaL("   |   |  _| (_) | |  | | | | | | |_| | | (_| \__ \| || | | |  _| (_) |                                                                           |")
escrevaL("   |   |_|  \___/|_|  |_| |_| |_|\__,_|_|\__,_|___/___|_| |_|_|  \___/                                                                            |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |   FORMULA DE ATAQUE MAIS VELOZ (DETERMINAR QUEM ATACA PRIMEIRO)                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |         x = (MultiplicadorDeAtaqueFisico + (AleatoriaDeZeroADez * 10 ^ - 2))                                                                 |")
escrevaL("   |         x = x - ((((100 - PrecisaoDoAtaque) * 10 ^ - 2) * 0.25) + 1)                                                                         |")
escrevaL("   |         RapidezDoPokemon = x * VelocidadeDoPokemon                                                                                           |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |   FORMULA DE DANO FISICO LIMPO (SEM APLICAR DEFESA DO ADVERSARIO)                                                                            |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |         X = (AtaqueFisicoDoPokemon * 10 ^ -2) + ((VelocidadeDoPokemon * 10 ^ -2) * 0.25)                                                     |")
escrevaL("   |         DanoLimpo = MultiplicadorDoCritico * (7 * (1 + X + (ForcaDoAtaque * 10 ^ -2)))                                                       |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |   FORMULA DE DANO ESPECIAL LIMPO (SEM APLICAR DEFESA DO ADVERSARIO)                                                                          |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |         DanoLimpo = MultiplicadorDoCritico * (7 * ( 1 + (AtaqueEspecialDoPokemon * 10 ^ -2) + (ForcaDoAtaque * 10 ^ -2)))                    |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |   FORMULA DE DANO FISICO CAUSADO (APLICANDO DIVISORES DA DEFERA DO ADVERSARIO)                                                               |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |         DanoCausado = (DanoLimpo * MultiplicadorDeAtaqueEfetivo) * (1 - ((DefesaDoPokemonAdversario * 10 ^ -2) * 0.5))                       |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |   FORMULA DE DANO FISICO CAUSADO (APLICANDO DIVISORES DA DEFERA DO ADVERSARIO)                                                               |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |         DanoCausado = (DanoLimpo * MultiplicadorDeAtaqueEfetivo) * (1 - ((DefesaDoPokemonAdversario * 10 ^ -2) * 0.3))                       |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              v")
escreva("   |_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ > TECLE ENTER PARA VOLTAR < ")
timer(0)
                     leia(enter) // Recebe qualquer entrada para sair do procedimento.
   fimProcedimento

// =============================================================================
//  => BUSCA DE DADOS DOS POKEMON E ATAQUES.
// =============================================================================

   procedimento pokeDex() // Onde se faz a atribuicao dos dados dos Pokemon selecionados.

         var
            atqEndereco: vetor [1..4] de real // Cabo de transferencia para os vetores de escopo global.
            n: inteiro // Para repeticao da atribuicao dos dados.

         inicio
                 escolha(inJogador) // Escolhe a entrada do Jogador referente ao Pokemon selecionado.

                        caso (1)

                            // 1 para Squirtle.
                            dicioPk[indice,1] <- "SQUIRTLE   "  //   Nome do pokemon.
                            dicioPk[indice,2] <- "AGUA"         //   Tipo do pokemon.

                            statusPk[indice,1] <- 01            //   Numero ID

                            statusPk[indice,2] <- 52 + randi(2) //   ATAQUE FISICO   + d2
                            statusPk[indice,3] <- 56 + randi(2) //   ATAQUE ESPECIAL + d2
                            statusPk[indice,4] <- 44            //   VELOCIDADE
                            statusPk[indice,5] <- 56 + randi(2) //   DEFESA          + d2
                            statusPk[indice,6] <- 52            //   PONTOS DE VIDA
                            statusPk[indice,7] <- 52            //   SORTE

                            // Os enderecos dos ataques sao atribuidos a um vetor de escopo local.
                            // Os dados dos ataques sao atribuidos posteriormente, em uma procedimento proprio.
                            // Os dois ultimos enderecos de ataques sao definidos randomicamente, atraves de uma funcao.
                            // Os parâmetros servem para nao haver repeticoes de ataques na selecao randomica.

                            atqEndereco[1] <- 01                //   Numeracao do 1º ataque.
                            atqEndereco[2] <- 03                //   Numeracao do 2º ataque.
                            atqEndereco[3] <- endAtqsRandom(0, -1) //   Numeracao do 3º ataque.
                            atqEndereco[4] <- endAtqsRandom(atqEndereco[3], 0) //   Numeracao do 4º ataque.


                        caso (2)

                            // 2 para Charmander.
                            dicioPk[indice,1] <- "CHARMANDER "  //   Nome do pokemon.
                            dicioPk[indice,2] <- "FOGO"         //   Tipo do pokemon.

                            statusPk[indice,1] <- 02            //   Numero ID

                            statusPk[indice,2] <- 52            //   ATAQUE FISICO
                            statusPk[indice,3] <- 60 + randi(2) //   ATAQUE ESPECIAL + d2
                            statusPk[indice,4] <- 56 + randi(2) //   VELOCIDADE      + d2
                            statusPk[indice,5] <- 48            //   DEFESA
                            statusPk[indice,6] <- 44            //   PONTOS DE VIDA
                            statusPk[indice,7] <- 52 + randi(2) //   SORTE           + d2

                            // Os enderecos dos ataques sao atribuidos a um vetor de escopo local.
                            // Os dados dos ataques sao atribuidos posteriormente, em uma procedimento proprio.
                            // Os dois ultimos enderecos de ataques sao definidos randomicamente, atraves de uma funcao.
                            // Os parâmetros servem para nao haver repeticoes de ataques na selecao randomica.

                            atqEndereco[1] <- 02                //   Numeracao do 1º ataque.
                            atqEndereco[2] <- 03                //   Numeracao do 2º ataque.
                            atqEndereco[3] <- endAtqsRandom(0, -1) //   Numeracao do 3º ataque.
                            atqEndereco[4] <- endAtqsRandom(atqEndereco[3], 0) //   Numeracao do 4º ataque.

                        caso (3)

                            // 3 para Bulbasaur.
                            dicioPk[indice,1] <- "BULBASAUR  "  //   Nome do pokemon.
                            dicioPk[indice,2] <- "PLANTA"       //   Tipo do pokemon.

                            statusPk[indice,1] <- 03            //   Numero ID

                            statusPk[indice,2] <- 48            //   ATAQUE FISICO
                            statusPk[indice,3] <- 56 + randi(2) //   ATAQUE ESPECIAL + d2
                            statusPk[indice,4] <- 48            //   VELOCIDADE
                            statusPk[indice,5] <- 48            //   DEFESA
                            statusPk[indice,6] <- 56 + randi(2) //   PONTOS DE VIDA  + d2
                            statusPk[indice,7] <- 56 + randi(2) //   SORTE           + d2

                            // Os enderecos dos ataques sao atribuidos a um vetor de escopo local.
                            // Os dados dos ataques sao atribuidos posteriormente, em uma procedimento proprio.
                            // Os dois ultimos enderecos de ataques sao definidos randomicamente, atraves de uma funcao.
                            // Os parâmetros servem para nao haver repeticoes de ataques na selecao randomica.

                            atqEndereco[1] <- 05                //   Numeracao do 1º ataque.
                            atqEndereco[2] <- 03                //   Numeracao do 2º ataque.
                            atqEndereco[3] <- endAtqsRandom(0, -1) //   Numeracao do 3º ataque.
                            atqEndereco[4] <- endAtqsRandom(atqEndereco[3], 0) //   Numeracao do 4º ataque.

                 fimEscolha

                 para n de 1 ate 4 faca // Repeticao para atribuicao de endereco por endereco dos ataques.

                     se (indice = 1) entao // Se o indice for referente ao do Jogador...
                       sttsAtqJogador[n,1] <- atqEndereco[n] // Os enderecos dos ataques sao atribuidos na matriz do Jogador.

                     seNao // Se o indice nao for 1, ele sera 2, o que significa ser referente ao Rival.
                         sttsAtqRival[n,1] <- atqEndereco[n]// Atribuicao dos enderecos na matriz do Rival.
                     fimSe

                 fimPara

                 vidaBtl[indice] <- statusPk[indice,6] // Vida inicial do Pokemon e atribuida a vida do Pokemon durante a batalha.
                 ataquesDex() // Inicia procedimento para buscar pelos dados dos ataques.

   fimProcedimento

   funcao endAtqsRandom(x, y: real):real // Funcao para randomizar ataques.
         var
            atqRandom: real // Retorno do endereco de ataque definido randomicamente.
            verifAtq: logico // Verifica se o ataque e um dos permitidos para o Pokemon utilizar.

         inicio
               // Zerando variaveis no inicio da funcao.
               atqRandom <- 0
               verifAtq <- falso

               escolha(dicioPk[indice,2]) // Seleciona o tipo do Pokemon na matriz.

                      // Os ataques que sao permitidos para os Pokemon aprenderem sao definidos pelo seu tipo.

                      caso("AGUA")

                          repita
                                atqRandom <- randi(14)+1 // Define um numero aleatorio entre os 15 ataques disponiveis.

                                // Na condicional abaixo, verifAtq recebe verdadeiro caso o ataque seja um dos permitidos.

                                escolha(atqRandom)
                                       caso(6)
                                           // ROCK TOMB (PEDRA)
                                           verifAtq <- verdadeiro
                                       caso(7)
                                           // MEGAHORN (INSETO)
                                           verifAtq <- verdadeiro
                                       caso(8)
                                           // KARATE CHOP (LUTADOR)
                                           verifAtq <- verdadeiro
                                       caso(9)
                                           // QUICK ATTACK (NORMAL)
                                           verifAtq <- verdadeiro
                                       caso(10)
                                           // SUPERPOWER (LUTADOR)
                                           verifAtq <- verdadeiro
                                       caso(12)
                                           // SIGNAL BEAM (INSETO)
                                           verifAtq <- verdadeiro
                                       caso(13)
                                           // AQUA TAIL (AGUA)
                                           verifAtq <- verdadeiro
                                       outroCaso
                                                // Caso nao seja um dos ataques anteriores, verifAtq recebe falso e o processo e repetido de novo.
                                                verifAtq <- falso
                                fimEscolha

                          ate ((verifAtq = verdadeiro) e ((atqRandom <> x) e (atqRandom <> y))) // Concicoes para encerrar repeticao, o ataque tambem nao pode ser um dos passados pelo parâmetro.

                      caso("FOGO")

                          repita

                                atqRandom <- randi(14)+1 // Define um numero aleatorio entre os 15 ataques disponiveis.

                                // Na condicional abaixo, verifAtq recebe verdadeiro caso o ataque seja um dos permitidos.

                                escolha(atqRandom)
                                       caso(4)
                                           // SPARK (ELETRICO)
                                           verifAtq <- verdadeiro
                                       caso(8)
                                           // KARATE CHOP (LUTADOR)
                                           verifAtq <- verdadeiro
                                       caso(9)
                                           // QUICK ATTACK (NORMAL)
                                           verifAtq <- verdadeiro
                                       caso(10)
                                           // SUPERPOWER (LUTADOR)
                                           verifAtq <- verdadeiro
                                       caso(11)
                                           // THUNDER (ELETRICO)
                                           verifAtq <- verdadeiro
                                       caso(12)
                                           // SIGNAL BEAM (INSETO)
                                           verifAtq <- verdadeiro
                                       caso(14)
                                           // FIRE PUNCH (FOGO)
                                           verifAtq <- verdadeiro
                                       outroCaso
                                                // Caso nao seja um dos ataques anteriores, verifAtq recebe falso e o processo e repetido de novo.
                                                verifAtq <- falso
                                fimEscolha

                          ate ((verifAtq = verdadeiro) e ((atqRandom <> x) e (atqRandom <> y))) // Concicoes para encerrar repeticao, o ataque tambem nao pode ser um dos passados pelo parâmetro.

                      caso("PLANTA")

                          repita
                                atqRandom <- randi(14)+1 // Define um numero aleatorio entre os 15 ataques disponiveis.

                                // Na condicional abaixo, verifAtq recebe verdadeiro caso o ataque seja um dos permitidos.

                                escolha(atqRandom)
                                       caso(4)
                                           // SPARK (ELETRICO)
                                           verifAtq <- verdadeiro
                                       caso(6)
                                           // ROCK TOMB (PEDRA)
                                           verifAtq <- verdadeiro
                                       caso(8)
                                           // KARATE CHOP (LUTADOR)
                                           verifAtq <- verdadeiro
                                       caso(9)
                                           // QUICK ATTACK (NORMAL)
                                           verifAtq <- verdadeiro
                                       caso(10)
                                           // SUPERPOWER (LUTADOR)
                                           verifAtq <- verdadeiro
                                       caso(11)
                                           // THUNDER (ELETRICO)
                                           verifAtq <- verdadeiro
                                       caso(15)
                                           // LEAF BLADE (PLANTA)
                                           verifAtq <- verdadeiro
                                       outroCaso
                                                // Caso nao seja um dos ataques anteriores, verifAtq recebe falso e o processo e repetido de novo.
                                                verifAtq <- falso
                                fimEscolha
                          ate ((verifAtq = verdadeiro) e ((atqRandom <> x) e (atqRandom <> y))) // Concicoes para encerrar repeticao, o ataque tambem nao pode ser um dos passados pelo parâmetro.

               fimEscolha

               retorne atqRandom // Quando o ataque e permitido para o pokemon utilizar, ele retorna o endereco do ataque.
   fimFuncao

   procedimento ataquesDex() // Atribui os dados referentes aos Ataques dos Pokemon em suas matrizes.

         var
            dadosCharAtq: vetor [1..4, 1..2] de caracter // Cabo de transferencia dos dados do tipo caracter.
            dadosFloatAtq: vetor [1..4, 1..6] de real // Cabo de transferencia dos dados do tipo real.

            atqPosic: inteiro // Representa o numero de ataques de cada pokemon dentro das repeticoes, indo do 1 ate o 4.
            atqSelec: real // Recebe o endereco do ataque.

         inicio

               para atqPosic de 1 ate 4 faca // Repete quatro vezes, para os quatro ataques do Pokemon.

                   // atqPosic representa a linha referente ao ataque, a coluna 1 e referente ao endereco do ataque.

                   se (powerUpBusca = falso) entao // Condicional que verifica se esta acontecendo uma busca dos ataques para o PowerUp ou nao.
                      // Se for falso, entao o procedimento irar buscar quatro ataques para o pokemon selecionado.

                      se (indice = 1) entao // Se o indice for 1, entao os ataques serao buscados para o Pokemon do Jogador.
                        atqSelec <- sttsAtqJogador[atqPosic,1]

                      seNao // Se o indice nao for 1, ele sera 2, e buscara os dados dos ataques para o Pokemon Rival.
                           atqSelec <- sttsAtqRival[atqPosic,1]

                      fimSe
                   seNao
                        // Se powerUpBusca for verdadeiro, entao o procedimento irar buscar dois aleatoriamente para o procedimento de PowerUp.
                        atqSelec <- endAtqsRandom(sttsAtqJogador[3,1], sttsAtqJogador[4,1])
                   fimSe

                   escolha (atqSelec) // O endereco do ataque e selecionado.

                          // Os dados de tipo caracter e real sao atribuidos a matrizes de escopo local.

                          caso (1)

                              dadosCharAtq[atqPosic,1] <- "  BUBBLE    " // Nome de exibicao
                              dadosCharAtq[atqPosic,2] <- "BUBBLE       | AGUA    | ESPECIAL |  40 |  80 |  " // Descricao para MENU de ataques.

                              dadosFloatAtq[atqPosic,1] <- 001 //   Endereco do ataque.
                              dadosFloatAtq[atqPosic,2] <- 004 //   TIPAGEM (1/8)
                              dadosFloatAtq[atqPosic,3] <- 040 //   FORCA (%)
                              dadosFloatAtq[atqPosic,4] <- 080 //   PRECISAO (%)
                              dadosFloatAtq[atqPosic,5] <- 002 //   CATEGORIA (1/2)
                              dadosFloatAtq[atqPosic,6] <- 003 //   USOS

                          caso (2)

                              dadosCharAtq[atqPosic,1] <- "  EMBER     " // Nome de exibicao
                              dadosCharAtq[atqPosic,2] <- "EMBER        | FOGO    | ESPECIAL |  45 |  80 |  " // Descricao para MENU de ataques.

                              dadosFloatAtq[atqPosic,1] <- 002 //   Endereco do ataque.
                              dadosFloatAtq[atqPosic,2] <- 003 //   TIPAGEM (1/8)
                              dadosFloatAtq[atqPosic,3] <- 045 //   FORCA (%)
                              dadosFloatAtq[atqPosic,4] <- 080 //   PRECISAO (%)
                              dadosFloatAtq[atqPosic,5] <- 002 //   CATEGORIA (1/2)
                              dadosFloatAtq[atqPosic,6] <- 003 //   USO

                          caso (3)

                              dadosCharAtq[atqPosic,1] <- " TACKLE     " // Nome de exibicao
                              dadosCharAtq[atqPosic,2] <- "TACKLE       | NORMAL  | FISICO   |  35 |  80 |  " // Descricao para MENU de ataques.

                              dadosFloatAtq[atqPosic,1] <- 003 //   Endereco do ataque.
                              dadosFloatAtq[atqPosic,2] <- 001 //   TIPAGEM (1/8)
                              dadosFloatAtq[atqPosic,3] <- 035 //   FORCA (%)
                              dadosFloatAtq[atqPosic,4] <- 080 //   PRECISAO (%)
                              dadosFloatAtq[atqPosic,5] <- 001 //   CATEGORIA (1/2)
                              dadosFloatAtq[atqPosic,6] <- 006 //   USO

                          caso (4)

                              dadosCharAtq[atqPosic,1] <- "  SPARK     " // Nome de exibicao
                              dadosCharAtq[atqPosic,2] <- "SPARK        | ELETRICO| ESPECIAL |  40 |  70 |  " // Descricao para MENU de ataques.

                              dadosFloatAtq[atqPosic,1] <- 004 //   Endereco do ataque.
                              dadosFloatAtq[atqPosic,2] <- 007 //   TIPAGEM (1/8)
                              dadosFloatAtq[atqPosic,3] <- 040 //   FORCA (%)
                              dadosFloatAtq[atqPosic,4] <- 070 //   PRECISAO (%)
                              dadosFloatAtq[atqPosic,5] <- 002 //   CATEGORIA (1/2)
                              dadosFloatAtq[atqPosic,6] <- 004 //   USO

                          caso (5)

                              dadosCharAtq[atqPosic,1] <- "VINE WHIP   " // Nome de exibicao
                              dadosCharAtq[atqPosic,2] <- "VINE WHIP    | PLANTA  | ESPECIAL |  40 |  80 |  " // Descricao para MENU de ataques.

                              dadosFloatAtq[atqPosic,1] <- 005 //   Endereco do ataque.
                              dadosFloatAtq[atqPosic,2] <- 002 //   TIPAGEM (1/8)
                              dadosFloatAtq[atqPosic,3] <- 040 //   FORCA (%)
                              dadosFloatAtq[atqPosic,4] <- 080 //   PRECISAO (%)
                              dadosFloatAtq[atqPosic,5] <- 002 //   CATEGORIA (1/2)
                              dadosFloatAtq[atqPosic,6] <- 003 //   USO

                          caso (6)

                              dadosCharAtq[atqPosic,1] <- "ROCK TOMB   " // Nome de exibicao
                              dadosCharAtq[atqPosic,2] <- "ROCK TOMB    | PEDRA   | ESPECIAL |  60 |  65 |  " // Descricao para MENU de ataques.

                              dadosFloatAtq[atqPosic,1] <- 006 //   Endereco do ataque.
                              dadosFloatAtq[atqPosic,2] <- 005 //   TIPAGEM (1/8)
                              dadosFloatAtq[atqPosic,3] <- 060 //   FORCA (%)
                              dadosFloatAtq[atqPosic,4] <- 065 //   PRECISAO (%)
                              dadosFloatAtq[atqPosic,5] <- 002 //   CATEGORIA (1/2)
                              dadosFloatAtq[atqPosic,6] <- 003 //   USO

                          caso (7)

                              dadosCharAtq[atqPosic,1] <- "MEGAHORN    " // Nome de exibicao
                              dadosCharAtq[atqPosic,2] <- "MEGAHORN     | INSETO  | FISICO   |  80 |  70 |  " // Descricao para MENU de ataques.

                              dadosFloatAtq[atqPosic,1] <- 007 //   Endereco do ataque.
                              dadosFloatAtq[atqPosic,2] <- 006 //   TIPAGEM (1/8)
                              dadosFloatAtq[atqPosic,3] <- 080 //   FORCA (%)
                              dadosFloatAtq[atqPosic,4] <- 070 //   PRECISAO (%)
                              dadosFloatAtq[atqPosic,5] <- 001 //   CATEGORIA (1/2)
                              dadosFloatAtq[atqPosic,6] <- 003 //   USO

                          caso (8)

                              dadosCharAtq[atqPosic,1] <- "KARATE CHOP " // Nome de exibicao
                              dadosCharAtq[atqPosic,2] <- "KARATE CHOP  | LUTADOR | FISICO   |  55 |  80 |  " // Descricao para MENU de ataques.

                              dadosFloatAtq[atqPosic,1] <- 008 //   Endereco do ataque.
                              dadosFloatAtq[atqPosic,2] <- 008 //   TIPAGEM (1/8)
                              dadosFloatAtq[atqPosic,3] <- 055 //   FORCA (%)
                              dadosFloatAtq[atqPosic,4] <- 080 //   PRECISAO (%)
                              dadosFloatAtq[atqPosic,5] <- 001 //   CATEGORIA (1/2)
                              dadosFloatAtq[atqPosic,6] <- 004 //   USO

                          caso (9)

                              dadosCharAtq[atqPosic,1] <- "QUICK ATTACK" // Nome de exibicao
                              dadosCharAtq[atqPosic,2] <- "QUICK ATTACK | NORMAL  | FISICO   |  50 | +99 |  " // Descricao para MENU de ataques.

                              dadosFloatAtq[atqPosic,1] <- 009 //   Endereco do ataque.
                              dadosFloatAtq[atqPosic,2] <- 001 //   TIPAGEM (1/8)
                              dadosFloatAtq[atqPosic,3] <- 050 //   FORCA (%)
                              dadosFloatAtq[atqPosic,4] <- 300 //   PRECISAO (%)
                              dadosFloatAtq[atqPosic,5] <- 001 //   CATEGORIA (1/2)
                              dadosFloatAtq[atqPosic,6] <- 003 //   USO

                          caso (10)

                              dadosCharAtq[atqPosic,1] <- "SUPERPOWER  " // Nome de exibicao
                              dadosCharAtq[atqPosic,2] <- "SUPERPOWER   | LUTADOR | FISICO   |  90 |  40 |  " // Descricao para MENU de ataques.

                              dadosFloatAtq[atqPosic,1] <- 010 //   Endereco do ataque.
                              dadosFloatAtq[atqPosic,2] <- 008 //   TIPAGEM (1/8)
                              dadosFloatAtq[atqPosic,3] <- 090 //   FORCA (%)
                              dadosFloatAtq[atqPosic,4] <- 040 //   PRECISAO (%)
                              dadosFloatAtq[atqPosic,5] <- 001 //   CATEGORIA (1/2)
                              dadosFloatAtq[atqPosic,6] <- 004 //   USO

                          caso (11)

                              dadosCharAtq[atqPosic,1] <- " THUNDER    " // Nome de exibicao
                              dadosCharAtq[atqPosic,2] <- "THUNDER      | ELETRICO| ESPECIAL |  75 |  40 |  " // Descricao para MENU de ataques.

                              dadosFloatAtq[atqPosic,1] <- 011 //   Endereco do ataque.
                              dadosFloatAtq[atqPosic,2] <- 007 //   TIPAGEM (1/8)
                              dadosFloatAtq[atqPosic,3] <- 075 //   FORCA (%)
                              dadosFloatAtq[atqPosic,4] <- 040 //   PRECISAO (%)
                              dadosFloatAtq[atqPosic,5] <- 002 //   CATEGORIA (1/2)
                              dadosFloatAtq[atqPosic,6] <- 003 //   USO

                          caso (12)

                              dadosCharAtq[atqPosic,1] <- "SIGNAL BEAM " // Nome de exibicao
                              dadosCharAtq[atqPosic,2] <- "SIGNAL BEAM  | INSETO  | ESPECIAL |  60 |  80 |  " // Descricao para MENU de ataques.

                              dadosFloatAtq[atqPosic,1] <- 012 //   Endereco do ataque.
                              dadosFloatAtq[atqPosic,2] <- 006 //   TIPAGEM (1/8)
                              dadosFloatAtq[atqPosic,3] <- 060 //   FORCA (%)
                              dadosFloatAtq[atqPosic,4] <- 080 //   PRECISAO (%)
                              dadosFloatAtq[atqPosic,5] <- 002 //   CATEGORIA (1/2)
                              dadosFloatAtq[atqPosic,6] <- 003 //   USO

                          caso (13)

                              dadosCharAtq[atqPosic,1] <- " AQUA TAIL  " // Nome de exibicao
                              dadosCharAtq[atqPosic,2] <- "AQUA TAIL    | AGUA    | FISICO   |  65 |  80 |  " // Descricao para MENU de ataques.

                              dadosFloatAtq[atqPosic,1] <- 013 //   Endereco do ataque.
                              dadosFloatAtq[atqPosic,2] <- 004 //   TIPAGEM (1/8)
                              dadosFloatAtq[atqPosic,3] <- 065 //   FORCA (%)
                              dadosFloatAtq[atqPosic,4] <- 080 //   PRECISAO (%)
                              dadosFloatAtq[atqPosic,5] <- 001 //   CATEGORIA (1/2)
                              dadosFloatAtq[atqPosic,6] <- 002 //   USO

                          caso (14)

                              dadosCharAtq[atqPosic,1] <- " FIRE PUNCH " // Nome de exibicao
                              dadosCharAtq[atqPosic,2] <- "FIRE PUNCH   | FOGO    | FISICO   |  70 |  75 |  " // Descricao para MENU de ataques.

                              dadosFloatAtq[atqPosic,1] <- 014 //   Endereco do ataque.
                              dadosFloatAtq[atqPosic,2] <- 003 //   TIPAGEM (1/8)
                              dadosFloatAtq[atqPosic,3] <- 070 //   FORCA (%)
                              dadosFloatAtq[atqPosic,4] <- 075 //   PRECISAO (%)
                              dadosFloatAtq[atqPosic,5] <- 001 //   CATEGORIA (1/2)
                              dadosFloatAtq[atqPosic,6] <- 002 //   USO

                          caso (15)

                              dadosCharAtq[atqPosic,1] <- " LEAF BLADE " // Nome de exibicao
                              dadosCharAtq[atqPosic,2] <- "LEAF BLADE   | PLANTA  | FISICO   |  60 |  80 |  " // Descricao para MENU de ataques.

                              dadosFloatAtq[atqPosic,1] <- 015 //   Endereco do ataque.
                              dadosFloatAtq[atqPosic,2] <- 002 //   TIPAGEM (1/8)
                              dadosFloatAtq[atqPosic,3] <- 060 //   FORCA (%)
                              dadosFloatAtq[atqPosic,4] <- 080 //   PRECISAO (%)
                              dadosFloatAtq[atqPosic,5] <- 001 //   CATEGORIA (1/2)
                              dadosFloatAtq[atqPosic,6] <- 002 //   USO
                   fimEscolha

                   // Secao de atribuicao dos dados nas matrizes locais para as globais.

                   se (powerUpBusca = falso) entao
                     // Se powerUpBusca for falso, ele atribui os dados de cada ataque a cada loop.

                     se (indice = 1) entao
                       // Se o indice for 1, a matriz local passa os dados para o Jogador.

                       dicioAtqJogador[atqPosic,1] <- dadosCharAtq[atqPosic,1] // Passagem de nome do ataque.
                       dicioAtqJogador[atqPosic,2] <- dadosCharAtq[atqPosic,2] // Passagem de descricao do ataque.

                       sttsAtqJogador[atqPosic,1] <- dadosFloatAtq[atqPosic,1] // Passagem de numeracao do ataque.
                       sttsAtqJogador[atqPosic,2] <- dadosFloatAtq[atqPosic,2] // Passagem de tipo do ataque.
                       sttsAtqJogador[atqPosic,3] <- dadosFloatAtq[atqPosic,3] // Passagem de forca do ataque.
                       sttsAtqJogador[atqPosic,4] <- dadosFloatAtq[atqPosic,4] // Passagem de precisao do ataque.
                       sttsAtqJogador[atqPosic,5] <- dadosFloatAtq[atqPosic,5] // Passagem de categoria do ataque.
                       sttsAtqJogador[atqPosic,6] <- dadosFloatAtq[atqPosic,6] // Passagem de uso do ataque.

                     seNao // Se o indice for 2, a matriz local passa os dados para o Rival.

                          dicioAtqRival[atqPosic,1] <- dadosCharAtq[atqPosic,1] // Passagem de nome do ataque.
                          dicioAtqRival[atqPosic,2] <- dadosCharAtq[atqPosic,2] // Passagem de descricao do ataque.

                          sttsAtqRival[atqPosic,1] <- dadosFloatAtq[atqPosic,1] // Passagem de numeracao do ataque.
                          sttsAtqRival[atqPosic,2] <- dadosFloatAtq[atqPosic,2] // Passagem de tipo do ataque.
                          sttsAtqRival[atqPosic,3] <- dadosFloatAtq[atqPosic,3] // Passagem de forca do ataque.
                          sttsAtqRival[atqPosic,4] <- dadosFloatAtq[atqPosic,4] // Passagem de precisao do ataque.
                          sttsAtqRival[atqPosic,5] <- dadosFloatAtq[atqPosic,5] // Passagem de categoria do ataque.
                          sttsAtqRival[atqPosic,6] <- dadosFloatAtq[atqPosic,6] // Passagem de uso do ataque.
                     fimSe

                   seNao // Se powerUpBusca for verdadeiro

                        se (atqPosic > 2) entao // Encerra a repeticao depois do segundo loop.
                          interrompa            // O powerup busca apenas dois ataques.

                        seNao // Se o loop nao for maior que 2, e atribuido os dados para a matriz de powerup.

                             dicioAtqUp[atqPosic,1] <- dadosCharAtq[atqPosic,1] // Passagem de nome do ataque.
                             dicioAtqUp[atqPosic,2] <- dadosCharAtq[atqPosic,2] // Passagem de descricao do ataque.

                             statusAtqUp[atqPosic,1] <- dadosFloatAtq[atqPosic,1] // Passagem de numeracao do ataque.
                             statusAtqUp[atqPosic,2] <- dadosFloatAtq[atqPosic,2] // Passagem de tipo do ataque.
                             statusAtqUp[atqPosic,3] <- dadosFloatAtq[atqPosic,3] // Passagem de forca do ataque.
                             statusAtqUp[atqPosic,4] <- dadosFloatAtq[atqPosic,4] // Passagem de precisao do ataque.
                             statusAtqUp[atqPosic,5] <- dadosFloatAtq[atqPosic,5] // Passagem de categoria do ataque.
                             statusAtqUp[atqPosic,6] <- dadosFloatAtq[atqPosic,6] // Passagem de uso do ataque.
                        fimSe

                   fimSe

               fimPara

   fimProcedimento

// =============================================================================
//  => ESCOPO ONDE OCORRE AS BATALHAS.
// =============================================================================

   procedimento batalhaArena() // Procedimento principal das batalhas.

               var
                  saidaArena: logico // Confirma saida da arena e finalizacao do jogo.
                  n: inteiro // Variavel para loops.

               inicio
                     saidaArena <- falso // Saida da Arena e resetada no inicio do procedimento.

                     para n de 1 ate 3 faca

                           //  1º LOOP = Primeiro Round de Batalha.
                           //  2º LOOP = Segundo Round de Batalha.
                           //  3º LOOP = Verifica o vencedor.

                           se (n <= 2) entao // Se for o loop do primeiro ou do segundo round.

                             dificuldade <- n // Dificuldade recebe nivel do numero do loop.
                             defineRival() // Escolhe Rival com base na dificuldade.

                           fimSe

                           se (n > 1) entao // Se o loop for maior que 1, exibe telas de finais de round.

                               saidaArena <- fimRounds(n) // Determina se o jogo sera encerrado, ou se ira para o proximo round.

                           fimSe


                           // DENTRO DAS BATALHAS

                           se (saidaArena = falso) entao // Caso o jogo ainda esteja em andamento.

                             batalhaPk() // Chama procedimento de Batalha.

                           seNao
                                interrompa // Interrompe a repeticao caso a saida seja verdadeira
                           fimSe

                     fimPara
   fimProcedimento

      procedimento defineRival() // Busca o Pokemon do primeiro Rival

               var
               inicio
                     indice <- 2 // Indice sempre recebe 2 para selecionar linha do Rival nas matrizes.

                     // Escolhe pokemon com base na dificuldade e no pokemon do Jogador.
                     // Dificuldade 1 para o round 1, dificuldade 2 para o round 2.

                     se (dificuldade = 1) entao // Se a dificuldade for 1...

                       escolha (statusPk[1,1]) // Seleciona numeracao do Pokemon do Jogador.

                              caso(1)

                                  // Caso pokemon do jogador seja 1 (Squirtle).
                                  inJogador <- 2 // Rival escolhe 2 (Charmander).
                                  pokeDex() // Chama procedimento para receber dados do Pokemon escolhido.
                              caso(2)

                                  // Caso pokemon do jogador seja 2 (Charmander).
                                  inJogador <- 3 // Rival escolhe 3 (Bulbasaur).
                                  pokeDex() // Chama procedimento para receber dados do Pokemon escolhido.
                              caso(3)

                                  // Caso pokemon do jogador seja 3 (Bulbasaur).
                                  inJogador <- 1 // Rival escolhe 1 (Squirtle).
                                  pokeDex() // Chama procedimento para receber dados do Pokemon escolhido.
                       fimEscolha

                     seNao
                          se (dificuldade = 2) entao // Se a dificuldade for 2...

                            escolha (statusPk[1,1]) // Seleciona numeracao do Pokemon do Jogador.

                                   caso(1)

                                       // Caso pokemon do jogador seja 1 (Squirtle).
                                       inJogador <- 3 // Rival escolhe 3 (Bulbasaur).
                                       pokeDex() // Chama procedimento para receber dados do Pokemon escolhido.
                                   caso(2)

                                       // Caso pokemon do jogador seja 2 (Charmander).
                                       inJogador <- 1 // Rival escolhe 1 (Squirtle).
                                       pokeDex() // Chama procedimento para receber dados do Pokemon escolhido.
                                   caso(3)

                                       // Caso pokemon do jogador seja 1 (Bulbasaur).
                                       inJogador <- 2 // Rival escolhe 2 (Charmander).
                                       pokeDex() // Chama procedimento para receber dados do Pokemon escolhido.
                            fimEscolha

                          fimSe
                     fimSe
   fimProcedimento

   funcao fimRounds(n_: inteiro): logico // Determina saida da arena e as telas de exibicao em fins de rounds.
         var
         inicio
               se ((vidaBtl[1] <= 0) e (vidaBtl[2] > 0)) entao // Se o Jogador foi derrotado.

                  telaDerrota() // Exibe tela de Derrota.

                  retorne verdadeiro // Retorna verdadeiro para encerrar repeticao de Rounds.

               seNao
                    se (n_ = 2) entao // Se o Jogador nao foi derrotado e e segundo Loop.

                      telaVitoria() // Tela de vitoria do Round 1.
                      telaPowerUp() // Tela de powerUp

                      danoBtl[1] <- 0 // Zerando dano de batalha.
                      danoBtl[2] <- 0
                      vidaBtl[1] <- statusPk[1,6] // Restaurando vida do Pokemon do Jogador.

                      retorne falso // Retorna falso para a saida da arena.

                    seNao
                         se ( (n_ = 3) e ((vidaBtl[1] > 0) e (vidaBtl[2] <= 0)) ) entao // Se acabou o Round 2 e o Jogador venceu.

                           zerouTela() // Tela de fim de jogo para o Jogador que venceu.

                           retorne verdadeiro // Retorna verdadeiro para saida da arena.

                         fimSe
                    fimSe
               fimSe
   fimFuncao

   procedimento batalhaPk() // Onde cada batalha ocorre até que um dos Pokémon não tenha mais vida.
               var
                  atqAcerto: inteiro // Refere-se a quem acertou o ataque e ataca primeiro.
                  saidaBatalha: logico // Determina se a batalha ja foi encerrada.
                  n: inteiro // Variavel para repeticao.

               inicio
                     inAtq[1] <- 0 // Reseta escolha dos oponentes.
                     inAtq[2] <- 0

                     atqPreced <- 0 // Zera Precedencia de ataques.
                     contMsg <- 3 // Contador de mensagens de exibicao recebe 3.

                     verifUso <- verdadeiro // Verificador do USO dos ataques recebe verdadeiro para indicar que o ataque possui uso.

                     telaRound() // Exibicao do numero do Round antes dele ser iniciado.
                     asciiPk() //  Exibe pokemon em batalha.

                     repita
                           atqAcerto <- defineAtq()  // Chama funcao para definir os ataques e quem acerta primeiro.

                           se (verifUso = verdadeiro) entao // Se o Jogador escolheu um ataque que ainda possui uso.

                                 saidaBatalha <- batalhaTurnos(atqAcerto) // Inicia um turno de batalha.

                           seNao // Se o Jogador escolheu um ataque que nao possui uso.

                                para n de 1 ate 2 faca // Dois loops para exibicao de mensagens.

                                    se (n > 1) entao // No segundo Loop zeram as escolhas dos oponentes.

                                      inAtq[1] <- 0 // Quando zeradas as escolhas dos oponentes, o Jogador pode escolher seu proximo ataque.
                                      inAtq[2] <- 0

                                    fimSe

                                    asciiPk() // Reimprime a tela dos Pokemon.

                                fimPara
                         fimSe

                     ate(saidaBatalha = verdadeiro) // Condicao para encerrar a batalha.
   fimProcedimento

   funcao batalhaTurnos(atqAcerto_: inteiro): logico // Onde ocorre cada turno das batalhas.
         var
            selecOponente: inteiro // Variavel que recebe indice do oponente contrario.
            encerraBatalha: logico // Determina se a batalha deve ser encerrada ou nao.
            n: inteiro // Variavel para repeticao.

         inicio
               encerraBatalha <- falso // Reseta variavel logica de encerramento de batalha sempre que e iniciado.

               para n de 1 ate 3 faca

               //  1º LOOP = Ataque do pokemon mais veloz no turno.
               //  2º LOOP = Ataque do pokemon mais lento no turno.
               //  3º LOOP = Escolha do ataque do proximo turno.

                   se ((vidaBtl[1] <= 0) ou (vidaBtl[2] <= 0)) entao // Se um dos oponentes foi derrotado.

                     inAtq[1] <- 0 // Zeram as escolhas.
                     inAtq[2] <- 0

                     encerraBatalha <- verdadeiro

                     retorne encerraBatalha // Retorna verdadeiro para encarrar batalha.

                   seNao
                        retorne falso // Retorna falso caso nenhum dos oponentes tenha tido sua vida zerada.
                   fimSe

                   se ((n < 3) e (inAtq[2] > 0)) entao // Se for

                     executaAtq(atqAcerto_, n) // Executa formulas de dano e define precedencia dos ataques.

                     selecOponente <- trocaIndice(indice) // Invertendo indice.

                    vidaBtl[selecOponente] <- vidaBtl[selecOponente] - danoBtl[indice] // Subtraindo vida do pokemon pelo dano causado pelo seu oponente.

                   seNao
                        inAtq[1] <- 0 // Se for o terceiro round, as escolhas de ataques sao zeradas.
                        inAtq[2] <- 0 // Essa e a condicao para o Jogador escolher seu proximo ataque.
                   fimSe

                   se (encerraBatalha = falso) entao // Se encerra batalha for falso...
                     asciiPk() // Exbibe tela dos Pokemon com informacoes atualizadas.
                   fimSe

               fimPara
   fimFuncao

// =============================================================================
//  => TELAS DE EXIBICAO DA BATALHA.
// =============================================================================

   procedimento asciiPk() // Exibicao de interface de batalha.

               var
                  trocaVida: logico // Alterna entre a exibicao da vida do Rival e do Jogador.
               inicio
                          limpaTela

                          trocaVida <- falso // Troca vida recebe falso para iniciar exibindo vida do Rival.

                          escolha (statusPk[2,1]) // Seleciona numeracao do Pokemon Rival.

                                 caso (1)
                                 // Caso seja Squirtle.
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                         ___                                  |")
escrevaL("   |                                                                                                    _.---   ----.                             |")
vidaPk(trocaVida) // Chama procedimento de exibicao de barra de vida.
escrevaL("      /         _   -.                           |")
escrevaL("   |                                                                                                  | `       / `    \                          |")
escrevaL("   |                                                                                                  |-'|      |-'|    |                         |")
escrevaL("   |                                                                                                  /--        --     |-.                       |")
escrevaL("   |                                              ____   _____________                                \__   .  .        / /\_                     |")
escrevaL("   |                                              \   \ /   /   _____/                                 \ ----___-----/\| |   --.                  |")
escrevaL("   |                                               \   Y   /\_____  \                               .---`----____---_)  \ \-__  \                 |")
escrevaL("   |                                                \     / /        \                              ) <    |__    __\_   \ \     |                |")
escrevaL("   |                                                 \___/ /_______  /                              --.__ /   ----   \   \ \     |                |")
escrevaL("   |                                                               \/                                    --.   |     .--.-' |    |                |")
escrevaL("   |                                                                                                      | \___|___/     / /     |               |")
escrevaL("   |               _________________________________________________________________________              | /   |   \     | |  /  |               |")
escrevaL("   |               \                                                                        \             \     |   --___ \ \/  /                 |")
escreva("   |                \  ")
msgTela() // Procedimento de descricoes de ataques.
escrevaL("              /\__ / `._ /   --\ \_/                |")
escrevaL("   |                 \________________________________________________________________________\           /    \_____|      |`-                   |")
escrevaL("   |                                                                                                     |      |    |      |                     |")
escrevaL("   |                                                                                                      \     |    |      |                     |")
escrevaL("   |                                                                                                      >______)   /_/\/\_\                     |")

                                 caso (2)
                                 // Caso seja Charmander.
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                             _.---.                           |")
escrevaL("   |                                                                                                          ,'      `.                          |")
vidaPk(trocaVida) // Chama procedimento de exibicao de barra de vida.
escrevaL("            /|     _   \                         |")
escrevaL("   |                                                                                                        |_)    /_)\ '|                        |")
escrevaL("   |                                                                                                       /       |__)  |                        |")
escrevaL("   |                                                                                                      |   , ,        .                        |")
escrevaL("   |                                              ____   _____________                                    ._           _ |               , ' \ `  |")
escrevaL("   |                                              \   \ /   /   _____/                                   __ `._  __,-`   |       __,_   ,`'   L,| |")
escrevaL("   |                                               \   Y   /\_____  \                                   \ \ - .|._   __-_ _,-,.'   -/  /  +.   ,  |")
escrevaL("   |                                                \     / /        \                                   (,, \,,_\  ''   | `.   ___)    ,'  |+  | |")
escrevaL("   |                                                 \___/ /_______  /                                      \.   |        \     /       |       ''|")
escrevaL("   |                                                               \/                                       \.   |        \     /       |       ''|")
escrevaL("   |                                                                                                          |._'         \  '\          .  +  | |")
escrevaL("   |                                                                                                             |          '   \          `._  ,'|")
escrevaL("   |               _________________________________________________________________________                     |           |   L         ,' |   |")
escrevaL("   |               \                                                                        \                   `           |   |        /  '     |")
escreva("   |                \  ")
msgTela()
escrevaL("                    ' \         | _._ ,-_,-'   ,'   |")
escrevaL("   |                 \________________________________________________________________________\                 |     `.    /    |  |___,/        |")
escrevaL("   |                                                                                                         _,/`.    7`'---'     |               |")
escrevaL("   |                                                                                                        /`    _,'      | _ _.|                |")
escrevaL("   |                                                                                                        '-'--)        `'!|-!                  |")

                                 caso (3)
                                 // Caso seja Bulbasaur.
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
vidaPk(trocaVida) // Chama procedimento de exibicao de barra de vida.
escrevaL("                `;,;.;,;.;.'                     |")
escrevaL("   |                                                                                                              ..:;:;::;:                      |")
escrevaL("   |                                                                                                        ..--''' '' ' ' '''--.                 |")
escrevaL("   |                                                                                                      /' .   .'        '.   .`\               |")
escrevaL("   |                                              ____   _____________                                   | /    /            \   '.|              |")
escrevaL("   |                                              \   \ /   /   _____/                                   | |   :             :    :|              |")
escrevaL("   |                                               \   Y   /\_____  \                                  .'| |   :             :    :|              |")
escrevaL("   |                                                \     / /        \                               ,: /\ \.._\ __..===..__/_../ /`.             |")
escrevaL("   |                                                 \___/ /_______  /                              |'' |  :.|  `'          `'  |.'  ::.          |")
escrevaL("   |                                                               \/                               |   |  ''|    :'';          | ,  `''\         |")
escrevaL("   |                                                                                                |.:  \/  | /'-.`'   ':'.-'\ |  \,   |         |")
escrevaL("   |               _________________________________________________________________________        | '  /  /  | / |...   | \ |  |  |';'|         |")
escrevaL("   |               \                                                                        \        \ _ |:.|  |_\_|`.'   |_/_|  |.:| _ |         |")
escreva("   |                \  ")
msgTela() // Procedimento de descricoes de ataques.
escrevaL("      /,.,.|' \__       . .      __/ '|.,.,\        |")
escrevaL("   |                 \________________________________________________________________________\          | ':`.`----._____.---'.'   |             |")
escrevaL("   |                                                                                                      \   `:'''-------'''' |   |              |")
escrevaL("   |                                                                                                       ',-,-',             .'-=,=,            |")
escrevaL("   |                                                                                                                                              |")

                          fimEscolha

                          trocaVida <- Verdadeiro // trocaVida recebe verdadeiro para exibir vida do Pokemon do Jogador.

                          escolha (statusPk[1,1]) // Seleciona numeracao do Pokemon do Jogador.

                                 caso (1)
                                 // Caso seja Squirtle.

escrevaL("   |                      ___                                                                                                                     |")
escrevaL("   |                 .----   ---._                                                                                                                |")
escrevaL("   |               .-   _         \                                                                                                               |")
escrevaL("   |              /    ` \       ` |                                                                                                              |")
escrevaL("   |             |    |'-|      |'-|                     . ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___                        |")
escrevaL("   |           .-|     --        --\                     |                         |         |          |           |     |                       |")
escrevaL("   |         _/\ \        .  .   __/                     |  LISTA  DE  ATAQUES     | TIPO    | CATEGORIA| FORC| PREC| USO |                       |")
escrevaL("   |      .--   | |/\-----___---- /                      |-------------------------+---------+----------+-----+-----+-----|                       |")
escrevaL("   |     /  __-/ /  (_---____----`---.                   |  [ 1 ] ->  ", dicioAtqJogador[1,2], sttsAtqJogador[1,6], " |                       |")
escrevaL("   |    |     / /   _/__    __|    < (                   |  [ 2 ] ->  ", dicioAtqJogador[2,2], sttsAtqJogador[2,6], " |                       |")
escrevaL("   |    |     / /   /   ----   \ __.--                   |  [ 3 ] ->  ", dicioAtqJogador[3,2], sttsAtqJogador[3,6], " |                       |")
escrevaL("   |    |    | '-.--.     |   .--                        |  [ 4 ] ->  ", dicioAtqJogador[4,2], sttsAtqJogador[4,6], " |                       |")
escrevaL("   |   |     \ \     \___|___/ |                         |___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___.|                       |")
escrevaL("   |   |  \  | |     /   |   \ |                                                                                                                  |")
escrevaL("   |    \  \/ / ___--   |     /                                                                                                                   |")
escrevaL("   |     \_/ /--   \ _.` \ __/\                                                                                                                   |")
escrevaL("   |       -`|      |_____/    \                                                                                                                  |")
escreva("   |         |      |    |      |         ")
vidaPk(trocaVida) // Chama procedimento de exibicao de barra de vida.
escrevaL("          |")
escrevaL("   |         |      |    |     /                                                                                                                  v")
escreva("   |_ _ _ _ _/_/\/\_\_ _(______>")
respLinha()

                                 caso (2)
                                 // Caso seja Charmander.
escrevaL("   |                              .---._                                                                                                          |")
escrevaL("   |                             .`      ',                                                                                                       |")
escrevaL("   |                            /   _     |\                                                                                                      |")
escrevaL("   |                           |' /(_\     (|                                                                                                     |")
escrevaL("   |                           |  (__|       \           . ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___                        |")
escrevaL("   |                           .        , ,   |          |                         |         |          |           |     |                       |")
escrevaL("   |     ` / ' ,               | _           _.          |  LISTA  DE  ATAQUES     | TIPO    | CATEGORIA| FORC| PREC| USO |                       |")
escrevaL("   |    |,/   '`,   _,__       |   `-,__  _.` __         |-------------------------+---------+----------+-----+-----+-----|                       |")
escrevaL("   |     ,   .+  \  \-   '.,-,_ _-__   _.|. - / /        |  [ 1 ] ->  ", dicioAtqJogador[1,2], sttsAtqJogador[1,6], " |                       |")
escrevaL("   |    |  +|  ',    (___   .` |   ''  /_,,/ ,,)         |  [ 2 ] ->  ", dicioAtqJogador[2,2], sttsAtqJogador[2,6], " |                       |")
escrevaL("   |   ''       |       \     /        |   ./            |  [ 3 ] ->  ", dicioAtqJogador[3,2], sttsAtqJogador[3,6], " |                       |")
escrevaL("   |    |  +  .          /'  /         '_.|              |  [ 4 ] ->  ", dicioAtqJogador[4,2], sttsAtqJogador[4,6], " |                       |")
escrevaL("   |   ',  _.`          /   '          |                 |___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___.|                       |")
escrevaL("   |      | ',         |   |           |                                                                                                          |")
escrevaL("   |       '  \        |   |           `                                                                                                          |")
escrevaL("   |        ',   '-,_-, _._ |         / '                                                                                                         |")
escrevaL("   |           \,___|  |    \    .`     |                                                                                                         |")
escreva("   |                  |     '---'`     .`\,_    ")
vidaPk(trocaVida) // Chama procedimento de exibicao de barra de vida.
escrevaL("    |")
escrevaL("   |                   |._ _ |      ',_    `\                                                                                                     v")
escreva("   |_ _ _ _ _ _ _ _ _ _ _!-|!'_ _ _ _ _(--'-'")
respLinha()

                                 caso (3)
                                 // Caso seja Bulbasaur.
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                `;,;.;,;.;.'                                                                                                                  |")
escrevaL("   |                 ..:;:;::;:                                                                                                                   |")
escrevaL("   |           ..--''' '' ' ' '''--.                     . ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___                        |")
escrevaL("   |         /' .   .'        '.   .`\                   |                         |         |          |           |     |                       |")
escrevaL("   |        | /    /            \   '.|                  |  LISTA  DE  ATAQUES     | TIPO    | CATEGORIA| FORC| PREC| USO |                       |")
escrevaL("   |        | |   :             :    :|                  |-------------------------+---------+----------+-----+-----+-----|                       |")
escrevaL("   |      .'| |   :             :    :|                  |  [ 1 ] ->  ", dicioAtqJogador[1,2], sttsAtqJogador[1,6], " |                       |")
escrevaL("   |    ,: /\ \.._\ __..===..__/_../ /`.                 |  [ 2 ] ->  ", dicioAtqJogador[2,2], sttsAtqJogador[2,6], " |                       |")
escrevaL("   |   |'' |  :.|  `'          `'  |.'  ::.              |  [ 3 ] ->  ", dicioAtqJogador[3,2], sttsAtqJogador[3,6], " |                       |")
escrevaL("   |   |   |  ''|    :'';          | ,  `''\             |  [ 4 ] ->  ", dicioAtqJogador[4,2], sttsAtqJogador[4,6], " |                       |")
escrevaL("   |   |.:  \/  | /'-.`'   ':'.-'\ |  \,   |             |___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___.|                       |")
escrevaL("   |   | '  /  /  | / |...   | \ |  |  |';'|                                                                                                      |")
escrevaL("   |    \ _ |:.|  |_\_|`.'   |_/_|  |.:| _ |                                                                                                      |")
escrevaL("   |   /,.,.|' \__       . .      __/ '|.,.,\                                                                                                     |")
escreva("   |        | ':`.`----._____.---'.'   |            ")
vidaPk(trocaVida) // Chama procedimento de exibicao de barra de vida.
escrevaL("|")
escrevaL("   |         \   `:'''-------'''' |   |                                                                                                           |")
escrevaL("   |          ',-,-',             .'-=,=,                                                                                                         v")
escreva("   | _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _")
respLinha()
                          fimEscolha

   fimProcedimento

// =============================================================================
//  => ELEMENTOS INTERATIVOS NA INTERFACE DE BATALHA
// =============================================================================

   procedimento vidaPk(trocaVida_: logico) // Exibicao da barra de vida dos Pokemon durante a batalha.

               var
                  indice_: inteiro // Indice de escopo local para nao alterar o indice globsl.
                  selecOponente: inteiro // Seleciona pokemon contrario.
                  vidaDiv: inteiro // Barra de vida (+)
                  danoDiv: inteiro // Dano sofrido. (-)
                  semVida: inteiro // Vida perdida ( )

                  n: inteiro // Variavel para repeticao.

               inicio
                     se (trocaVida_ = verdadeiro) entao // Se troca vida for verdadeiro...
                       indice_ <- 1 // indice_ recebe 1 (Jogador).
                     seNao
                          se (trocaVida_ = falso) entao // Se troca vida for falso...
                            indice_ <- 2 // indice_ recebe 2 (Rival).
                          fimSe
                     fimSe

                     se (indice_ = 2) entao // Se indice_ for igual a 2 (Rival)...
                       escreva("   |            ") // Espacamento para ajustar interface.

                     seNao // Se indice_ for igual a 1 (Jogador)...
                          escreva("             ") // Espacamento para ajustar interface.
                     fimSe

                     escreva(dicioPk[indice_,1], "VIDA [") // Exibe nome do Pokemon e indicacao da sua vida ao lado.

                     se (vidaBtl[indice_] > 0) entao // Se a vida do Pokemon for maior que zero...

                       vidaDiv <- int((vidaBtl[indice_] * 30) / statusPk[indice_,6]) // Divide a vida atual do Pokemon vezes trinta dividido por vida inicial.

                       selecOponente <- trocaIndice(indice_) // Seleciona o Pokemon contrario.

                       danoDiv <- int((danoBtl[selecOponente] * 30) / statusPk[indice_,6]) // Dano causado pelo pokemon contrario vezzes trinta dividido pela vida inicial do Pokemon.

                       para n de 1 ate vidaDiv faca // de 1 ate vida do atual do pokemon dividida em 30 partes.
                           escreva("+") // Escreve quantidade com simbolo de (+).

                       fimPara

                       se (vidaBtl[indice_] <> statusPk[indice_,6]) entao // Se a vida da batalha for diferente da vida inicial do Pokemon...

                         para n de 1 ate danoDiv faca // De 1 ate dano recebido dividido em 30 partes.
                             escreva("-") // Escreve quantidade com simbolo de (-).
                         fimPara

                       fimSe

                       semVida <- ((30 - vidaDiv) - danoDiv) // 30 menos vida atual menos dano recebido = vida perdida.

                       para n de 1 ate semVida faca // De 1 ate vida perdida pelo Pokemon durante a batalha.
                           escreva(" ") // Escreve quantidade com espacos.
                       fimPara

                     seNao // Se a vida do Pokemon for menor ou igual a zero.
                          para n de 1 ate 30 faca // De 1 ate 30...
                              escreva("-") // Escreve (-) para representar vida esgotada.
                          fimPara
                     fimSe

                     escreva("]                                 ") // Espacamento para alinhar interface de batalha.
   fimProcedimento

   procedimento msgTela() // Exibicao de mensagem de descricao de ataques na interface de batalha.

               var
                  verif: logico // Verifica se ataque acertou.
                  atqUtilizado: caractere // Recebe nome do ataque utilizado.
               inicio
                     verif <- falso

                     se ((inAtq[1] = 0) e (inAtq[2] = 0)) entao // Se as escolhas dos oponentes forem 0, exibe mensagem para inserir ataque.
                       escreva("ESCOLHA O SEU ATAQUE!                                                 \") // Espacamento para alinhar interface.

                     seNao // Se foram escolhidos ataques...

                          se (verifUso = verdadeiro) entao // Se o ataque ainda tiver uso...

                            se (indice = 1) entao // Se o indice for 1 (Jogador)...

                              atqUtilizado <- dicioAtqJogador[inAtq[1],1] // Atribui ataque escolhido pelo Jogador.

                            seNao // Se o indice for 2 (Rival)...

                                 atqUtilizado <- dicioAtqRival[inAtq[2],1] // Atribui ataque escolhido pelo Rival.
                            fimSe


                            escolha(atqPreced) // Seleciona a precedencia de ataque.
                                   caso(0)
                                       // Caso nenhum tenha acertado a mensagem para cada um sera:

                                       escreva(dicioPk[indice,1], "tentou usar ", atqUtilizado, ", porem o ataque falhou.           \")
                                   caso(1)
                                       // Caso apenas Jogador tenha acertado.

                                       se (indice = 1) entao // Se indice for 1 (Jogador)...

                                          // A mensagem exibida para o Jogador sera:
                                          escreva(dicioPk[indice,1], "usou ", atqUtilizado)

                                          verif <- verdadeiro // Verificador de acerto do ataque recebe verdadeiro.

                                       seNao // Se o indice for 2 (Rival)...

                                            // A mensagem exibida para o Rival sera:
                                            escreva(dicioPk[indice,1], "tentou usar ", atqUtilizado, ", porem o ataque falhou.           \")
                                       fimSe

                                   caso(2)
                                       // Caso apenas Rival tenha acertado.

                                       se (indice = 2) entao // Se indice for 2 (Rival)...

                                         // A mensagem exibida para o Rival sera:
                                         escreva(dicioPk[indice,1], "usou ", atqUtilizado)

                                         verif <- verdadeiro // Verificador de acerto do ataque recebe verdadeiro.

                                       seNao // Se o indice for 1 (Jogador)...

                                            // A mensagem exibida para o Jogador sera:
                                            escreva(dicioPk[indice,1], "tentou usar ", atqUtilizado, ", porem o ataque falhou.           \")
                                       fimSe

                                   caso(3)
                                       // Caso ambos tenham acertado e o Jogador ataca primeiro.

                                       // A mensagem exibida para ambos sera:
                                       escreva(dicioPk[indice,1], "usou ", atqUtilizado)

                                       verif <- verdadeiro // Verificador de acerto do ataque recebe verdadeiro.

                                   caso(4)
                                       // Caso ambos tenham acertado e o Rival ataca primeiro.

                                       // A mensagem exibida para ambos sera:
                                       escreva(dicioPk[indice,1], "usou ", atqUtilizado)

                                       verif <- verdadeiro // Verificador de acerto do ataque recebe verdadeiro.
                            fimEscolha

                            se (verif = verdadeiro) entao // Se verificador de acerto de ataque for verdadeiro...

                              escolha(atqEfetiv) // Seleciona efetividade do ataque.

                                     caso(1)
                                         // Caso o multiplicador de efetividade tenha sido x1.0
                                         escreva(", o ataque foi efetivo")

                                         se (criticVerif = verdadeiro) entao // Se o ataque teve dano critico...
                                           escreva(", com critico!      \")

                                         seNao // Se o ataque nao teve critico.
                                              escreva("!!                  \")
                                         fimSe

                                     caso(2)
                                         // Caso o multiplicador de efetividade tenha sido x0.5
                                         escreva(", o ataque foi pouco efetivo")

                                                se (criticVerif = verdadeiro) entao // Se o ataque teve dano critico...
                                                  escreva(", com critico!\")

                                                seNao // Se o ataque nao teve critico.
                                                     escreva("!!            \")
                                                fimSe

                                     caso(3)
                                         // Caso o multiplicador de efetividade tenha sido x1.5
                                         escreva(", o ataque foi super efetivo")

                                         se (criticVerif = verdadeiro) entao // Se o ataque teve dano critico...
                                           escreva(", com critico!\")

                                         seNao // Se o ataque nao teve critico.
                                              escreva("!!            \")
                                         fimSe
                              fimEscolha
                            fimSe

                          seNao // Se Jogador nao tem mais usos para um ataque.
                               escreva(dicioPk[1,1], "nao tem mais usos para ", dicioAtqJogador[inAtq[1],1],", tente outro!          \")
                          fimSe
                     fimSe
   fimProcedimento

   procedimento respLinha() // Linha de instrucao para entrada do Jogador (ENTER ou ESCOLHA DE ATAQUE).

               var
                  respLayout: logico // Determina qual instrucao deve ser exibida durante um turno.

               inicio
                     se ( (contMsg >= 3) e (verifUso = verdadeiro) ) entao // Se Contador de Mensagens for maior ou igual a tres, e ataque tiver uso...

                       respLayout <- verdadeiro // Resposta do Layout recebe verdadeiro.
                       contMsg <- 0 // Contador de mensagens e zerado.

                     seNao // Se Contador de Mensagens nao for maior ou igual a 3 e/ou ataques nao tiverem uso...

                          contMsg <- contMsg + 1 // Contador de Mensagem recebe + 1

                          se ( (contMsg >= 2) e (verifUso = falso) ) entao // Se o contador de Mensagens for maior ou igual a 2 e ataque nao tiver uso...

                            respLayout <- verdadeiro // Resposta do Layout recebe verdadeiro.
                            contMsg <- 0 // Contador de mensagens e zerado.
                          seNao
                               contMsg <- contMsg + 1 // Contador de Mensagem recebe + 1
                          fimSe
                     fimSe

                     escolha(respLayout) // Seleciona Resposta de Layout.

                            caso(verdadeiro)
                                // Caso Verdadeiro, exibe descricao para inserir entrada.
                                timer(30)
                                escreva(" _ _ _ _ _ _")
                                escreva("D")
                                escreva("I")
                                escreva("G")
                                escreva("I")
                                escreva("T")
                                escreva("E")
                                escreva(" ")
                                escreva("A")
                                escreva("Q")
                                escreva("U")
                                escreva("I")
                                escreva(" ")
                                escreva("=")
                                escreva(">")
                                escreva(" ")
                                timer(0)
                            caso(falso)
                                // Caso falso, exibe descricao para teclar enter.
                                timer(30)
                                escreva(" _ _ _ _ _ _")
                                escreva(">")
                                escreva(" ")
                                escreva("T")
                                escreva("E")
                                escreva("C")
                                escreva("L")
                                escreva("E")
                                escreva(" ")
                                escreva("E")
                                escreva("N")
                                escreva("T")
                                escreva("E")
                                escreva("R")
                                escreva(" ")
                                escreva("<")
                                leia(enter)
                                timer(0)
                     fimEscolha

   fimProcedimento

// =============================================================================
//  => ESCOLHA DE ATAQUES.
// =============================================================================

   funcao defineAtq(): inteiro // Define ataques escolhidos pelo Jogador e Rival, e a ordem de precedencia de cada.

               var
                  // Elemento 1 dos vetores sempre sera referente ao Jogador, e o 2 ao Rival.

                  precAtq: vetor [1..2] de real // Precisao dos ataques do Jogador e do Rivsl.
                  atqAcerto: vetor [1..2] de inteiro // Quem acertou o ataque.
                  rapidezPk: vetor [1..2] de real // Rapidez do Jogador e do Rival.

                  d100: real // Variavel que recebera numero aleatorio de 1 a 100
                  n: inteiro // Variavel para repeticao.
                  idAcerto: inteiro // Valor referente a quem acertou o ataque ou quem ataca primeiro.

                  atqCatg: real // Categoria do ataque.
                  mlpAtqF: real // Multiplicador para ataques Fisicos
                  somaAcerto: inteiro // Soma do acerto/erro de ataques de Jogador e Rival.

               inicio
                     leia(inAtq[1]) // Jogador escolhe seu ataque.

                     verifInAtq() // Procedimento para verificar se ataque escolhido e valido.

                     verifAtqUso() // Verifica se o ataque escolhido pelo Jogador ainda tem uso.

                     inAtq[2] <- rivalIA() // Inicia escolha de ataque do Rival.

                     se (verifUso = verdadeiro) entao // Se ataque ainda tiver uso...

                       idAcerto <- 1 // Variavel para identificar quem acertou o ataque, no primeiro loop vale 1.

                       para n de 1 ate 2 faca // Dois loops para escolha de ataque do Jogador e do Rival.

                           escolha (inAtq[n])

                                  caso(1)
                                      // Caso tenha escolhido o primeiro ataque.

                                      se (n = 1) entao // Se for o ataque do Jogador...

                                        precAtq[n] <- sttsAtqJogador[1,4] // Atribui precisao do primeiro ataque.

                                      seNao // Se for o ataque do Rival...

                                           precAtq[n] <- sttsAtqRival[1,4] // Atribui precisao do primeiro ataque.
                                      fimSe

                                  caso(2)
                                      // Caso tenha escolhido o segundo ataque.

                                      se (n = 1) entao // Se for o ataque do Jogador...

                                        precAtq[n] <- sttsAtqJogador[2,4] // Atribui precisao do segundo ataque.

                                      seNao // Se for o ataque do Rival...

                                           precAtq[n] <- sttsAtqRival[2,4] // Atribui precisao do segundo ataque.
                                      fimSe

                                  caso(3)
                                      // Caso tenha escolhido o terceiro ataque.

                                      se (n = 1) entao // Se for o ataque do Jogador...

                                        precAtq[n] <- sttsAtqJogador[3,4] // Atribui precisao do terceiro ataque.

                                      seNao // Se for o ataque do Rival...

                                           precAtq[n] <- sttsAtqRival[3,4] // Atribui precisao do terceiro ataque.
                                      fimSe

                                  caso(4)
                                      // Caso tenha escolhido o quarto ataque.

                                      se (n = 1) entao // Se for o ataque do Jogador...

                                        precAtq[n] <- sttsAtqJogador[4,4] // Atribui precisao do quarto ataque.

                                      seNao // Se for o ataque do Rival...

                                           precAtq[n] <- sttsAtqRival[4,4] // Atribui precisao do quarto ataque.
                                      fimSe
                           fimEscolha

                           d100 <- randi(99)+1 // d100 recebe numero aleatorio de 1 a 100.

                           se ( d100 > precAtq[n]) entao // Se d100 for maior que a precisao do ataque...

                             atqAcerto[n] <- 0 // Valor de acerto do ataque e zero.

                           seNao // Se d100 for menor que a precisao do ataque...

                                atqAcerto[n] <- atqAcerto[n] + idAcerto // Soma valor do acerto do ataque mais identificador de acerto.
                           fimSe

                           idAcerto <- idAcerto + 1 // A partir do segundo loop, passa a valer 2.

                       fimPara

                       somaAcerto <- atqAcerto[1] + atqAcerto[2] // Atribui soma do valor de acerto do Jogador e do Rival.

                       escolha (somaAcerto)

                              caso(0)
                                  // Caso a soma seja 0...

                                  retorne 0 // Ninguem acertou os ataques.
                              caso(1)
                                  // Caso a soma seja 1...

                                  retorne 1 // Apenas Jogador acertou seu ataque.
                              caso(2)
                                  // Caso a soma seja 2...

                                  retorne 2 // Apenas Rival acertou seu ataque.
                              caso(3)
                                  // Caso a soma seja 3...
                                  // Amobos acertaram

                                  // Definicao de quem ataca primeiro:

                                  repita
                                        para n de 1 ate 2 faca // Repeticao define a rapidez do ataque de cada pokemon, comecando pelo Jogador.

                                            se (n = 1) entao // Se n for 1 (Jogador)...

                                              atqCatg <- sttsAtqJogador[inAtq[n],5] // Atribui categoria do ataque escolhido pelo Jogador.

                                            seNao // Se n for 2 (Rival)...

                                                 atqCatg <- sttsAtqRival[inAtq[n],5] // Atribui categoria do ataque escolhido pelo Rival.
                                            fimSe

                                            se (atqCatg = 1) entao // Se categoria do ataque for 1 (Fisico).,,

                                              mlpAtqF <- 0.25 // Multiplicador de ataque fisico recebe 0.25

                                            seNao // Se categoria do ataque for 2 (Especial)...

                                                 mlpAtqF <- 0 // Multiplicador de ataque fisico recebe 0
                                            fimSe

                                            // Formula de rapidez.
                                            rapidezPk[n] <- mlpAtqF + (randi(10) * 10^ -2)
                                            rapidezPk[n] <- rapidezPk[n] - ((100 - precAtq[n]) * 10 ^ - 2) * 0.25
                                            rapidezPk[n] <- rapidezPk[n] + 1
                                            rapidezPk[n] <- statusPk[n,4] * rapidezPk[n]
                                        fimPara

                                        se (rapidezPk[1] > rapidezPk[2]) entao // Se rapidez do Pokemon do Jogador for maior que rapidez do Rival...

                                          retorne 3 // Retorna 3 quando ambos acertaram e jogador ataca primeiro.
                                        fimSe

                                        se (rapidezPk[2] > rapidezPk[1]) entao // Se rapidez do Rival for maior do que rapidez do Pokemon do Jogador...

                                          retorne 4 // Retorna 4 quando ambos acertaram e rival ataca primeiro
                                        fimSe

                                  ate ( (rapidezPk[1] > rapidezPk[2]) ou (rapidezPk[2] > rapidezPk[1]) ) // Repete ate a rapidez de um dos oponentes for maior que a outra.
                       fimEscolha

                     fimSe
   fimFuncao

   procedimento verifInAtq() // Verifica se o ataque escolhido pelo Jogador é válido.
               var
               inicio
                     escolha(inAtq[1]) // Seleciona ataque do Jogador.

                            // Nada acontece caso a escolha for de 1 a 4
                            caso(1)
                            caso(2)
                            caso(3)
                            caso(4)

                            outroCaso
                                     // Exibe pausadamente mensagem de opcao invalida.
                                     timer(25)
                                     escreva("                                                                         => ")
                                     escreva("O")
                                     escreva("P")
                                     escreva("C")
                                     escreva("A")
                                     escreva("O")
                                     escreva(" ")
                                     escreva("N")
                                     escreva("Â")
                                     escreva("O")
                                     escreva(" ")
                                     escreva("R")
                                     escreva("E")
                                     escreva("C")
                                     escreva("O")
                                     escreva("N")
                                     escreva("H")
                                     escreva("E")
                                     escreva("C")
                                     escreva("I")
                                     escreva("D")
                                     escreva("A")
                                     escreva(" ")
                                     escreva("O")
                                     escreva(" ")
                                     escreva("A")
                                     escreva("T")
                                     escreva("A")
                                     escreva("Q")
                                     escreva("U")
                                     escreva("E")
                                     escreva(" ")
                                     escreva("S")
                                     escreva("E")
                                     escreva("R")
                                     escreva("A")
                                     escreva(" ")

                                     se (inAtq[1] < 1) entao // Se o ataque escolhido for menor que 1...
                                       inAtq[1] <- 1 // O ataque do pokemon do Jogador sera 1.
                                       escreva(dicioAtqJogador[1,1]) // Escreve o nome do ataque no final da mensagem.
                                     seNao
                                          se (inAtq[1] > 4) entao // Se o ataque escolhido for maior que 4...
                                            inAtq[1] <- 4 // O ataque do pokemon do Jogador sera 4.
                                            escreva(dicioAtqJogador[4,1]) // Escreve o nome do ataque no final da mensagem.

                                          seNao // Se a escolha do usuario nao for um numero inteiro
                                               inAtq[1] <- randi(3)+1 // Escolhe um numero aleatorio entre 1 e 4 para ser o ataque do Pokemon do Jogador.
                                               escreva(dicioAtqJogador[inAtq[1],1]) // Escreve o nome do ataque no final da mensagem.
                                          fimSe
                                     fimSe
                     fimEscolha
                     timer(0) // Reseta timer no fim do procedimento.
   fimProcedimento

   procedimento verifAtqUso() // Verifica se o ataque ainda possui usos.
         var
         inicio
               se (sttsAtqJogador[inAtq[1],6] <= 0) entao // Se o uso do ataque for menor ou igual a zero...
                 verifUso <- falso // Verificador de uso recebe falso.

               seNao // Se o uso do ataque for maior que zero.

                    sttsAtqJogador[inAtq[1],6] <- sttsAtqJogador[inAtq[1],6] - 1 // O uso e subtraido por 1.
                    verifUso <- verdadeiro // E verificador de uso recebe verdadeiro.
               fimSe

   fimProcedimento

   funcao rivalIA(): inteiro // Inteligencia Artificial do Rival

         var
            frqzaJogador: vetor [1..2] de inteiro // Guarda fraquezas do pokemon do Jogador.
            atqsFortes: vetor [1..4] de inteiro // Guarda quais sao os ataques fortes contra o pokemon do Jogador.

            d100: inteiro // Variavel para receber numero aleatorio de 1 a 100.
            n, m: inteiro // Variaveis para repeticao.
         inicio
               escolha (dicioPk[1,2]) // Seleciona o tipo do pokemon do Jogador.

                      caso ("AGUA")

                          // Caso for agua...
                          frqzaJogador[1] <- 2 // Fraqueza 1 recebe 2 (PLANTA).
                          frqzaJogador[2] <- 7 // Fraqueza 2 recebe 7 (ELETRICO).

                      caso ("FOGO")

                          // Caso for fogo...
                          frqzaJogador[1] <- 4 // Fraqueza 1 recebe 4 (AGUA).
                          frqzaJogador[2] <- 5 // Fraqueza 2 recebe 5 (PEDRA).

                      caso ("PLANTA")

                          // Caso for planta...
                          frqzaJogador[1] <- 3 // Fraqueza 1 recebe 3 (FOGO).
                          frqzaJogador[2] <- 6 // Fraqueza 2 recebe 6 (INSETO).

               fimEscolha

               // Identifica os Ataques do Rival que sao vantajosos contra o Jogador

               para n de 1 ate 4 faca // Quatro loops para cada ataque do Rival.

                   para m de 1 ate 2 faca // Dois loops para cada fraqueza do pokemon do Jogador.

                       se (sttsAtqRival[n,2] = frqzaJogador[m]) entao // Se o tipo do ataque do rival for igual a fraqueza do pokemon do Jogador.

                         escolha (n) // Escolhe ataque definido pelo loop em questao da repeticao.

                                caso(1)
                                    // Caso o primeiro ataque seja forte contra o pokemon do Jogador.

                                    atqsFortes[1] <- 1 // Elemento 1 do vetor de ataques fortes recebe 1.

                                caso(2)
                                    // Caso o segundo ataque seja forte contra o pokemon do Jogador.

                                    atqsFortes[2] <- 1 // Elemento 2 do vetor de ataques fortes recebe 1.

                                caso(3)
                                    // Caso o terceiro ataque seja forte contra o pokemon do Jogador.

                                    atqsFortes[3] <- 1 // Elemento 3 do vetor de ataques fortes recebe 1.

                                caso(4)
                                    // Caso o quarto ataque seja forte contra o pokemon do Jogador.

                                    atqsFortes[4] <- 1 // Elemento 4 do vetor de ataques fortes recebe 1.
                         fimEscolha

                       fimSe
                   fimPara
               fimPara


               d100 <- randi(99) + 1 // d100 recebe um numero aleatorio de 1 a 100.

               escolha (dificuldade) // Determina o Ataque com base na dificuldade do jogo

                      caso(1)
                          // Caso a dificuldade seja 1 (Round 1).

                          se ((atqsFortes[1] + atqsFortes[2] + atqsFortes[3] + atqsFortes[4]) = 0) entao
                            // Se a soma dos elementos do vetor for igual a zero...
                            // Significa que nenhum ataque do Rival e forte contra o Pokemon do Jogador.

                            n <- randi(3) + 1 // N recebe um numero aleatorio de 1 a 4, referente a um dos 4 ataques do Rival.

                            retorne(n) // Retorna o numero do ataque que sera utilizado.

                          seNao // Se o Rival tiver um ataque forte contra o Pokemon do Jogador.

                               se (d100 <= 20) entao // Se o numero aleatorio for menor ou igual a 20...
                                 // 20(%) e a porcentagem de chance do Rival escolher um ataque forte na dificuldade 1.

                                 repita
                                       n <- randi(3) + 1 // Aleatorio de 1 a 4.

                                 // Ate o ataque randomicamente selecionado for um ataque forte e o uso desse ataque for maior que zero.
                                 ate ((atqsFortes[n] > 0) e (sttsAtqRival[n,6] > 0))

                                 retorne(n) // Retorna o numero do ataque que sera utilizado.

                               seNao // Se o numero aleatorio for maior que 20...

                                    repita
                                       n <- randi(3) + 1 // Aleatorio de 1 a 4.

                                    // Ate o ataque randomicamente selecionado nao for um ataque forte e o uso desse ataque for maior que zero.
                                    ate ((atqsFortes[n] <= 0) e (sttsAtqRival[n,6] > 0))

                                    retorne(n) // Retorna o numero do ataque que sera utilizado.
                               fimSe
                          fimSe

                      caso(2)
                          // Caso a dificuldade seja 2 (Round 2).

                          se ((atqsFortes[1] + atqsFortes[2] + atqsFortes[3] + atqsFortes[4]) = 0) entao
                            // Se a soma dos elementos do vetor for igual a zero...
                            // Significa que nenhum ataque do Rival e forte contra o Pokemon do Jogador.

                            n <- randi(3) + 1 // Aleatorio de 1 a 4.

                            retorne(n) // Retorna o numero do ataque que sera utilizado.

                          seNao
                               se (d100 <= 40) entao // Se o numero aleatorio for menor ou igual a 40...
                                 // 40(%) e a porcentagem de chance do Rival escolher um ataque forte na dificuldade 2.

                                 repita
                                       n <- randi(3) + 1 // Aleatorio de 1 a 4.

                                 // Ate o ataque randomicamente selecionado for um ataque forte e o uso desse ataque for maior que zero.
                                 ate ((atqsFortes[n] > 0) e (sttsAtqRival[n,6] > 0))

                                 retorne(n) // Retorna o numero do ataque que sera utilizado.

                               seNao // Se o numero aleatorio for maior que 20...

                                    repita
                                       n <- randi(3) + 1 // Aleatorio de 1 a 4.

                                    // Ate o ataque randomicamente selecionado nao for um ataque forte e o uso desse ataque for maior que zero.
                                    ate ((atqsFortes[n] <= 0) e (sttsAtqRival[n,6] > 0))

                                    retorne(n) // Retorna o numero do ataque que sera utilizado.
                               fimSe
                          fimSe

               fimEscolha
   fimFuncao

// =============================================================================
//  => PRECEDENCIA DOS ATAQUES E FORMULAS DE DANO.
// =============================================================================

   procedimento executaAtq(atqAcerto, n: inteiro) // Executa formulas de dano com base na ordem de acerto dos ataques.
               var
               inicio
                     // NOTA: danoBtl[x] refere-se ao dano que um Pokemon causou ao outro, nao dano recebido.

                     escolha(atqAcerto) // Seleciona o valor de acerto dos ataques.

                            caso(0)
                                // Caso ninguem acertou seu ataque.

                                se (n = 1) entao // Se for 1 (Jogador)...

                                  se (statusPk[1,4] > statusPk[2,4]) entao // Se a velocidade do Pokemon do Jogador for maior do que a do Rival...

                                    indice <- 1 // Indice recebe 1, para a mensagem da falha do ataque do Jogador aparecer primeiro.

                                  seNao
                                       se (statusPk[2,4] > statusPk[1,4]) entao  // Se a velocidade do Rival for maior...

                                         indice <- 2 // Indice recebe 2, para a mensagem da falha do ataque do Rival aparecer primeiro.
                                       fimSe
                                  fimSe

                                seNao // Se n for 2 (Rival)...
                                      indice <- trocaIndice(indice) // Indice recebe indice oposto no segundo Loop.
                                fimSe

                               atqPreced <- 0 // Precedencia do ataque recebe 0 para identificar quem ninguem acertou o ataque.
                               danoBtl[indice] <- 0 // O dano causado no turno e igual a zero.

                            caso(1)
                                // Caso apenas o Jogador tenha acertado o ataque.

                                indice <- n // Indice recebe n.

                                se (n = 1) entao // Se n for igual a 1 (Jogador)...

                                  danoBtl[indice] <- defineDano() // Executa funcao com formulas de batalha.

                                seNao // Se n for igual a 2 (Rival)...

                                     danoBtl[indice] <- 0 // O dano causado no turno pelo Rival e igual a zero.
                                fimSe

                                atqPreced <- 1 // Precedencia do ataque recebe 1 para identificar que apenas o Jogador acertou o ataque.

                            caso(2)
                               // Caso apenas o Rival acertou o ataque.

                               indice <- 3 - n // Se n for 1, indice recebe 2 (Rival), se n for 2, indice recebe 1 (Jogador).

                               se (n = 1) entao // Se n for igual a 1...

                                 danoBtl[indice] <- defineDano() // Chama funcao para calcular dano, porem, com o indice trocado, o dano sera referente ao Rival.

                               seNao // Se n for igual a 2...

                                    danoBtl[indice] <- 0 // Dano causado referente ao Jogador sera 0, gracas a mudacam de indice...
                               fimSe

                               atqPreced <- 2 // Precedencia do ataque recebe 2 para identificar que apenas o Rival acertou o ataque.

                            caso(3)
                                // Caso ambos acertaram o ataque e o Jogador ataca primeiro.

                                indice <- n // Indice recebe n referente ao loop da vez.

                                danoBtl[indice] <- defineDano() // Executa formulas de dano e atribui valor ao respectivo Pokemon.

                                atqPreced <- 3 // Precedencia do ataque recebe 3 para identificar que ambos acertaram o ataque e o Jogador ataca primeiro.

                            caso(4)
                                // Caso ambos acertaram o ataque e o Rival ataca primeiro.

                                indice <- 3 - n // n tem valor invertido, se for 1 se torna 2 (Rival), se for 2 se torna 1 (Jogador).

                                danoBtl[indice] <- defineDano() // Executa formulas de dano e atribui valor ao respectivo Pokemon.

                                atqPreced <- 4 // Precedencia do ataque recebe 4 para identificar que ambos acertaram o ataque e o Rival ataca primeiro.
                     fimEscolha
   fimProcedimento

   funcao defineDano(): real // Define dano causado pelos ataques.

         var
            danoLimpo: real // Dano sem os divisores da defesa do Pokemon contrario.
            danoCausado:  real // Dano com os divisores da defesa do Pokemon contrario.

            selecOponente: inteiro // Seleciona pokemon contrario.
            efetiv: real // Efetividade segundo a tipagem dos pokemon.
            atqCatg: real // Categoria do ataque (Fisico ou Especial, 1 ou 2).
            atqForc: real // Forca do ataque.
            atqNumTipo: inteiro // Numeracao do tipo do ataque.
            critico: real // Multiplicador de critico.

         inicio
               se (indice = 1) entao // Se o indice for 1 (Jogador)...

                 atqCatg <- sttsAtqJogador[inAtq[indice],5] // Recebe categoria do ataque escolhido pelo Jogador.
                 atqForc <- sttsAtqJogador[inAtq[indice],3] // Recebe forca do ataque escolhido pelo Jogador.
                 atqNumTipo <- int(sttsAtqJogador[inAtq[indice],2]) // Recebe tipo do ataque escolhido pelo Jogador.

               seNao
                    Se (indice = 2) entao  // Se o indice for 2 (Rival)...

                      atqCatg <- sttsAtqRival[inAtq[indice],5] // Recebe categoria do ataque escolhido pelo Rival.
                      atqForc <- sttsAtqRival[inAtq[indice],3] // Recebe forca do ataque escolhido pelo Rival.
                      atqNumTipo <- int(sttsAtqRival[inAtq[indice],2]) // Recebe tipo do ataque escolhido pelo Rival.
                    fimSe
               fimSe


               // FORMULAS DE DANO LIMPO //


               se (atqCatg = 1) entao // Se o ataque for Fisico...

                 // Formula de Ataques Fisicos para Dano Limpo
                 danoLimpo <- (statusPk[indice,2] * 10^ -2) // Ataque fisico do pokemon com duas virgulas a esquerda.
                 danoLimpo <- danoLimpo + ((statusPk[indice,4] * 10^ -2) * 0.5) // No ataque fisico, incrementa a velocidade do Pokemon a formula.
                 danoLimpo <- 7 * (1 + danoLimpo + (atqForc * 10^ -2)) // Forca do ataque e multiplicada.

               fimSe

               se (atqCatg = 2) entao // Se o ataque for Especial...

                 // Formula de Ataques Especiais para Dano Limpo
                 danoLimpo <- (statusPk[indice,3] * 10^ -2) // Ataque especial do pokemon com duas virgulas a esquerda.
                 danoLimpo <- 7 * (1 + danoLimpo + (atqForc * 10^ -2)) // Forca do ataque e multiplicada.

               fimSe

               critico <- defineCritico() // Define se o ataque sera critico.

               danoLimpo <- danoLimpo * critico // Acrescenta multiplicador de critico.

               selecOponente <- trocaIndice(indice) // Guarda indice do Pokemon contrario em uma variavel.

               efetiv <- defineVantagem(atqNumTipo, selecOponente) // Chama funcao para verificar a efetividade do ataque.


               // FORMULAS DE DANO CAUSADO //


               se (atqCatg = 1) entao // Se o ataque for Fisico...

                 // Formula de Ataques Fisicos para Dano Causado
                 danoCausado <- danoLimpo * efetiv // Acrescenta multiplicador de efetividade.
                 danoCausado <- danoCausado * (1 - ((statusPk[selecOponente, 5] * 10^ -2)* 0.5)) // Para ataques fisicos, a defesa reduz 50% do dano.

                 retorne danoCausado // Retorna ataque causado.
              fimSe

              se (atqCatg = 2) entao // Se o ataque for Especial...

                // Formula de Ataques Especiais para Dano Causado
                danoCausado <- danoLimpo * efetiv // Acrescenta multiplicador de efetividade.
                danoCausado <- danoCausado * (1 - ((statusPk[selecOponente, 5] * 10^ -2) * 0.3)) // Para ataques especiais, a defesa reduz 70% do dano.

                retorne danoCausado // Retorna ataque causado.
              fimSe

   fimFuncao

   funcao defineCritico(): real // Define se o ataque selecionado tera dano critico.
         var
         inicio
               se ((randi(99)+1) > (statusPk[indice,7] * 0.2)) entao // Se numero aleatorio de 1 a 100 for maior que 20% da sorte do Pokemon.

                 retorne 1 // Retorna x1 como multiplicador de dano.

                 criticVerif <- falso // Verificador de critico para exibicao de mensagem recebe falso (Variavel Global).

               seNao // Se numero aleatorio for menor que 20% da sorte do pokemon.

                    criticVerif <- verdadeiro // Verificador de critico para exibicao de mensagem recebe verdadeiro (Variavel Global).

                    retorne 1.7 // Retorna x1.7 como multiplicador de dano.
               fimSe
   fimFuncao

   funcao trocaIndice(n: inteiro): inteiro // Funcao para trocar de 1 para 2, ou de 2 para 1 (Jogador/Rival).

         var
         inicio

               se (n = 1) entao // Se n for 1 (Jogador)...

                 retorne 2 // Retorna 2 (Rival).

               SeNao // Se n for 2 (Rival)...

                    retorne 1 // Retorna 1 (Jogador).
               fimSe
   fimFuncao

   funcao defineVantagem(atqTipo, n: inteiro): real // Define efetividade de tipo dos ataques sobre os Pokemon.

         var
            selecOponente: inteiro // Recebe indice do Pokemon contrario.
            efetiv: real // Valor do multiplicador de efetividade do golpe.
            numEfetiv: inteiro // Identificador de efetividade para futura mensagem.

         inicio

               se ((atqTipo >= 1) e (atqTipo <= 4)) entao // Se o tipo do ataque for entre 1 e 4...
                 se ((atqTipo >= 1) e (atqTipo <= 2)) entao // Se o tipo do ataque for 1 ou 2...

                   se (atqTipo = 1) entao // se o tipo do ataque for NORMAL...

                     efetiv <- 1 // Multiplicador de efetividade sera x1.0
                   fimSe

                   se (atqTipo = 2) entao // se o tipo do ataque for PLANTA...

                     escolha (dicioPk[n, 2]) // Seleciona o tipo do Pokemon que sera atacado.

                            caso ("AGUA")
                                efetiv <- 1.5 // Caso AGUA, o multiplicador de dano recebe x1.5
                            caso ("PEDRA")
                                efetiv <- 1.5 // Caso PEDRA, o multiplicador de dano recebe x1.5

                            caso ("FOGO")
                                efetiv <- 0.5 // Caso FOGO, o multiplicador de dano recebe x0.5
                            caso ("INSETO")
                                efetiv <- 0.5 // Caso INSETO, o multiplicador de dano recebe x0.5
                            outroCaso
                                     efetiv <- 1 // Caso OUTRO TIPO, o multiplicador de dano recebe x1.0
                     fimEscolha
                   fimSe
                 fimSe

                 se ((atqTipo >= 3) e (atqTipo <= 4)) entao // Se o tipo do ataque for 3 ou 4...

                   se (atqTipo = 3) entao // Se o tipo do ataque for FOGO...

                     escolha (dicioPk[n, 2]) // Seleciona o tipo do Pokemon que sera atacado.

                            caso("PLANTA")
                                efetiv <- 1.5 // Caso PLANTA, o multiplicador de dano recebe x1.5
                            caso("INSETO")
                                efetiv <- 1.5 // Caso INSETO, o multiplicador de dano recebe x1.5

                            caso("AGUA")
                                efetiv <- 0.5 // Caso AGUA, o multiplicador de dano recebe x0.5
                            caso("PEDRA")
                                efetiv <- 0.5 // Caso PEDRA, o multiplicador de dano recebe x0.5
                            outroCaso
                                     efetiv <- 1 // Caso OUTRO TIPO, o multiplicador de dano recebe x1.0
                     fimEscolha
                   fimSe

                   se (atqTipo = 4) entao // AGUA

                     escolha (dicioPk[n, 2]) // Seleciona o tipo do Pokemon que sera atacado.

                            caso("FOGO")
                                efetiv <- 1.5 // Caso FOGO, o multiplicador de dano recebe x1.5
                            caso("PEDRA")
                                efetiv <- 1.5 // Caso PEDRA, o multiplicador de dano recebe x1.5

                            caso("PLANTA")
                                efetiv <- 0.5 // Caso PLANTA, o multiplicador de dano recebe x0.5

                            caso("ELETRICO")
                                efetiv <- 0.5 // Caso ELETRICO, o multiplicador de dano recebe x0.5
                            outroCaso
                                     efetiv <- 1 // Caso OUTRO TIPO, o multiplicador de dano recebe x1.0
                     fimEscolha
                   fimSe
                 fimSe
               fimSe

               se ((atqTipo >= 5) e (atqTipo <= 8)) entao // Se o tipo do ataque for entre 5 e 8...
                 se ((atqTipo >= 5) e (atqTipo <= 6)) entao // Se o tipo do ataque for 5 ou 6...

                   se (atqTipo = 5) entao // Se o tipo do ataque for PEDRA...

                     escolha (dicioPk[n, 2]) // Seleciona o tipo do Pokemon que sera atacado.

                            caso("FOGO")
                                efetiv <- 1.5 // Caso FOGO, o multiplicador de dano recebe x1.5
                            caso("INSETO")
                                efetiv <- 1.5 // Caso INSETO, o multiplicador de dano recebe x1.5
                            caso("ELETRICO")
                                efetiv <- 1.5 // Caso ELETRICO, o multiplicador de dano recebe x1.5

                            caso("AGUA")
                                efetiv <- 0.5 // Caso AGUA, o multiplicador de dano recebe x0.5
                            caso("PLANTA")
                                efetiv <- 0.5 // Caso PLANTA, o multiplicador de dano recebe x0.5
                            caso("LUTADOR")
                                efetiv <- 0.5 // Caso LUTADOR, o multiplicador de dano recebe x0.5
                            outroCaso
                                     efetiv <- 1 // Caso OUTRO TIPO, o multiplicador de dano recebe x1.0
                     fimEscolha
                   fimSe

                   se (atqTipo = 6) entao // Se o tipo do ataque for INSETO...

                     escolha (dicioPk[n, 2]) // Seleciona o tipo do Pokemon que sera atacado.

                            caso("PLANTA")
                                efetiv <- 1.5 // Caso PLANTA, o multiplicador de dano recebe x1.5
                            caso("LUTADOR")
                                efetiv <- 1.5 // Caso LUTADOR, o multiplicador de dano recebe x1.5

                            caso("FOGO")
                                efetiv <- 0.5 // Caso FOGO, o multiplicador de dano recebe x0.5
                            caso("PEDRA")
                                efetiv <- 0.5 // Caso PEDRA, o multiplicador de dano recebe x0.5
                            outroCaso
                                     efetiv <- 1 // Caso OUTRO TIPO, o multiplicador de dano recebe x1.0
                     fimEscolha
                   fimSe

                 fimSe

                 se ((atqTipo >= 7) e (atqTipo <= 8)) entao // Se o tipo do ataque for 7 ou 8...

                   se (atqTipo = 7) entao // se o tipo do ataque for ELETRICO...

                     escolha (dicioPk[n, 2]) // Seleciona o tipo do Pokemon que sera atacado.

                            caso("AGUA")
                                efetiv <- 1.5 // Caso AGUA, o multiplicador de dano recebe x1.5
                            caso("PEDRA")
                                efetiv <- 0.5 // Caso PEDRA, o multiplicador de dano recebe x0.5
                            outroCaso
                                     efetiv <- 1 // Caso OUTRO TIPO, o multiplicador de dano recebe x1.0
                     fimEscolha
                   fimSe

                   se (atqTipo = 8) entao // se o tipo do ataque for LUTADOR...

                     escolha (dicioPk[n, 2]) // Seleciona o tipo do Pokemon que sera atacado.

                            caso("PEDRA")
                                efetiv <- 1.5 // Caso PEDRA, o multiplicador de dano recebe x1.5
                            caso("INSETO")
                                efetiv <- 0.5 // Caso INSETO, o multiplicador de dano recebe x0.5
                            outroCaso
                                     efetiv <- 1 // Caso OUTRO TIPO, o multiplicador de dano recebe x1.0
                     fimEscolha
                   fimSe
                 fimSe
               fimSe

               se (efetiv = 1) entao // Se multiplicador de efetividade for igual a 1...

                 numEfetiv <- 1 // Numero identificador de efetividade recebe 1.
                 seNao
                      se (efetiv = 0.5) entao // Se multiplicador de efetividade for igual a 0.5 ...

                        numEfetiv <- 2 // Numero identificador de efetividade recebe 2.
                      seNao
                           se (efetiv = 1.5) entao // Se multiplicador de efetividade for igual a 1.5 ...

                             numEfetiv <- 3 // Numero identificador de efetividade recebe 3.
                           fimSe
                      fimSe
               fimSe

               atqEfetiv <- numEfetiv // Numero identificador de efetividade e atribuido a variavel de escopo global.

               retorne efetiv // Retorna multiplicador de efetividade.
   fimFuncao

// =============================================================================
//  => TELAS POS-BATALHA.
// =============================================================================

   procedimento telaDerrota() // Tela de exibicao de derrota do Jogador.
            var
            inicio
                  limpaTela // Limpa tela para imprimir nova interface.
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                       ,---.  |")
escrevaL("   |   ,--.   ,--.                      ,---.       ,--.      ,--.                             ,--.            ,--.         ,-.       ,-.  |   |  |")
escrevaL("   |    \  `.'  /,---.  ,---. ,---.    /  .-' ,---. `--'    ,-|  |,---. ,--.--.,--.--. ,---. ,-'  '-.,--,--. ,-|  | ,---.  / .',--,--.'. \ |  .'  |")
escrevaL("   |     \     /| .-. || .--'| .-. :   |  `-,| .-. |,--.   ' .-. | .-. :|  .--'|  .--'| .-. |'-.  .-' ,-.  |' .-. || .-. ||  |' ,-.  | |  ||  |   |")
escrevaL("   |      \   / ' '-' '\ `--.\   --.   |  .-'' '-' '|  |   \ `-' \   --.|  |   |  |   ' '-' '  |  | \ '-'  |\ `-' |' '-' '|  |\ '-'  | |  |`--'   |")
escrevaL("   |       `-'   `---'  `---' `----'   `--'   `---' `--'    `---' `----'`--'   `--'    `---'   `--'  `--`--' `---'  `---'  \ '.`--`--'.' / .--.   |")
escrevaL("   |                                                                                                                        `-'       `-'  '--'   |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                        _ __ ___   ___ _ __  _   _                                                            |")
escrevaL("   |                                                       | '_ ` _ \ / _ \ '_ \| | | |                                                           |")
escrevaL("   |                                                       | | | | | |  __/ | | | |_| |                                                           |")
escrevaL("   |                                                       |_|_|_| |_|\___|_| |_|\__,_|(1)                                                        |")
escrevaL("   |                                                         / _| ___  ___| |__   __ _ _ __                                                       |")
escrevaL("   |                                                        | |_ / _ \/ __| '_ \ / _` | '__|                                                      |")
escrevaL("   |                                                        |  _|  __/ (__| | | | (_| | |                                                         |")
escrevaL("   |                                                        |_|  \___|\___|_| |_|\__,_|_|(2)                                                      |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              v")
escreva("   |_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _DIGITE AQUI => ")

            leia(inMenu) // Opcao do Jogador.

            escolha (inMenu)
                   caso(1)
                       // Limpa tela e volta para o MENU principal.
                       limpaTela

                   caso(2)
                       // Saida do progama recebe verdadeiro e o Jogo e encerrado.
                       saida <- verdadeiro
                   outroCaso
                            limpaTela // Limpa tela e volta para o MENU principal.
            fimEscolha
   fimProcedimento

   procedimento telaRound() // Exibicao da tela de round.
               var
                  numExib: vetor [1..5] de caractere // Vetor que recebe linha a linha da impressao do digito referente ao round.
               inicio
                     escolha(dificuldade)
                            // Numeracao do round determinada pela dificuldade.
                            caso(1)
                                numExib[1] <- "      ,--.                                            |"
                                numExib[2] <- "     /   |            *                               |"
                                numExib[3] <- "     `|  |                                            |"
                                numExib[4] <- "      |  |                           *                |"
                                numExib[5] <- "      `--'                                            |"
                            caso(2)
                                numExib[1] <- "     ,---.                                            |"
                                numExib[2] <- "    '.-.  \                              *            |"
                                numExib[3] <- "     .-' .'                                           |"
                                numExib[4] <- "    /   '-.              *                            |"
                                numExib[5] <- "    '-----'                                           |"
                            caso(3)
                                numExib[1] <- "    ,----.                                            |"
                                numExib[2] <- "    '.-.  |                                           |"
                                numExib[3] <- "      .' <                *                           |"
                                numExib[4] <- "    /'-'  |                                *          |"
                                numExib[5] <- "    `----'                                            |"
                            caso(4)
                                numExib[1] <- "      ,---.                                           |"
                                numExib[2] <- "     /    |                                 *         |"
                                numExib[3] <- "    /  '  |                                           |"
                                numExib[4] <- "    '--|  |                 *                         |"
                                numExib[5] <- "       `--'                                           |"
                            caso(5)
                                numExib[1] <- "    ,-----.                   *                       |"
                                numExib[2] <- "    |  .--'                                           |"
                                numExib[3] <- "    '--. `\     *                                     |"
                                numExib[4] <- "    .--'  /                                           |"
                                numExib[5] <- "    `----'                                            |"
                     fimEscolha
limpaTela // Limpa tela para reimpressao de interface.
timer(20) // Define intervalo de tempo entre impressao de cada linha.
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                 *                                                                                                            |")
escrevaL("   |                                                                                            *                                                 |")
escrevaL("   |                                                                                                                  *                           |")
escrevaL("   |                         *                                                                                                                    |")
escrevaL("   |                                                          *                                                                                   |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                              *                                               |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                               *                                                                                      *       |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                               *                                                                                                              |")
escreva("   |                                                                                    ,--.")
// E impresso elemento a elemento do vetor para exibicao do numero do round.
escrevaL(numExib[1])
escreva("   |                             *                 ,--.--.  ,---.  ,--.,--. ,--,--,   ,-|  |")
escrevaL(numExib[2])
escreva("   |                                               |  .--' | .-. | |  ||  | |      \ ' .-. |")
escrevaL(numExib[3])
escreva("   |                                        *      |  |    ' '-' ' '  ''  ' |  ||  | \ `-' |")
escrevaL(numExib[4])
escreva("   |                                               `--'     `---'   `----'  `--''--'  `---' ")
escrevaL(numExib[5])
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                            *                                                                 |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                       *                      |")
escrevaL("   |                *                                                                                                                             |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                  *                                              *                                            |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                         *    |")
escrevaL("   |                                  *                                                                                                           |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                           *                                                                  |")
escrevaL("   |                                                                                                  *                                           |")
escrevaL("   |                  *                                                                                                                           |")
escrevaL("   |                                                              *                                                                               |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ |")
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
escreva
timer(0) // Reseta timer ao final da exibicao.
   fimProcedimento

   procedimento telaVitoria() // Exibicao caso o Jogador tenha vencido o primeiro round.
               var
                  n: inteiro // Variavel para loops.
               inicio

                     para n de 1 ate 2 faca // Repete duas vezes para exibir duas mensagens.

                         limpaTela // Limpa tela todo comeco de repeticao para reimprimir interface.
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                 ,---.                        |")
escrevaL("   |                      ,--.   ,--.                                                                                |   |                        |")
escrevaL("   |                       \  `.'  /   ,---.   ,---.  ,---.      ,--.  ,--.  ,---.  ,--,--,   ,---.  ,---.  ,--.,--. |  .'                        |")
escrevaL("   |                        \     /   | .-. | | .--' | .-. :      \  `'  /  | .-. : |      \ | .--' | .-. : |  ||  | |  |                         |")
escrevaL("   |                         \   /    ' '-' ' \ `--. \   --.       \    /   \   --. |  ||  | \ `--. \   --. '  ''  ' `--'                         |")
escrevaL("   |                          `-'      `---'   `---'  `----'        `--'     `----' `--''--'  `---'  `----'  `----'  .--.                         |")
escrevaL("   |                                                                                                                 '--'                         |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                       *                                   *                                                  |")
escrevaL("   |                                                                      *                                                                       |")
escrevaL("   |                                             *                                      *                                                         |")
escrevaL("   |                                    *     .____________________________________________________________     *                                 |")
escrevaL("   |                                          |                                                            |                                      |")
escrevaL("   |                                          |                                                            |                                      |")
escreva("   |                                *         |")
msgTelaVitoria(n) // Mensagem mostada na tela de derrota, variando a partir do parâmetro passada por ela.
escrevaL("   |                                    *     |                                                            |                                      |")
escrevaL("   |                                          |___________________________________________________________.|                                      |")
escrevaL("   |                                                                                                           *                                  |")
escrevaL("   |                                                                         *                                                                    |")
escrevaL("   |                                       *                                                        *                                             |")
escrevaL("   |                                                    *                                                                                         |")
escrevaL("   |                                                                                     *                                                        |")
escrevaL("   |                                               *                       *                                                                      |")
escrevaL("   |                                                         *                                 *                                                  |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              v")
escreva("   |_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _> TECLE ENTER < ")

                        leia(enter) // Entrada qualquer para avancar as instrucoes.
                     fimPara
   fimProcedimento

   procedimento msgTelaVitoria(n: inteiro) // Mensagens da tela de vitoria do primeiro round;
               var
               inicio
                     se (n = 1) entao // Se for o primeiro loop...
                       escreva(" Parabens! Agora voce ira avancar para o round ", (dificuldade),"!          |")
                     seNao // Se for o segundo loop...
                          escreva(" Espera... Parece que seu    ", dicioPk[1,1]," subiu de nivel!    |")
                     fimSe

                     escrevaL("                                      |") // Espacamento para imprimir a borda a interface.
   fimProcedimento

   procedimento telaPowerUp() // Secao de PowerUp para Jogador trocar um ataque de seu Pokemon.
            var
               atqNovo: inteiro // Ataque escolhido pelo Jogador.
               atqSubstituido: inteiro // Ataque que sera substituido pelo novo.
               saidaUpgrade: logico // Confirma saida do procedimento de powerUp.
               trocaMenu: logico // Troca entre o menu de ataques novos e dos ja pertencentes ao Pokemon.
               trocaAtq: logico // Confirma se o ataque sera trocado.
               n: inteiro // Variavel para repeticoes.

            inicio
                  // Resetando variaveis logicas antes de iniciar as proximas instrucoes do procedimento.
                  trocaMenu <- falso
                  trocaAtq <- falso
                  saidaUpgrade <- falso

                  indice <- 1 // Indice recebe 1 (referente a linha do Jogador na Matriz).
                  powerUpBusca <- verdadeiro // Variavel de confirmacao de busca dos ataques para secao de powerUp.
                  ataquesDex() // Chama procedimento para pegar os ataques randomicamente.

                  repita
                        limpaTela // Limpa a tela no comeco de cada repeticao para que a interface seja reimpressa.

escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                       .__                              .___                                                        ._.                       |")
escrevaL("   |                       |  |__   ________________      __| _/____   ______   ______  _  ______________ __ ________   | |                       |")
escrevaL("   |                       |  |  \ /  _ \_  __ \__  \    / __ |/  _ \  \____ \ /  _ \ \/ \/ /  __ \_  __ \  |  \____ \  | |                       |")
escrevaL("   |                       |   Y  (  <_> )  | \ / __ \_ / /_/ (  <_> ) |  |_> >  <_> )     /\  ___/|  | \/  |  /  |_> >  \|                       |")
escrevaL("   |                       |___|  /\____/|__|  (____  / \____ |\____/  |   __/ \____/ \/\_/  \___  >__|  |____/|   __/   __                       |")
escrevaL("   |                            \/                  \/       \/        |__|                      \/            |__|      \/                       |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
exibPk() // Exibe visual do Pokemon escolhido pelo Jogador.
escrevaL("   |                                                                                                                                              |")
                        // Mostra qual sera o proximo Rival do Jogador.
escrevaL("   |          SEU PROXIMO OPONENTE SERA: ", dicioPk[2,1], "                                                                                              |")
escrevaL("   |                                                                                                                                              |")
menuTrocaAtq(trocaMenu) // Procedimento para exibir ataques novos e ataques do Pokemon do Jogador.
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              v")
escreva("   |_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _DIGITE AQUI => ")

                        se (trocaMenu = falso) entao // Se a troca de menu for falsa...

                          leia(atqNovo) // Le o ataque novo escolhido pelo Jogador.

                          escolha(atqNovo)
                              caso(0)
                                  interrompa // Caso 0, interrompe a repeticao e avanca para o proximo round.
                              caso(1)
                                  trocaMenu <- verdadeiro // Caso o Jogador ecolha o ataque 1, a troca de menu e verdadeira.
                              caso(2)
                                  trocaMenu <- verdadeiro // Caso o Jogador escolha o ataque 2, a troca de menu e verdadeira.
                          fimEscolha

                        seNao // Se a troca de menu for verdadeira...

                             leia(atqSubstituido) // O Jogador escolhe qual ataque sera substituido pelo novo.

                             // Caso seja de 1 a 4, a troca de ataques e verdadeira.
                             escolha(atqSubstituido)
                                    caso(1)
                                        trocaAtq <- verdadeiro
                                    caso(2)
                                        trocaAtq <- verdadeiro
                                    caso(3)
                                        trocaAtq <- verdadeiro
                                    caso(4)
                                        trocaAtq <- verdadeiro
                                    outroCaso
                                             // Caso nao for um dos 4 ataques, a troca de menu recebe falso e e exibido o menu anterior.
                                             trocaMenu <- falso
                             fimEscolha

                             se (trocaAtq = verdadeiro) entao // Se a troca de ataque for verdadeira...

                               para n de 1 ate 2 faca // Repete duas vezes para passar dados do tipo caractere (Nome do ataque e nome de exibicao).

                                   // Matriz do powerUp recebe como linha o numero do ataque novo escolhido.
                                   // Matriz de ataques do pokemon do Jogador recebe como linha o ataque que foi escolhido para ser substituido.
                                   dicioAtqJogador[atqSubstituido,n] <- dicioAtqUp[atqNovo,n]
                               fimPara

                               para n de 1 ate 6 faca // Repete seis vezes para passar dados do tipo real (numeracao e status).

                                   // Matriz do powerUp recebe como linha o numero do ataque novo escolhido.
                                   // Matriz de ataques do pokemon do Jogador recebe como linha o ataque que foi escolhido para ser substituido.
                                   sttsAtqJogador[atqSubstituido,n] <- statusAtqUp[atqNovo,n]
                               fimPara

                               // Se a troca de ataques for verdadeira, a saida do upgrade recebe verdadeira apos a transferencia de dados.
                               saidaUpgrade <- verdadeiro

                             fimSe
                        fimSe

                  ate (saidaUpgrade =  verdadeiro) // Condicao para encerrar a repeticao da tela de PowerUp

                  powerUpBusca <- falso // Busca de powerUp e rezetada recebendo falso no fim do procedimento.

   fimProcedimento

   procedimento exibPk() // Exibicao do pokemon do Jogador na tela de PowerUp.
            var
            inicio
                  escolha (statusPk[1,1]) // Seleciona a numeracao do Pokemon do Jogador.

                         caso(1)
                         // Caso for Squirtle.
escrevaL("   |                                                                                                               ?  .----------.                |")
escrevaL("   |                                                                                                          ?      /  _      _  \               |")
escrevaL("   |                                                                                                                / (. )   (. )  \              |")
escrevaL("   |                                                                                                             ?  |  ```   ```   |              |")
escrevaL("   |                                                                                                                 \     -(     /               |")
escrevaL("   |                                                                                                        ?     ^___\__     __ /___             |")
escrevaL("   |                                                                                                             \          /     /\/\___         |")
escrevaL("   |                                                                                                              --____   /  _   \/\/   \        |")
escrevaL("   |                                                                                                            ?     |    \_/    /\/\| @         |")
escrevaL("   |                                                                                                                  | -- -+- -- \/\/\\_/        |")
escrevaL("   |                                                                                                                  |> - -+- - </\/\/           |")
escrevaL("   |                                                                                                                   \___/\____/ __/            |")
escrevaL("   |                                                                                                                    /         |               |")
escrevaL("   |                                                                                                                  /___/    \___\              |")

                         caso(2)
                         // Caso for Charmander.
escrevaL("   |                                                                                                                    _____---___               |")
escrevaL("   |                                                                                                              ?    /           \              |")
escrevaL("   |                                                                                                                  /  _\`  ´/_   \             |")
escrevaL("   |                                                                                                                ? |             |             |")
escrevaL("   |                                                                                                            ?     /    \/       |             |")
escrevaL("   |                                                                                                                 (___  ____    /              |")
escrevaL("   |                                                                                                         ?      |\--/ /    \   ----/|         |")
escrevaL("   |                                                                                                                 -__           ___-           |")
escrevaL("   |                                                                                                              ?    / /      \ \    ^$*        |")
escrevaL("   |                                                                                                                   |/        \| ___$^*        |")
escrevaL("   |                                                                                                                  /\|        / \    /@        |")
escrevaL("   |                                                                                                                  | |________  |___/          |")
escrevaL("   |                                                                                                                  \   /     \  |              |")
escrevaL("   |                                                                                                                  _v__       __v_             |")

                         caso(3)
                         // Caso for Bulbasaur.
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                   ?                          |")
escrevaL("   |                                                                                                                        ?                     |")
escrevaL("   |                                                                                                               ?     /\______/\MMMMMM         |")
escrevaL("   |                                                                                                                    /          \/ \  \        |")
escrevaL("   |                                                                                                                   (-\ ´  /-)        |        |")
escrevaL("   |                                                                                                                  /   **        L_/ _/        |")
escrevaL("   |                                                                                                              ?  (   __-__   D     \/         |")
escrevaL("   |                                                                                                                  \               O \         |")
escrevaL("   |                                                                                                                  (           b     )         |")
escrevaL("   |                                                                                                                  \   |---/ * /-\   /         |")
escrevaL("   |                                                                                                                   \* |  /   / | | /          |")
escrevaL("   |                                                                                                                    _W_  _w_/ \w /w           |")
                  fimEscolha
   fimProcedimento

   procedimento menuTrocaAtq(trocaMenu_: logico) // Troca o menu na tela de PowerUp a depender do parâmetro que e passado.
               var
               inicio

                     se (trocaMenu_ = falso) entao // Se a troca de menu for falsa...
escrevaL("   |          O ", dicioPk[1,1], "PODE APRENDER OS DOIS ATAQUES ABAIXO, SELECIONE QUAL DESEJA QUE ELE APRENDA:                                           |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |           . ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___                                                                  |")
escrevaL("   |           |                         |         |          |           |     |                                                                 |")
escrevaL("   |           |    OPCOES DE ATAQUES    | TIPO    | CATEGORIA| FORC| PREC| USO |                                                                 |")
escrevaL("   |           |-------------------------+---------+----------+-----+-----+-----|                                                                 |")
// Exibe a descricao dos ataques [(1,2)] definidos randomicamente e a sua quantidade de usos ([1,6])
escrevaL("   |           |  [ 1 ] ->  ", dicioAtqUp[1,2], statusAtqUp[1,6], " |                                                                 |")
escrevaL("   |           |  [ 2 ] ->  ", dicioAtqUp[2,2], statusAtqUp[2,6], " |                                                                 |")
escrevaL("   |           |----------------------------------------------------------------|                                                                 |")
escrevaL("   |           |  [ 0 ] ->  PARA MANTER TODOS SEUS ATAQUES                      |                                                                 |")
escrevaL("   |           |___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___.|                                                                 |")
                     fimSe

                     se (trocaMenu_ = verdadeiro) entao // Se a troca de menu for verdadeira...
escrevaL("   |          QUAL ATAQUE DESEJA SUBSTITUIR PELO NOVO?                                                                                            |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |           . ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___                                                                  |")
escrevaL("   |           |    SEUS     ATAQUES     | TIPO    | CATEGORIA| FORC| PREC| USO |                                                                 |")
escrevaL("   |           |-------------------------+---------+----------+-----+-----+-----|                                                                 |")
escrevaL("   |           |  [ 0 ] ->  PARA VOLTAR  |         |          |     |     |     |                                                                 |")
// Exibe a descricao dos ataques [(1,2)] definidos randomicamente e a sua quantidade de usos ([1,6])
escrevaL("   |           |  [ 1 ] ->  ", dicioAtqJogador[1,2], sttsAtqJogador[1,6], " |                                                                 |")
escrevaL("   |           |  [ 2 ] ->  ", dicioAtqJogador[2,2], sttsAtqJogador[2,6], " |                                                                 |")
escrevaL("   |           |  [ 3 ] ->  ", dicioAtqJogador[3,2], sttsAtqJogador[3,6], " |                                                                 |")
escrevaL("   |           |  [ 4 ] ->  ", dicioAtqJogador[4,2], sttsAtqJogador[4,6], " |                                                                 |")
escrevaL("   |           |___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___.|                                                                 |")
                     fimSe
   fimProcedimento

   procedimento zerouTela() // Tela de exibicao caso o Jogador vencou os dois rounds.
               var
               inicio
                     limpaTela // Limpa a tela anterior para exibir a tela seguinte.
                     timer(100) // Timmer para desacelerar a velociade de impressao.
escrevaL("    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ .")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                    *                                  *                                                      |")
escrevaL("   |                                                                            *                                                                 |")
escrevaL("   |                                         *                                               *                                                    |")
escrevaL("   |                               *                                  *                                 *                                         |")
escrevaL("   |                                                    *                                                                                         |")
escrevaL("   |                         *                ____   ____  ____    ____  ____  *  ___  ____   _____     __      *             *                   |")
escrevaL("   |                                         |    \ /    ||    \  /    ||    \   /  _]|    \ / ___/    |  |                                       |")
escrevaL("   |                                    *    |  o  )  o  ||  D  )|  o  ||  o  ) /  [_ |  _  (   \_     |  |                                       |")
escrevaL("   |                           *             |   _/|     ||    / |     ||     ||    _]|  |  |\__  |    |__|               *                       |")
escrevaL("   |                                         |  |  |  _  ||    \ |  _  ||  O  ||   [_ |  |  |/  \ |     __                                        |")
escrevaL("   |                  *                      |  |  |  |  ||  .  \|  |  ||     ||     ||  |  |\    |    |  |    *     *                            |")
escrevaL("   |                                  *      |__|  |__|__||__|\_||__|__||_____||_____||__|__| \___|    |__|                                       |")
escrevaL("   |                         *                                                *                                             *                     |")
escrevaL("   |               *                                                                                              *                               |")
escrevaL("   |                                                       *                                   *                                                  |")
escrevaL("   |              __ __   ___     __    ___      _____    ___  ____   ___   __ __       ___        ____   ___    ____   ___    *  __              |")
escrevaL("   |             |  |  | /   \   /  ]  /  _]    |     |  /  _]|    \ /   \ |  |  |     /   \      |    | /   \  /    | /   \     |  |             |")
escrevaL("   |             |  |  ||     | /  /  /  [_  *  |__/  | /  [_ |  D  )     ||  |  |    |     |     |__  ||     ||   __||     |    |  |             |")
escrevaL("   |             |  |  ||  O  |/  /  |    _]    |   __||    _]|    /|  O  ||  |  |    |  O  |     __|  ||  O  ||  |  ||  O  |  * |__|             |")
escrevaL("   |             |  :  ||     /   \_ |   [_     |  /  ||   [_ |    \|     ||  :  |    |     |    /  |  ||     ||  |_ ||     |     __              |")
escrevaL("   |              \   / |     \     ||     |    |     ||     ||  .  \     ||     |    |     |    \  `  ||     ||     ||     |    |  |             |")
escrevaL("   |               \_/   \___/ \____||_____|    |_____||_____||__|\_|\___/  \__,_|     \___/      \____j \___/ |___,_| \___/     |__|             |")
escrevaL("   |                                                                                                                  *                           |")
escrevaL("   |                               *                                                  *                                       *                   |")
escrevaL("   |                   *                                                     *                           *                                        |")
escrevaL("   |                                       *                      *                                 *                                             |")
escrevaL("   |                                                    *                                                              *                          |")
escrevaL("   |                          *                                                          *                     *                                  |")
escrevaL("   |                                    *          *                       *                                                                      |")
escrevaL("   |                                                         *                                 *                                                  |")
escrevaL("   |                                                                                                          *                                   |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                           *                                                                                                  |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              |")
escrevaL("   |                                                                                                                                              v")
escreva("   |_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _> TECLE ENTER < ")

                     leia(enter) // Entrada qualquer para congelar a tela e prosseguir o andamento do codigo atraves de uma acao do Jogador.
                     timer(0) // Reseta o timer.
   fimProcedimento

INICIO
      abertura() // Animacao com creditos.

      repita
            menuPrincipal()
      ate (saida = verdadeiro) // Condicao para encerrar o programa.
FIMALGORITMO