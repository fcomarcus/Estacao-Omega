extends Node2D

var fase_nome = ""
var eventos_aleatorios = []
var dialogos = []

func _ready():
    carregar_dados_json("res://scripts_json/Fase10.json")
    iniciar_ambiente()
    gerar_eventos()
    iniciar_dialogos()

func carregar_dados_json(caminho):
    var file = FileAccess.open(caminho, FileAccess.READ)
    if file:
        var conteudo = file.get_as_text()
        var dados = JSON.parse_string(conteudo)
        fase_nome = dados["fase_nome"]
        eventos_aleatorios = dados["eventos_aleatorios"]
        dialogos = dados["dialogos"]

func iniciar_ambiente():
    print("Entrando em %s..." % fase_nome)

func gerar_eventos():
    if eventos_aleatorios.size() > 0:
        var evento = eventos_aleatorios[randi() % eventos_aleatorios.size()]
        print("Evento aleatório: %s" % evento)

func iniciar_dialogos():
    for d in dialogos:
        print(d["fala"])
        for o in d["opcoes"]:
            print(" - %s" % o)

        # Exemplo de escolha feita pelo jogador (substituir por lógica real de input)
        var escolha_feita = d["opcoes"][0]  # ← substitua por input real do jogador

        # Carregar consequências
        var file = FileAccess.open("res://scripts_json/consequencias_dialogos.json", FileAccess.READ)
        var conteudo = file.get_as_text()
        var consequencias = JSON.parse_string(conteudo)
        var consequencia = consequencias[escolha_feita]

        # Registrar escolha
        var rastreador = preload("res://scripts_gd/rastreamento.gd").new()
        rastreador.registrar_escolha(fase_nome, escolha_feita, consequencia)
