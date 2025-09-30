# CHANGELOG.md

## 📦 Histórico de Versões – Estação-Ômega

Este changelog documenta as atualizações técnicas e narrativas do projeto **Estação-Ômega**, incluindo estrutura de diretórios, scripts, diálogos e eventos por fase.

---

### 🔖 Versão 1.0 – Estrutura Inicial

- Criação do repositório com estrutura base:
  - `Dialogues/`, `NPCs/`, `scripts/`, `scenes/`, `assets/icons/`, `docs/`, `data/`
- Inclusão de `DOCUMENTACAO_TECNICA.md` com descrição geral do projeto.
- Implementação do minimapa (`minimapa_estacao_omega.gd`, `.tscn`).

---

### 🔖 Versão 1.1 – Fases 01 a 05

- **Fase 01 – Hangar de Entrada**
  - Diálogo com o técnico de recepção.
  - Script de ativação de painel de acesso.
- **Fase 02 – Laboratório de Biossegurança**
  - Eventos de contaminação e isolamento.
  - Script de controle de portas e sensores.
- **Fase 03 – Núcleo de Energia**
  - Diálogo com engenheiro-chefe.
  - Script de reinicialização do núcleo.
- **Fase 04 – Ala Médica**
  - Sistema de cura e inventário de saúde.
  - Diálogo com IA médica.
- **Fase 05 – Sala de Controle**
  - Ativação de câmeras e sensores.
  - Diálogo com supervisor de segurança.

---

### 🔖 Versão 1.2 – Fases 06 a 10

- **Fase 06 – Armazém Criogênico**
  - Eventos de falha térmica.
  - Script de recuperação de cápsulas.
- **Fase 07 – Estufa Biológica**
  - Diálogo com botânico.
  - Eventos de mutação vegetal.
- **Fase 08 – Laboratório Quântico**
  - Script de manipulação de partículas.
  - Diálogo com pesquisador quântico.
- **Fase 09 – Câmara de Gravidade**
  - Script de inversão gravitacional.
  - Diálogo com técnico de física.
- **Fase 10 – Núcleo de Comunicação**
  - Diálogo com IA de transmissão.
  - Script de envio de sinal para Terra.

---

### 🔖 Versão 1.3 – Fases 11 a 13

- **Fase 11 – Setor de Inteligência**
  - Diálogo com agente neural.
  - Script de decodificação de dados.
- **Fase 12 – Sala de Simulação**
  - Eventos de colapso virtual.
  - Diálogo com avatar simulado.
- **Fase 13 – Núcleo de Propulsão**
  - Script `Propulsao.gd` com lógica de ignição.
  - Diálogo com engenheiro de propulsão.
  - Estrutura JSON com decisões críticas.

---

### 🔖 Versão 1.4 – Fase 14 – Câmara de Decisão

- Diálogo ramificado com o **Comandante da Câmara**:
  - Decisões: evacuação, reinício, isolamento.
- Script `CamaraDecisao.gd`:
  - Atualização de missão.
  - Ativação de eventos críticos.
- Arquivo `complex_npc_dialogue_fase14.json` com múltiplos caminhos narrativos.

---

### 🔖 Versão 1.5 – Fase 15 – Epílogo

- Diálogo final com a **Inteligência Central Ômega**:
  - Decisões finais: evacuar, transmitir dados, reiniciar estação.
- Script `Epilogo.gd`:
  - Encerramento do jogo com base na escolha do jogador.
- Arquivo `complex_npc_dialogue_fase15.json` com consequências narrativas.

---

### 📁 Atualizações Complementares

- Inclusão de `mapa.jpeg` e ícones em `assets/icons/`.
- Estrutura de documentação técnica mantida em `docs/`.
- Sugestão de inclusão de `README.md`, `LICENSE` e `CHANGELOG.md`.

---

### 📌 Status Atual

Projeto atualizado até a **Fase 15 – Epílogo**, com estrutura modular, scripts funcionais e narrativa ramificada.
