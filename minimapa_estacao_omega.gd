extends Control

var phase_buttons = {}
var connections = []

func _ready():
    load_map()

func load_map():
    connections = [
    ]

func on_phase_selected(phase_id):
    print("Fase selecionada: %s" % phase_id)
    for conn in connections:
        if conn["from"] == phase_id:
            print("Você pode ir %s para %s" % [conn["direction"], conn["to"]])