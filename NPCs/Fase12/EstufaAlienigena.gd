extends Node

var dialogue_path = "res://Dialogues/Fase12/complex_npc_dialogue_fase12.json"
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
    print("NPC:", node.get("text", ""))
    if node.has("options"):
        for i in range(node["options"].size()):
            print(str(i+1) + ". " + node["options"][i]["response"])
    elif node.has("action"):
        perform_action(node["action"])

func choose_option(index):
    var node = dialogue_data[current_node]
    if node.has("options") and index < node["options"].size():
        current_node = node["options"][index]["next"]
        show_node(current_node)

func perform_action(action_name):
    match action_name:
        "lock_exit":
            print("[A porta foi trancada pela criatura.]")
        "update_mission_log":
            print("[Missão atualizada com origem da criatura.]")
        "unlock_hidden_area":
            print("[Área oculta desbloqueada.]")
        "npc_disappears":
            print("[A criatura desaparece na vegetação.]")
        "trigger_alien_warning":
            print("[Você sente uma ameaça iminente.]")
        "update_player_state":
            print("[Estado do jogador alterado pela simbiose.]")
