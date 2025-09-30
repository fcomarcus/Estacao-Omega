extends Node

func _ready():
    iniciar_dialogo()

func iniciar_dialogo():
    var dialogo = carregar_dialogo("res://Dialogues/Fase14/complex_npc_dialogue_fase14.json")
    mostrar_dialogo(dialogo)

func carregar_dialogo(caminho):
    var file = File.new()
    if file.file_exists(caminho):
        file.open(caminho, File.READ)
        var conteudo = file.get_as_text()
        file.close()
        return parse_json(conteudo)
    return {}

func mostrar_dialogo(dialogo):
    # Lógica para exibir diálogo e opções ao jogador
    pass

func ativar_evacuacao():
    # Executa ações de evacuação
    print("Protocolo de evacuação ativado.")
    atualizar_missao("Evacuar a estação")

func reiniciar_sistema():
    # Executa ações de reinício do sistema
    print("Sistema central sendo reiniciado.")
    atualizar_missao("Estabilizar o sistema")

func atualizar_missao(descricao):
    # Atualiza o objetivo da missão
    print("Missão atualizada: " + descricao)