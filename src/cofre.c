#include <stdio.h>
#include <string.h>

/* Alvo didatico: propositalmente simples, sem protecao ou ofuscacao. */
int validar_senha(const char *senha) {
    return strcmp(senha, "chave2026") == 0;
}

int main(void) {
    char senha[128];
    int resultado = 1;
    puts("================================");
    puts(" COFRE DIGITAL - NIVEL 1");
    puts(" Laboratorio de engenharia reversa");
    puts("================================");
    printf("Digite a senha: ");
    fflush(stdout);
    if (fgets(senha, sizeof senha, stdin) == NULL) {
        puts("Entrada encerrada.");
        return 2;
    }
    senha[strcspn(senha, "\r\n")] = '\0';
    if (validar_senha(senha)) {
        puts("ACESSO LIBERADO! Voce abriu o cofre.");
        resultado = 0;
    } else {
        puts("ACESSO NEGADO! Senha incorreta.");
    }
    puts("Pressione ENTER para sair.");
    getchar();
    return resultado;
}
