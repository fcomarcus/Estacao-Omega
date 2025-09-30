extends Node

var dialogue_path = "res://Dialogues/Fase10/complex_npc_dialogue_fase10.json"
var dialogue_data = {}
var current_node = "intro"

func _ready():
    load_dialogue()

func load_dialogue():
    var file = FileAccess.open(dialogue_path, FileAccess.READ)
    if file:
        var content = file.get_as_text()
        dialogue_data = JSON.parse_string(content)
        show_dialogue(current_node)

func show_dialogue(node_name):
    if not dialogue_data.has(node_name):
        print("Diálogo não encontrado:", node_name)
        return
    var node = dialogue_data[node_name]
    print("NPC:", node.get("text", ""))
    if node.has("options"):
        for i in range(node["options"].size()):
            print(str(i + 1) + ". " + node["options"][i]["response"])
    elif node.has("action"):
        execute_action(node["action"])

func choose_option(index):
    var node = dialogue_data[current_node]
    if node.has("options") and index < node["options"].size():
        var next_node = node["options"][index]["next"]
        current_node = next_node
        show_dialogue(current_node)

func execute_action(action_name):
    match action_name:
        "grant_access":
            print("Acesso concedido aos registros secretos.")
        "deny_access":
            print("Acesso negado. NPC encerra a conversa.")
        "unlock_medical_logs":
            print("Registros médicos desbloqueados.")
        "reveal_secret":
            print("Segredo revelado. Missão atualizada.")
        "npc_ignores_player":
            print("NPC ignora o jogador e encerra a interação.")
        _:
            print("Ação desconhecida:", action_name)
