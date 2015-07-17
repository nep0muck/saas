class ContactsController < ApplicationController
    def new
        # Create new, empty contact object
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            # Prepare variables for email
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
            
            # Sending Mails via File ContactMailer -> Action contact_email
            ContactMailer.contact_email(name, email, body).deliver
            
            flash[:success] = 'Message sent successfully.'
            redirect_to new_contact_path
        else
            flash[:danger] = 'Error occured, message has not been sent.'
            redirect_to new_contact_path
        end
    end
    
    private
        def contact_params
            # Security for forms
            params.require(:contact).permit(:name, :email, :comments)
        end
end