
extends CharacterBody2D

enum State { IDLE, INTERACTING }

var state = State.IDLE
var dialogue_data = {}
var current_node = "start"

func _ready():
    load_dialogue("res://Dialogues/Fase01/complex_npc_dialogue_fase01.json")

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
    if node.has("choices"):
        for key in node["choices"].keys():
            print(str(key) + ": " + node["choices"][key]["text"])

func choose(option):
    var node = dialogue_data[current_node]
    if node.has("choices") and node["choices"].has(option):
        var next_node = node["choices"][option]["next"]
        current_node = next_node
        show_dialogue(current_node)
