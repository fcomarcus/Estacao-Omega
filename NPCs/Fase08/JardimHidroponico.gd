extends Node

var dialogue_path = "res://Dialogues/Fase08/complex_npc_dialogue_fase08.json"
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
    if dialogue_data.has(node_name):
        var node = dialogue_data[node_name]
        print("NPC:", node["text"])
        if node.has("options"):
            for i in range(len(node["options"])):
                print(str(i + 1) + ". " + node["options"][i]["response"])
        elif node.has("action"):
            execute_action(node["action"])

func choose_option(index):
    var node = dialogue_data[current_node]
    if node.has("options") and index < len(node["options"]):
        current_node = node["options"][index]["next"]
        show_dialogue(current_node)

func execute_action(action_name):
    match action_name:
        "log_skepticism":
            print("Ação: Registrar ceticismo do jogador.")
        "update_mission_samples":
            print("Ação: Atualizar missão para coleta de amostras.")
        "trigger_alien_signal":
            print("Ação: Sinal alienígena detectado.")
        "alert_security":
            print("Ação: Alerta de segurança ativado.")
