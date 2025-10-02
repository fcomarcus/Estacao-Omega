extends CharacterBody2D

enum State { IDLE, INTERACTING }

var state = State.IDLE
var dialogue_data = {}
var current_node = "intro"

func _ready():
    load_dialogue("res://Dialogues/Fase02/complex_npc_dialogue_fase02.json")
    random_event()

func load_dialogue(path):
    var file = FileAccess.open(path, FileAccess.READ)
    if file:
        var content = file.get_as_text()
        dialogue_data = JSON.parse_string(content)
        if typeof(dialogue_data) == TYPE_DICTIONARY:
            state = State.INTERACTING
            show_dialogue(current_node)

func show_dialogue(node_name):
    if not dialogue_data.has(node_name):
        return
    var node = dialogue_data[node_name]
    print("NPC:", node["text"])
    if node.has("options"):
        for i in range(node["options"].size()):
            print(str(i+1) + ". " + node["options"][i]["response"])
    elif node.has("action"):
        perform_action(node["action"])

func choose_option(index):
    var node = dialogue_data[current_node]
    if node.has("options") and index < node["options"].size():
        var next_node = node["options"][index]["next"]
        current_node = next_node
        show_dialogue(current_node)

func perform_action(action_name):
    match action_name:
        "liberar_acesso":
            print("Acesso ao setor liberado.")
        "ativar_alerta":
            print("Alerta ativado! Equipe de segurança notificada.")
        "iniciar_reparo":
            print("Reparo iniciado com auxílio do Robô T-9.")
        "buscar_alternativa":
            print("Buscando solução alternativa para o painel.")

func random_event():
    var event_roll = randi() % 3
    match event_roll:
        0:
            print("Um tremor sacode a estação. Algo mudou nos setores.")
        1:
            print("Você ouve um sinal estranho vindo do núcleo central.")
        2:
            print("Um drone passa voando e deixa um pacote misterioso.")
