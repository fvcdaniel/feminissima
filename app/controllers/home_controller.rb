#encoding=UTF-8
class HomeController < ApplicationController
	def index
		@catPrincipais = Menu.where(:name => 'Menu Principal').first.categorias.where(:categoria_id => nil).sort
		@catJoias = Menu.where(:name => 'Jóias').first.categorias.where(:categoria_id => nil).sort
		@marcas = Marca.all.sort
		@tamanhos = Tamanho.all.sort
	end
end
