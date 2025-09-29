# Documentação Técnica – Projeto Estação Ômega

## Estrutura Geral do Projeto

O projeto é um jogo de aventura ambientado em uma estação espacial abandonada. Cada fase representa um setor da estação com desafios, interações e narrativa própria.

### Estrutura das Fases

1. **Fase 01 – Hangar de Aterrissagem**: ponto inicial do jogo, introdução à estação.
2. **Fase 02 – Corredor Principal**: conexão entre setores, eventos de movimentação.
3. **Fase 03 – Laboratório**: puzzles científicos, coleta de itens.
4. **Fase 04 – Dormitórios**: exploração de quartos, recuperação de saúde.
5. **Fase 05 – Sala de Controle**: ativação de sistemas, acesso a câmeras.
6. **Fase 06 – Sala Segura**: ponto de salvamento e proteção.
7. **Fase 07 – Setor de Engenharia**: reparos, manipulação de máquinas.
8. **Fase 08 – Jardim Hidropônico**: coleta de recursos biológicos.
9. **Fase 09 – Ala Médica**: cura, obtenção de itens médicos.
10. **Fase 10 – Arquivo Central**: acesso a registros e informações da estação.
11. **Fase 11 – Sala de Simulação**: treinamento e desafios virtuais.
12. **Fase 12 – Estufa Alienígena**: ambiente hostil, criaturas exóticas.
13. **Fase 13 – Núcleo de Propulsão**: área energética, risco elevado.
14. **Fase 14 – Câmara de Decisão**: escolhas que afetam o final.
15. **Fase 15 – Epílogo**: encerramento da jornada e conclusão narrativa.

---

## Funcionalidades Implementadas

- Navegação entre fases
- Sistema de inventário básico
- Interface de HUD com barra de saúde
- Ícones gráficos para cada fase
- Estrutura de diretórios para Godot 4

## Funcionalidades Pendentes

- Sistema de eventos aleatórios
- Diálogos ramificados com múltiplas escolhas
- Sistema de salvamento e carregamento
- Inteligência artificial dos NPCs
- Sistema de combate e defesa
- Música e efeitos sonoros
- Finalizações múltiplas

---

## Comandos do Jogo

- `W/A/S/D` ou `Setas`: movimentação
- `E`: interagir com objetos
- `I`: abrir inventário
- `ESC`: abrir menu de pausa
- `F`: ativar lanterna (se disponível)

---

## Sistema de Saúde

- Barra de saúde visível no HUD
- Recuperação por itens médicos ou descanso
- Dano por inimigos, eventos ou ambiente hostil
- Morte leva ao último ponto de salvamento

---

## Eventos Aleatórios

- Portas que se fecham inesperadamente
- Falhas de energia
- Aparições de criaturas
- Mensagens misteriosas nos sistemas

---

## Inventário

- Itens coletáveis por fase
- Limite de capacidade
- Tipos de itens:
  - Chaves e cartões de acesso
  - Ferramentas
  - Itens médicos
  - Documentos
  - Recursos biológicos

---

## Diálogos Ramificados

- Sistema de múltipla escolha
- Impacto nas decisões e finais
- Personagens com histórico e motivações
- Registro de conversas no menu de dados

---

## Observações

Este documento será atualizado conforme o desenvolvimento avança. Para sugestões ou dúvidas, consulte o repositório oficial: [Estacao-Omega](https://github.com/fcomarcus/Estacao-Omega)
