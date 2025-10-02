
extends CharacterBody2D

var mood = "neutral"
var dialogue_tree = {
    "start": {
        "text": "Você chegou à fase 02. Está preparado para desafios maiores?",
        "choices": {
            "1": {"text": "Sim, estou pronto.", "next": "ready"},
            "2": {"text": "Ainda não tenho certeza.", "next": "unsure"}
        }
    },
    "ready": {
        "text": "Ótimo. A primeira tarefa é recuperar um núcleo de energia perdido.",
        "choices": {
            "1": {"text": "Onde posso encontrá-lo?", "next": "location"},
            "2": {"text": "Isso parece perigoso.", "next": "danger"}
        }
    },
    "unsure": {
        "text": "A dúvida é comum. Observe e aprenda antes de agir.",
        "choices": {}
    },
    "location": {
        "text": "O núcleo está em um setor instável. Use o scanner para localizá-lo.",
        "choices": {}
    },
    "danger": {
        "text": "Perigo é parte da jornada. Mas há recompensas para os corajosos.",
        "choices": {}
    }
}

var current_node = "start"

func _ready():
    show_dialogue(current_node)
    random_event()

func show_dialogue(node):
    var dialogue = dialogue_tree[node]
    print(dialogue["text"])
    for key in dialogue["choices"].keys():
        print(str(key) + ": " + dialogue["choices"][key]["text"])

func choose(option):
    var next_node = dialogue_tree[current_node]["choices"][option]["next"]
    current_node = next_node
    show_dialogue(current_node)

func random_event():
    var event_roll = randi() % 3
    match event_roll:
        0:
            print("Um tremor sacode a estação. Algo mudou nos setores.")
        1:
            print("Você ouve um sinal estranho vindo do núcleo central.")
        2:
            print("Um drone passa voando e deixa um pacote misterioso.")
