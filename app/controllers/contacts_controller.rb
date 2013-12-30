class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to @contact, notice: 'The Inquiry was successfully submitted!'
    else
      render action: 'new'
    end
  end

  def show
    set_contact
  end

  def index
    @contacts = Contact.all
  end

  def destroy
    if Contact.destroy(params[:id])
      redirect_to contacts_path
    else
      redirect_to contacts_path, notice: 'WARNING: The contact inquiry was not deleted'
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :email, :last_name, :subject, :description)
  end
end
