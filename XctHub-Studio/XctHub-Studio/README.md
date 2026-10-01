# Xct Hub — Flee The Facility (Studio Edition)

Interface-base para **testes e desenvolvimento em uma experiência Roblox própria**.
Este repositório é uma edição segura para Roblox Studio; não é um executor nem um exploit.

## Conteúdo

- `src/Client/Main.client.lua` — interface local de diagnóstico do próprio personagem.
- `src/Shared/Config.lua` — nome, cores e configurações da interface.

## Instalação no Roblox Studio

1. Abra uma experiência que você possui ou tem autorização para editar.
2. No Explorer, crie uma pasta `XctHub` dentro de `ReplicatedStorage`.
3. Coloque `Config.lua` nessa pasta como um `ModuleScript` chamado `Config`.
4. Coloque `Main.client.lua` como um `LocalScript` em `StarterPlayer > StarterPlayerScripts`.
5. Execute a experiência usando **Play** no Studio.

## Recursos incluídos

- Janela local que pode ser aberta e fechada.
- Exibição do nome do jogador e estado básico do próprio personagem.
- Atualização do estado de vida quando o personagem reaparece.

## Limites desta edição

Esta edição não inclui auto-hack, bypass de anticheat, noclip, teleportes para obter vantagem,
ESP através de paredes, alteração de resultados de minigames, manipulação de remotes ou
ferramentas de executor. Para testar mecânicas do seu próprio jogo, implemente comandos
autorizados no servidor e restrinja-os a usuários de teste.

## Personalização

Edite `src/Shared/Config.lua` para alterar o nome e as cores. O código usa APIs suportadas
pelo Roblox Studio e não carrega código remoto com `loadstring` ou `HttpGet`.

## Créditos

- Projeto/interface: Xct
- Conceito original informado pelo autor: inspirado em uma base atribuída a ReefHub.

Use somente em experiências próprias ou com autorização explícita dos responsáveis.
