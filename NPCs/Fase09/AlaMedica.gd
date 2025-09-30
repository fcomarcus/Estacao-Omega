extends Node

var dialogue_path = "res://Dialogues/Fase09/complex_npc_dialogue_fase09.json"
var dialogue_data = {}
var current_node = "intro"

func _ready():
    load_dialogue()
    start_dialogue()

func load_dialogue():
    var file = FileAccess.open(dialogue_path, FileAccess.READ)
    if file:
        var content = file.get_as_text()
        dialogue_data = JSON.parse_string(content)
        file.close()

func start_dialogue():
    show_node(current_node)

func show_node(node_name):
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
        show_node(current_node)

func perform_action(action):
    print("Executando ação:", action)
