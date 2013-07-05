ActiveAdmin.register Categoria do
  
  index do                            
    column :id
    column :menu
    column 'Nome', :name
    column 'Categoria', :categoria
    column :created_at
    column :updated_at
    
    default_actions                   
  end  

end