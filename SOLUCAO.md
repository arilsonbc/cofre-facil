# Solução — leia depois de tentar

A senha é `chave2026` (letras minúsculas).

`fgets` lê a entrada com limite de tamanho. `strcspn` permite remover a quebra de linha. A função `validar_senha` compara a entrada com a senha fixa usando `strcmp`.

Quando `strcmp` retorna zero, os textos são iguais e `validar_senha` retorna 1. O `if` de `main` escolhe a mensagem de sucesso quando esse retorno é diferente de zero. Uma senha incorreta faz `validar_senha` retornar 0.

No assembly, identifique a chamada da validação e o teste de seu retorno. Confirme com duas execuções, uma correta e outra incorreta. Para o desafio de patch, altere em uma cópia a decisão que escolhe entre os dois caminhos. Um breakpoint ou uma mudança de registrador afeta apenas a execução atual; para concluir o desafio, salve os bytes modificados em outro EXE e execute esse arquivo fora do depurador.

Não há um endereço ou byte universal descrito aqui: o layout e os saltos dependem do compilador e da compilação. Use o disassembly do seu próprio binário.
