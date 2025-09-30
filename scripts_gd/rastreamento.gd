
extends Node

var caminho_json = "res://scripts_json/rastreamento_escolhas.json"

func registrar_escolha(fase_nome: String, escolha: String, consequencia: String) -> void:
    var dados = {}
    var file = FileAccess.open(caminho_json, FileAccess.READ)
    if file:
        var texto = file.get_as_text()
        var json = JSON.parse_string(texto)
        if typeof(json) == TYPE_DICTIONARY:
            dados = json
    file = FileAccess.open(caminho_json, FileAccess.WRITE)
    if file:
        dados[fase_nome] = {
            "escolha": escolha,
            "consequencia": consequencia
        }
        file.store_string(JSON.stringify(dados, "	"))
