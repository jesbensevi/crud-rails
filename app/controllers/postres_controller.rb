class PostresController < ApplicationController
 
 @root_url = "/postre/index"
 layout 'application'
 
 add_flash_types :notice

 #listar todos los elementos de la bd
  def index
    @postres = Postre.all()
  end

#Leer detalles de un registro
  def read
    @postres = params[:url]
    @postres = Postre.where(url: @postres)
  end

#Llama a la vista con el formulario para crear un registro
  def create
    @postres = Postre.new
  end

  def insert
    uploaded_file = params[:url]
    File.open(Rails.root.join('public', 'assets/img', uploaded_file.original_filename), 'wb') do |file| 
      file.write(uploaded_file.read)
    end

    @postres = Postre.new(parametros)

    if @postres.save

      postres.update_column(:img, uploaded_file.original_filename)

    else

      render :new
    end

    # Redireccionamos a la vista principal con mensaje 
    @ini = "/postres/index"
    flash[:notice] = "Creado Correctamente !"
    redirect_to @ini 

  end



  def update
    @postres = Postre.find(params[:id])
    @postres = Postre.where(id: @postres)
  end



  # Procesamos la actualización de un registro en la base de datos 
  def editar
 
    # Pasamos el 'id' del registro a actualizar (método editar)    
    @postres = Postre.find(params[:id])    
 
    # Actualizamos el Archivo al servidor
    uploaded_file = params[:img]
 
    if params[:img].present?
 
      # Eliminamos el archivo (imagen) anterior 
      simg = Postre.where(:id => @postres).pluck(:img)    
      imgeliminar = Rails.root.join('public', 'assets/img', simg.join)
      File.delete(Rails.root + imgeliminar)
 
      # Subimos el nuevo archivo (imagen) 
      File.open(Rails.root.join('public', 'assets/img', uploaded_file.original_filename), 'wb') do |file|
          file.write(uploaded_file.read)
      end
 
    else
      #
    end  
    
    # Actualizamos un determinado registro en la base de datos
    if @postres.update(parametros)
      
      # Actualizamos la columna 'img' de la base de datos
      if params[:img].present?
        @postres.update_column(:img, uploaded_file.original_filename)
      else
        #
      end          
 
    else
      render :edit
    end
 
      # Redireccionamos a la vista principal con mensaje 
      @ini = "/postres/index"
      flash[:notice] = "Actualizado Correctamente !"
      redirect_to @ini 
  end



  def delete
    
    # Eliminamos un determinado registro en la base de datos, pasamos el 'id' del registro a eliminar
    @postres = Postre.find(params[:id])
 
    # Eliminamos la imagen perteneciente al registro 
    simg = Postre.where(:id => @postres).pluck(:img)    
    imgeliminar = Rails.root.join('public', 'assets/img', simg.join)
    File.delete(Rails.root + imgeliminar)
 
    Postre.where(id: @postres ).destroy_all    
    
    # Redireccionamos a la vista principal con mensaje 
    @ini = "/postres/index"
    flash[:notice] = "Eliminado Correctamente !"
    redirect_to @ini 
 
  end

  # Parámetros o campos que insertamos o actualizamos en la base de datos 
  private
  def parametros
  	params.permit(:nombre, :precio, :stock, :img, :url)
  end
end
