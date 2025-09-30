extends Node2D

var fase_nome = "Fase 06 – Sala Segura"
var eventos_aleatorios = []
var dialogos = []

func _ready():
    iniciar_ambiente()
    gerar_eventos()
    iniciar_dialogos()

func iniciar_ambiente():
    print("Entrando em %s..." % fase_nome)

func gerar_eventos():
    eventos_aleatorios = [
        "Falha de energia repentina",
        "Porta se fecha sozinha",
        "Mensagem misteriosa no terminal",
        "Aparição de sombra ou criatura",
        "Vozes distantes no sistema de comunicação"
    ]
    var evento = eventos_aleatorios[randi() % eventos_aleatorios.size()]
    print("Evento aleatório: %s" % evento)

func iniciar_dialogos():
    dialogos = [
        {
            "fala": "IA-ÔMEGA: Você acessou dados restritos. Isso compromete a missão. Deseja continuar?",
            "opcoes": [
                "Sim",
                "Não",
                "Mentir"
            ]
        }
    ]
    for d in dialogos:
        print(d["fala"])
        for o in d["opcoes"]:
            print(" - %s" % o)
