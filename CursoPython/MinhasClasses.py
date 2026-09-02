class Carro():

    def __init__(self, modelo, marca, cor, ano):
        self.modelo = modelo
        self.marca = marca
        self.cor = cor
        self.ano = ano
        self.ligado = False

    def set_modelo(self, Modelo):
        self.modelo = Modelo

    def get_modelo(self):
        return self.modelo

    def set_marca(self, Marca):
        self.marca = Marca

    def get_marca(self):
        return self.marca
    
    def set_cor(self, Cor):
        self.cor = Cor

    def get_cor(self):
        return self.cor

    def set_ano(self, Ano):
        self.ano = Ano

    def get_ano(self):
        return self.ano

    def get_info_carro(self):
        return self.ligado

    def set_ligado(self, status):
        self.ligado = status
