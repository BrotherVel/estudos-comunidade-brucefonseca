#Criando um dicionario com preços e tempo de manutenção 

precos_manutencao = { 
    "Troca de Óleo": 50, 
    "Filtro de Ar": 20, 
    "Pastilhas de Freio": 80, 
    "Bateria": 100,
    "Alinhamento": 60
}

tempo_manutencao = { 
    "Troca de Óleo": 30, 
    "Filtro de Ar": 15, 
    "Pastilhas de Freio": 45, 
    "Bateria": 60,
    "Alinhamento": 40
}

# Função para calcular o custo total da manutenção

pedido_servico = ["Pastilhas de Freio", "Alinhamento"]

def calcular_precos(pedidos):

    valor_total = 0

    for pedido in pedidos:
        for servico, precos in precos_manutencao.items():
            if pedido == servico:
                valor_total += precos
                break

    return valor_total


# Função para calcular o custo total da manutenção

def calcular_tempo(pedidos):

    tempo_total = 0
    for pedido in pedidos:
        for servico, tempo in tempo_manutencao.items():
            if pedido == servico:
                tempo_total += tempo
                break

    return tempo_total

# Função principal para fazer o pedido de manutenção

def validacao(verificar):
    
    validado = False

    if verificar in precos_manutencao :
        validado = True
    
    return validado

# coverter min em horas

def calcularHoras(tempo):
    if tempo >= 60:
        
        horas = tempo // 60
        min = tempo % 60

        if min > 0:
            tempoTotal = f"{horas}h{min}m"
        else: 
            tempoTotal = f"{horas}h"

        return tempoTotal
    else:
        return tempo
    
# Função mestre

def Servico_Manutencao():
    print("Lista de Serviços de Manutenção:")

    contador = 1

    for lista in precos_manutencao:
        print(contador, "-", lista)
        contador += 1

    deseja_contratar_servico = input("Deseja contratar algum serviço? (s/n)")
    print("Deseja contratar algum serviço? (s/n)")
    print(deseja_contratar_servico)

    while True:

        if deseja_contratar_servico == "s":

            pedidos_servicos = []

            while True:

                pedido = input("Digite o nome do serviço")

                pedidos_servicos.append(str(pedido)) 
                
                validado = validacao(pedido)

                if validado == True:

                    print(f"Foi adicionado o serviço \'{pedido}\' ao carrinho")
                    continuar = "s"
                    print("Deseja adicionar mais algum serviço? (s/n)")
                    continuar = input("Deseja adicionar mais algum serviço? (s/n)")             

                    if continuar != "s":
                        print("Então vamos continuar para a próxima etápa !!")
                        break
                    else:
                        print("Sim ?! então adicione o proximo serviço desejado :D")
                    
                else:
                    print("Não temos esse serviço :( insira novamente")
                    pedidos_servicos.remove(pedido)

            print()
            print("Consulte a tabela com o valor e o tempo de manutenção totais:") 
            print()
            print(f"{'Índice':<10} | {'Item':<20} | {'Preço':<13} | {'Tempo ':<10}")
            print("-" * 70)

            indice = 1

            for item in pedidos_servicos:

                print(f"{indice:<10} | {item:<20} | R$ {precos_manutencao[item]:<10} | {tempo_manutencao[item]} min")
                indice += 1

            print("-" * 70)

            time = calcular_tempo(pedidos_servicos) 
            price_total = calcular_precos(pedidos_servicos)
            print(f"{' ':<10} | {'Total':<20} | R$ {price_total:<10} | {calcularHoras(time)}")
            
            break

        elif deseja_contratar_servico == "n":
            print("Obrigado por consultar nossos serviços!!!")
            break
        else:
            print("insira um valor válido")
            deseja_contratar_servico = input("Deseja contratar algum serviço? (s/n)")
