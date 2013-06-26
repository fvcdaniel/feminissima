ActiveAdmin.register Gallery do
  form multipart: true do |f|
    f.inputs do
      f.input :product, :prompt => 'Selecione'
      #f.input :name
      f.has_many :images do |p|
        p.input :name
        if p.object.new_record?
          p.input :picture, :hint => p.template.content_tag(:span, "no map yet")
        else 
          p.input :picture, :hint => p.template.image_tag(p.object.picture.url(:thumb))
        end

      end
    end
    f.actions
  end

  index do     
    selectable_column           
    column :id
    column :product
    default_actions                   
  end  

	show do |gallery|
	  attributes_table do
		   
       row :picture do
			  
			    gallery.images.each do |img|
            #row :name
			      div do 
			        image_tag img.picture.url(:thumb), :data => { :original => img.picture.url(:original)}
			      end
			    end
		  
	    end
	  end
	end


end