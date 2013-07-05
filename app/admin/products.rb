#encoding=UTF-8
ActiveAdmin.register Product do
  index do                            
    column 'Nome', :name                     
    #column 'Título', :title
    column 'Preço', :price
    column 'Desconto', :discount
    #column 'Descrição', :description        
    column 'Imagem' do |prod|
      link_to(image_tag(prod.cover_image.thumb('100x100').url), admin_product_path(prod)) if prod.cover_image
    end
    column 'Disp.', :available_on           
    column 'Excluído', :deleted_at  

    default_actions                   
  end               

  filter :name
  filter :title
  filter :available_on
  filter :deleted_at                       

  form do |f|                         
    f.inputs "Detalhes do Produto" do       
      f.input :name                  
      f.input :title
      f.input :price, :as => :number
      f.input :discount
      f.input :categoria
      f.input :marca
      f.input :estoque
      f.input :color
      f.input :tamanho
      f.input :cover_image, :as => :file
      f.input :description, :as => :wysihtml5
      f.input :available_on, :as => :datetime
    end                               
    f.actions                         
  end  

  show do |prod|
    attributes_table do
      row :name
      row :title
      row :price
      row :discount
      row :categoria
      row :marca
      row :estoque
      row :color
      row :tamanho
      row 'Imagem', :image do
        image_tag(prod.cover_image.thumb('100x100').url) if prod.cover_image
      end
      row :description do |prod|
      	raw prod.description
      end
      row :available_on
      row :deleted_at
    end
    active_admin_comments
  end

end
#:name, :description, :available_on, :deleted_at, :permalink, :meta_description, :meta_keywords, :count_on_hand