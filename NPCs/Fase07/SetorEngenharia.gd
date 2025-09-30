
extends Node

var dialogue_path = "res://Dialogues/Fase07/complex_npc_dialogue_fase07.json"
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
    print("NPC:", node["text"])
    if node.has("options"):
        for i in range(node["options"].size()):
            print(str(i + 1) + ". " + node["options"][i]["response"])
    elif node.has("action"):
        execute_action(node["action"])

func choose_option(index):
    var node = dialogue_data[current_node]
    if node.has("options") and index < node["options"].size():
        current_node = node["options"][index]["next"]
        show_dialogue(current_node)

func execute_action(action_name):
    match action_name:
        "npc_alerts_security":
            print("⚠️ Segurança alertada.")
        "unlock_diagnostic_panel":
            print("🔓 Painel de diagnóstico liberado.")
        "npc_triggers_lockdown":
            print("🚨 Protocolo de segurança ativado.")
        "share_technical_logs":
            print("📁 Registros técnicos compartilhados.")
        "npc_refuses_help":
            print("❌ NPC se recusa a cooperar.")
        _:
            print("Ação desconhecida:", action_name)
