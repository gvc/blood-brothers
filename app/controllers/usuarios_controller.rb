class UsuariosController < ApplicationController
  def index
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    
    if @usuario.save
      flash[:sucesso] = 'Cadastro efetuado com sucesso'
      redirect_to :root
    else
      render action: :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

end
