extends CharacterBody2D

var dialogue_path = "res://Dialogues/Fase06/complex_npc_dialogue_fase06.json"
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
            perform_action(node["action"])

func perform_action(action_name):
    print("Executando ação:", action_name)
