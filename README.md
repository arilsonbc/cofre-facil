# Cofre Fácil — nível 1

Um pequeno **crackme educativo**, escrito em C, para começar a estudar Ghidra e x64dbg no Windows. Você tem autorização para analisar, depurar e modificar este programa, inclusive publicar suas soluções.

## Comece aqui

1. Baixe o ZIP da seção **Releases** e extraia em uma pasta.
2. Execute `bin/cofre-nivel1.exe` e teste uma senha qualquer.
3. Abra o mesmo executável no Ghidra para investigar como ele decide liberar o acesso.
4. Abra no **x64dbg** para acompanhar essa decisão durante a execução.

Executável nativo Windows x64, de console, sem instalação. Use x64dbg, pois o programa tem 64 bits. O texto dentro do programa evita acentos para funcionar em diferentes configurações de terminal.

**Para evitar spoilers:** tente primeiro usando somente o executável. `src/` e `SOLUCAO.md` revelam a resposta.

## Seus desafios

- **1 — Descobrir:** encontre a senha usando o Ghidra e consiga a mensagem `ACESSO LIBERADO!` no programa original.
- **2 — Entender:** localize no assembly a comparação e o salto que levam ao sucesso ou à falha. Anote o endereço encontrado no seu arquivo e explique a decisão com suas palavras.
- **3 — Depurar:** coloque um breakpoint (uma pausa de execução) perto dessa decisão no x64dbg. Execute com uma senha errada e observe os valores usados na comparação.
- **4 — Modificar:** faça uma cópia do executável e altere a decisão para aceitar qualquer senha. Salve a alteração no arquivo e teste novamente fora do depurador.

Você concluiu o nível ao abrir o original com a senha descoberta e demonstrar que sua cópia modificada aceita duas senhas erradas diferentes. Guarde o original para comparação.

## Dicas graduais

<details><summary>Dica 1: por onde começar no Ghidra</summary>

Importe o EXE, aceite a análise automática e abra **Search → for Strings**. Procure as mensagens de acesso. As referências cruzadas (XREFs) mostram quais trechos de código usam essas mensagens.
</details>

<details><summary>Dica 2: o que procurar</summary>

Há uma comparação direta entre o texto digitado e uma senha fixa. Procure uma chamada a `strcmp`. Essa função retorna zero quando os textos são iguais. Não confunda a comparação do texto com o teste do resultado retornado.
</details>

<details><summary>Dica 3: no depurador</summary>

O carregador executa código antes da lógica do desafio. Use as referências às mensagens para achar o trecho relevante. Endereços de memória podem mudar entre execuções; use também o módulo e o deslocamento relativo. O pseudocódigo do Ghidra é uma interpretação: confirme a decisão no assembly e em execução.
</details>

## Compilar

Com Zig 0.13.0 disponível, no PowerShell dentro da pasta do projeto:

```powershell
.\build.ps1 -Zig 'C:\caminho\para\zig.exe'
```

O script usa o compilador C do Zig, com otimizações e inlining desativados, e remove símbolos de depuração. Isso mantém a lógica simples sem entregar os nomes das funções no executável. O EXE não precisa do Zig instalado para executar.

## Escopo

Este é um cofre fictício: não guarda arquivos, não acessa a rede e não altera configurações do sistema. A senha embutida é intencional para o exercício. Não use esta implementação para proteger dados reais.

Licença MIT. O projeto não depende de Ghidra ou x64dbg para executar.
