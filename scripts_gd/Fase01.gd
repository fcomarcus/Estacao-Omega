
extends Node2D

var fase_nome = ""
var eventos_aleatorios = []
var dialogos = []
var escolha_atual = ""

func _ready():
    carregar_dados_json("res://scripts_json/Fase01.json")
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
    var ambiente = get_node("Ambiente")
    ambiente.text += "\nEntrando em %s..." % fase_nome

func gerar_eventos():
    if eventos_aleatorios.size() > 0:
        var evento = eventos_aleatorios[randi() % eventos_aleatorios.size()]
        print("Evento aleatório: %s" % evento)

func iniciar_dialogos():
    for d in dialogos:
        var dialogo_label = get_node("Dialogo")
        dialogo_label.text = d["fala"]

        var menu = get_node("Escolhas")
        menu.clear()
        for i in range(d["opcoes"].size()):
            menu.add_item(d["opcoes"][i], i)
        menu.connect("id_pressed", Callable(self, "_on_opcao_selecionada").bind(d["opcoes"]))
        menu.popup()

func _on_opcao_selecionada(id, opcoes):
    escolha_atual = opcoes[id]
    print("Escolha feita: %s" % escolha_atual)

    var file = FileAccess.open("res://scripts_json/consequencias_dialogos.json", FileAccess.READ)
    var conteudo = file.get_as_text()
    var consequencias = JSON.parse_string(conteudo)
    var consequencia = consequencias[escolha_atual]

    var rastreador = preload("res://scripts_gd/rastreamento.gd").new()
    rastreador.registrar_escolha(fase_nome, escolha_atual, consequencia)
