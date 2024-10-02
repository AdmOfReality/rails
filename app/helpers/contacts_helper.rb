module ContactsHelper
  def email_us
    link_to 'Свяжитесь с нами', contact_path, target: :_blank, rel: :noopener
  end
end
