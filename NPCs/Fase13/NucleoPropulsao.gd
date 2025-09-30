extends Node

var dialogue_path = "res://Dialogues/Fase13/complex_npc_dialogue_fase13.json"
var current_node = "intro"
var dialogue_data = {}

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
        return
    var node = dialogue_data[node_name]
    print("NPC:", node["text"])
    if node.has("options"):
        for i in range(node["options"].size()):
            print(str(i+1) + ". " + node["options"][i]["response"])
    elif node.has("action"):
        execute_action(node["action"])

func choose_option(index):
    var node = dialogue_data[current_node]
    if node.has("options") and index < node["options"].size():
        current_node = node["options"][index]["next"]
        show_dialogue(current_node)

func execute_action(action_name):
    match action_name:
        "unlock_fusion_panel":
            print("Acesso ao painel de fusão liberado.")
        "shutdown_sequence":
            print("Sequência de desligamento iniciada.")
        "trigger_evacuation":
            print("Evacuação em andamento.")
        "isolate_core":
            print("Núcleo isolado da rede principal.")
        "update_mission_investigate_logs":
            print("Missão atualizada: investigar registros apagados.")
