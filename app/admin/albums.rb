ActiveAdmin.register Album do
  
  index do                            
    column 'Produto', :product
    column 'Nome', :name
    column 'Capa', :capa                     
    column 'Imagem' do |prod|
      link_to(image_tag(prod.cover_image.thumb('100x100').url), admin_product_path(prod)) if prod.cover_image
    end

    default_actions                   
  end   

  form do |f|                         
    f.inputs "Detalhes do Album" do       
      f.input :product
      f.input :name                  
      f.input :cover_image, :as => :file
      f.input :capa
    end                               
    f.actions                         
  end  

end