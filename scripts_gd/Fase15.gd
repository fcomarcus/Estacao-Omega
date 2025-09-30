
extends Node2D

var finais = {}
var escolhas = {}
var final_id = ""
var caminho_escolhas = "res://scripts_json/rastreamento_escolhas.json"
var caminho_finais = "res://scripts_json/finais_narrativos.json"

func _ready():
    carregar_finais()
    carregar_escolhas()
    definir_final()
    mostrar_final()

func carregar_finais():
    var file = FileAccess.open(caminho_finais, FileAccess.READ)
    if file:
        var texto = file.get_as_text()
        finais = JSON.parse_string(texto)

func carregar_escolhas():
    var file = FileAccess.open(caminho_escolhas, FileAccess.READ)
    if file:
        var texto = file.get_as_text()
        escolhas = JSON.parse_string(texto)

func definir_final():
    var contagem = {"Sim": 0, "Não": 0, "Mentir": 0}
    for fase in escolhas.keys():
        var escolha = escolhas[fase]["escolha"]
        if escolha in contagem:
            contagem[escolha] += 1
    if contagem["Sim"] >= 8:
        final_id = "final_1"
    elif contagem["Não"] >= 8:
        final_id = "final_2"
    elif contagem["Mentir"] >= 8:
        final_id = "final_4"
    else:
        final_id = "final_3"

func mostrar_final():
    var texto = finais.get(final_id, "Final desconhecido.")
    print("\n==============================")
    print("DESFECHO FINAL:")
    print("==============================")
    print(texto)
    print("==============================\n")
