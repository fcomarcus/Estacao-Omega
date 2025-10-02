
extends CharacterBody2D

var dialogue_tree = {
    "start": {
        "text": "Olá, viajante. Bem-vindo à Estação-Ômega. O que deseja?",
        "choices": {
            "1": {"text": "Estou procurando informações.", "next": "info"},
            "2": {"text": "Só estou explorando.", "next": "explore"},
            "3": {"text": "Quem é você?", "next": "identity"}
        }
    },
    "info": {
        "text": "Informações são valiosas por aqui. Você tem algo para trocar?",
        "choices": {
            "1": {"text": "Tenho dados de navegação.", "next": "trade"},
            "2": {"text": "Não tenho nada agora.", "next": "no_trade"}
        }
    },
    "explore": {
        "text": "Explore à vontade, mas cuidado com os setores instáveis.",
        "choices": {}
    },
    "identity": {
        "text": "Sou o guardião da fase 01. Monitoro os fluxos e protejo os segredos.",
        "choices": {
            "1": {"text": "Que segredos?", "next": "secrets"},
            "2": {"text": "Interessante. Até mais.", "next": "end"}
        }
    },
    "secrets": {
        "text": "Segredos que podem mudar o rumo da estação. Mas não são para todos.",
        "choices": {}
    },
    "trade": {
        "text": "Dados aceitos. Aqui está o que você precisa saber...",
        "choices": {}
    },
    "no_trade": {
        "text": "Volte quando tiver algo de valor.",
        "choices": {}
    },
    "end": {
        "text": "Boa jornada, viajante.",
        "choices": {}
    }
}

var current_node = "start"

func _ready():
    show_dialogue(current_node)

func show_dialogue(node):
    var dialogue = dialogue_tree[node]
    print(dialogue["text"])
    for key in dialogue["choices"].keys():
        print(str(key) + ": " + dialogue["choices"][key]["text"])

func choose(option):
    var next_node = dialogue_tree[current_node]["choices"][option]["next"]
    current_node = next_node
    show_dialogue(current_node)
