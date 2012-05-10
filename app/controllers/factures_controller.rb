class FacturesController < ApplicationController
  def index
    @factures = Facture.all
  end

  def show
    @facture = Facture.find(params[:id])
  end

  def new
    @facture = Facture.new
    @titre = "Nouvelle facture"
    3.times do champ = @facture.champs.build  end
  end

  def create
    @facture = Facture.new(params[:facture])
    if @facture.save
      flash[:notice] = "Successfully created facture."
      redirect_to @facture
    else
      render :action => 'new'
    end
  end

  def edit
    @facture = Facture.find(params[:id])
  end

  def update
    @facture = Facture.find(params[:id])
    if @facture.update_attributes(params[:facture])
      flash[:notice] = "Successfully updated facture."
      redirect_to @facture
    else
      render :action => 'edit'
    end
  end

  def destroy
    @facture = Facture.find(params[:id])
    @facture.destroy
    flash[:notice] = "Successfully destroyed facture."
    redirect_to factures_url
  end


  end
