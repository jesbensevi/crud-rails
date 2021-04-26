Rails.application.routes.draw do
  get 'postres/index' => 'postres#index' # Ruta de la vista principal de los registros 
  get 'postres/read/:url', to: 'postres#read' # Ruta de la vista leer o ver los detalles de un registro 
  get 'postres/create' => 'postres#create' # Ruta de la vista para crear un registro 
  post 'postres/insert' => 'postres#insert' # Ruta que procesa la creación de un registro en la base de datos 
  get 'postres/update/:id', to: 'postres#update' # Ruta de la vista para actualizar un registro 
  post 'postres/editar/:id', to: 'postres#editar' # Ruta que procesa la actualización de un registro en la base de datos 
  post 'postres/delete/:id', to: 'postres#delete' # Ruta para eliminar un registro de la base de datos 

end
