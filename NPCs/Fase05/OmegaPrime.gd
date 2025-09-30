extends Node

var dialogue_data
var current_node = "intro"

func _ready():
    load_dialogue("res://Dialogues/Fase05/complex_npc_dialogue_fase05.json")
    start_dialogue()

func load_dialogue(path):
    var file = FileAccess.open(path, FileAccess.READ)
    if file:
        var content = file.get_as_text()
        dialogue_data = JSON.parse_string(content)
        file.close()

func start_dialogue():
    show_node(current_node)

func show_node(node_name):
    var node = dialogue_data[node_name]
    print(node["text"])
    if "options" in node:
        for i in range(node["options"].size()):
            print(str(i + 1) + ". " + node["options"][i]["response"])
    elif "action" in node:
        perform_action(node["action"])

func choose_option(index):
    var node = dialogue_data[current_node]
    if "options" in node and index < node["options"].size():
        current_node = node["options"][index]["next"]
        show_node(current_node)

func perform_action(action):
    match action:
        "lock_sector":
            print("Setor bloqueado pela IA.")
        "grant_partial_access":
            print("Acesso parcial concedido.")
        "trigger_alarm":
            print("Alarme ativado. Segurança alertada.")
