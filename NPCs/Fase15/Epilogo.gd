
extends Node

func _ready():
    print("Fase 15 – Epílogo iniciada.")
    iniciar_epilogo()

func iniciar_epilogo():
    var decisao = obter_decisao_final()
    match decisao:
        "finalizar_missao":
            desativar_sistemas()
        "transmitir_dados":
            transmitir_para_terra()
        "reiniciar_estacao":
            reiniciar_estacao()
        _:
            print("Decisão inválida.")

func obter_decisao_final():
    # Esta função deve ser conectada ao sistema de diálogo
    return "finalizar_missao"  # Exemplo de retorno

func desativar_sistemas():
    print("Desativando sistemas da Estação-Ômega...")
    # Lógica de encerramento

func transmitir_para_terra():
    print("Transmitindo dados para a Terra...")
    # Lógica de transmissão

func reiniciar_estacao():
    print("Reiniciando Estação-Ômega para nova missão...")
    # Lógica de reinício
