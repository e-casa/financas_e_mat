# =============================================================================
# install.R
# Projeto: financas_e_mat
# Descrição: Instala todos os pacotes necessários para as atividades
# Execute uma única vez antes de rodar qualquer script das atividades
# =============================================================================

pacotes <- c(
  "quantmod",   # download e análise de dados financeiros
  "tidyverse",  # manipulação e visualização de dados
  "xts",        # séries temporais
  "TTR",        # indicadores técnicos (usado pelo quantmod)
  "knitr",      # geração de relatórios
  "rmarkdown"   # caderno do aluno em R Markdown
)

# Instala apenas os pacotes que ainda não estão instalados
pacotes_faltando <- pacotes[!pacotes %in% installed.packages()[, "Package"]]

if (length(pacotes_faltando) > 0) {
  message("Instalando pacotes: ", paste(pacotes_faltando, collapse = ", "))
  install.packages(pacotes_faltando)
} else {
  message("Todos os pacotes já estão instalados.")
}

# Verificação final
for (p in pacotes) {
  if (requireNamespace(p, quietly = TRUE)) {
    message("OK: ", p, " (versão ", packageVersion(p), ")")
  } else {
    warning("PROBLEMA ao instalar: ", p)
  }
}
